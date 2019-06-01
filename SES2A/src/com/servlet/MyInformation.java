package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bean.*;
import com.dao.StudentProfileDao;
import com.dao.impl.StudentProfileImpl;

/**
 * Servlet implementation class MyInformationServlet
 */
@WebServlet(urlPatterns= {"/MyInformationServlet","/OneToOneProfileServlet"})
public class MyInformation extends HttpServlet {
	private static final long serialVersionUID = 1L; 
    StudentProfileDao studentProfileDao = new StudentProfileImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyInformation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String servletPath = request.getServletPath();
		if("/MyInformationServlet".equals(servletPath)) {
			StudentProfile(request, response);
		}else if("/OneToOneProfileServlet".equals(servletPath)){
			OneToOneProfile(request,response);
		}else {
			throw new RuntimeException("404,Error Path......");
		}
	}

	private void OneToOneProfile(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		PrintWriter writer = response.getWriter();
		
		//int studentId = Integer.parseInt((String) request.getAttribute("student_id"));
		int studentId = 12879678;
		Student student = (new com.dao.StuLogin()).findStudentById(studentId);
		request.getSession().setAttribute("student", student);
		
		StudentProfile studentProfile = student.getStudentProfile();
		request.getSession().setAttribute("studentProfile", studentProfile);
		if(studentProfile!=null) {
			String[] eduBgNew = studentProfile.getEduBg().substring(1,studentProfile.getEduBg().length()-1).split(", ");
			String[] eduBgMarkNew = studentProfile.getEduBgMark().substring(1,studentProfile.getEduBgMark().length()-1).split(", ");
			request.getSession().setAttribute("eduBg", eduBgNew);
			request.getSession().setAttribute("eduBgMark", eduBgMarkNew);
		}
		writer.print("true");
		//response.sendRedirect("StudentProfileDetails.jsp");
		
	}

	private void StudentProfile(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String preferredFirstName = request.getParameter("preferred_name");
		String bestContactNum = request.getParameter("alternativecontact");
		String gender = request.getParameter("rdoGender");
		String degree = request.getParameter("rdoDegree");
		String year = request.getParameter("rdoUGDegreeDetails");
		String type = request.getParameter("rdoPGDegreeDetails");
		String status = request.getParameter("rdoStatus");
		String firstLanguage = request.getParameter("selLang");
		String countryOfOrigin = request.getParameter("selCountry");
		String eduBg = Arrays.toString(request.getParameterValues("ckb"));
		String[] eduBgMarks = request.getParameterValues("txt_mark");
		String eduBgMark = eduBgMarkTrim(eduBgMarks);
		String txtBackground = request.getParameter("txtBackground");
		
		Student student = (Student) request.getSession().getAttribute("student");
		StudentProfile studentProfile = new StudentProfile(null, preferredFirstName, bestContactNum, gender, degree, year, type, status, firstLanguage, countryOfOrigin, eduBgMark, eduBg, student, null, null, null);
		boolean flag = false;
		if(student.getStudentProfile()==null) {
			flag = studentProfileDao.saveStudentProfile(student, studentProfile);
		}else {
			studentProfile.setProfileId(student.getStudentProfile().getProfileId());
			flag = studentProfileDao.saveStudentProfile(student, studentProfile);
		}
		StudentProfile studentProfileNew = student.getStudentProfile();
		request.getSession().setAttribute("studentProfile", studentProfileNew);
		if(studentProfileNew!=null) {
			String[] eduBgNew = studentProfile.getEduBg().substring(1,studentProfile.getEduBg().length()-1).split(", ");
			String[] eduBgMarkNew = studentProfile.getEduBgMark().substring(1,studentProfile.getEduBgMark().length()-1).split(", ");
			request.getSession().setAttribute("eduBg", eduBgNew);
			request.getSession().setAttribute("eduBgMark", eduBgMarkNew);
		}
		if(flag) {
			response.sendRedirect("myInformation.jsp");
		}
	}
	
	public String eduBgMarkTrim(String[] eduBgMarks) {
		StringBuffer sb = new StringBuffer();
	       for(int i=0; i<eduBgMarks.length; i++) {
	           if("".equals(eduBgMarks[i])) {
	               continue;
	           }
	           sb.append(eduBgMarks[i]);
	           if(i != eduBgMarks.length - 1) {
	               sb.append(";");
	           }
	       }
       eduBgMarks = sb.toString().split(";");
       return Arrays.toString(eduBgMarks);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
