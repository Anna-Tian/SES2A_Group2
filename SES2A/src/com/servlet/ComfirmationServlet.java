package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Room;
import com.bean.Student;
import com.bean.WorkShop;
import com.dao.WorkshopRegistrationDao;
import com.sun.net.httpserver.Authenticator.Success;
import com.util.MailUtils;

/**
 * Servlet implementation class ComfirmationServlet
 */
@WebServlet("/ComfirmationServlet")
public class ComfirmationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private WorkshopRegistrationDao workshopRegistrationDao = new WorkshopRegistrationDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComfirmationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm");
		PrintWriter out = response.getWriter();
		Integer workShop_id = Integer.parseInt(request.getParameter("wid"));
		WorkShop workShop = workshopRegistrationDao.findWorkshopById(workShop_id);
		request.getSession().setAttribute("workShop",workShop);
		Room room = workShop.getRoom();
		System.out.println(room.getRoomLocation());
		request.getSession().setAttribute("room",room);
		String startTime = sdf.format(workShop.getStartDate());
		String mailString = workshopRegistrationDao.stringBuffer(workShop.getName(), workShop.getDays(), startTime, workShop.getRoom().getRoomLocation());
		boolean flag = workshopRegistrationDao.bookingWorkshop(new Student(), workShop);
		System.out.println(flag);
		if(flag) {
			String email = "12990659"+"@student.uts.edu.au";
			request.getSession().setAttribute("eC", email+"_"+mailString);
			out.print(email+"_"+mailString);
		}
		else {
			out.print("false");
		}
//		if(flag) {
//			try {
//				MailUtils.sendMail("liujiachen9702@gmail.com", mailString);
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//		else {
//			out.print("The time of this course conflicts with other selected courses.");
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
