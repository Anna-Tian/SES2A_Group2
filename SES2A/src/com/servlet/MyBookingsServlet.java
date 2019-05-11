package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Session;
import com.bean.Student;
import com.bean.WorkShop;
import com.dao.StudentBookings;
import com.dao.StudentProfileDao;
import com.dao.TestDaoImpl;
import com.dao.impl.StudentBookingsImpl;
import com.dao.impl.StudentProfileImpl;
import com.util.MailUtils;

/**
 * Servlet implementation class MyBookingsServlet
 */
@WebServlet(urlPatterns= {"/MyBookingsServlet","/MyBookingsServlet_delete"})

public class MyBookingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private StudentBookings studentBookings = new StudentBookingsImpl();
    private StudentProfileDao studentProfileDao = new StudentProfileImpl();
    private Set<WorkShop> upcoming = null;
	private Set<WorkShop> past = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyBookingsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String servletPath = request.getServletPath();
		if("/MyBookingsServlet".equals(servletPath)) {
			MyBookings(request, response);
		}else if("/MyBookingsServlet_delete".equals(servletPath)){
			deleteBookings(request,response);
		}else {
			throw new RuntimeException("404,Error Path......");
		}
	}

	private void deleteBookings(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		PrintWriter writer = response.getWriter();
		
		Integer workshop_id = Integer.parseInt(request.getParameter("workshop_id"));
		Student student = (Student) request.getSession().getAttribute("student");
		
		boolean flag = studentBookings.removeWorkShop(workshop_id, student.getStudentId());
		
		Student currentStudent = studentProfileDao.getCurrentStudent(student.getStudentId());
		Set<WorkShop> workShops = currentStudent.getWorkShops();

		request.getSession().setAttribute("workShops",null);
		if(workShops!=null&&workShops.size()>0) {
			upcomingPast(workShops);
			if (past!=null&&past.size()>0) {
				request.getSession().setAttribute("past",past);
			}else if (past.size()==0) {
				request.getSession().setAttribute("past",null);
			}
			if (upcoming!=null&&upcoming.size()>0) {
				request.getSession().setAttribute("upcoming",upcoming);
			}else if (upcoming.size()==0) {
				request.getSession().setAttribute("upcoming",null);
			}
		}
		
		if(flag) {
			writer.print("truee");
		}else {
			writer.print("falsee");
		}
		try {
			String toEmail = student.getStudentId()+"@student.uts.edu.au";
			MailUtils.sendMail(toEmail, "Cancel Successfully!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("myBookings.jsp");
	}

	private void MyBookings(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		Student student = (Student) request.getSession().getAttribute("student");
		Student currentStudent = studentProfileDao.getCurrentStudent(student.getStudentId());
		Set<WorkShop> workShops = currentStudent.getWorkShops();
		Set<Session> sessions = currentStudent.getSessions();

		request.getSession().setAttribute("workShops",null);
		request.getSession().setAttribute("sessions",null);
		if(workShops!=null&&workShops.size()>0) {
			upcomingPast(workShops);
			if (past!=null&&past.size()>0) {
				request.getSession().setAttribute("past",past);
			}else if (past.size()==0) {
				request.getSession().setAttribute("past",null);
			}
			if (upcoming!=null&&upcoming.size()>0) {
				request.getSession().setAttribute("upcoming",upcoming);
			}else if (upcoming.size()==0) {
				request.getSession().setAttribute("upcoming",null);
			}
		}
		if(sessions!=null&&sessions.size()>0) {
			request.getSession().setAttribute("sessions",sessions);
		}
		response.sendRedirect("myBookings.jsp");
	}
	private void upcomingPast(Set<WorkShop> workShops) {
		upcoming = new HashSet<WorkShop>();
		past = new HashSet<WorkShop>();
		for(WorkShop workShop: workShops) {
			if(workShop.getEndDate().getTime()<(new Date()).getTime()) {
				past.add(workShop);
			}else{
				upcoming.add(workShop);
			}
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
