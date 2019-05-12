package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Student;

/**
 * Servlet implementation class StuLogin
 */
@WebServlet("/StuLogin")
public class StuLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private com.dao.StuLogin sLogin = new com.dao.StuLogin();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StuLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String servletPath = request.getServletPath();
		  if("/StuLogin".equals(servletPath)) {
			  stuLogin(request,response);
		  }
	}

	private void stuLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Integer username = Integer.parseInt(request.getParameter("username"));
		String password = request.getParameter("password");
		System.out.println("Test: "+username+", "+password);
		Student student = sLogin.findStudentByIP(username, password);
		if(student!=null) {
			request.getSession().setAttribute("student", student);
			request.getSession().setAttribute("msg", null);
			response.sendRedirect("index.jsp");//Load the index page if login successfully. I will modify it when merging because u dont have the myinformation.jsp now.
		}else {
			request.getSession().setAttribute("msg", "Please check your account and password");
			response.sendRedirect("stu_login.jsp");
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
