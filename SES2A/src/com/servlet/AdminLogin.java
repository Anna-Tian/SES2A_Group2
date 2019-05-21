package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Admin;
import com.bean.Student;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private com.dao.StuLogin sLogin = new com.dao.StuLogin();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String servletPath = request.getServletPath();
		  if("/AdminLogin".equals(servletPath)) {
			  AdLogin(request,response);
		  }
	}

	private void AdLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		Integer username = Integer.parseInt(request.getParameter("username"));
		String password = request.getParameter("password");
		System.out.println("Test: "+username+", "+password);
		Admin admin = sLogin.findAdminByIP(username, password);
		if(admin!=null) {
			request.getSession().setAttribute("admin", admin);
			request.getSession().setAttribute("msg", null);
			response.sendRedirect("OneToOneSessions.jsp");//Load the index page if login successfully. Other member should modify it to redirect to the real path.
		}else {
			request.getSession().setAttribute("msg", "Please check your account and password");
			response.sendRedirect("adm_login.jsp");
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
