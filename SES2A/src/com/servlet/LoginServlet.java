package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Student;
import com.dao.TestDaoImpl;

/**
 * Servlet implementation class LoginServlet
 * to be deleted when Lion finished the login part.
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private TestDaoImpl testDaoImpl = new TestDaoImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String servletPath = request.getServletPath();
		if("/LoginServlet".equals(servletPath)) {
			MyInformation(request, response);
		}else {
			throw new RuntimeException("404,Error Path......");
		}
		
	}

	private void MyInformation(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		Student student = testDaoImpl.getCurrentStudent();
		request.getSession().setAttribute("student", student);
		request.getSession().setAttribute("studentProfile", student.getStudentProfile());
		System.out.println(student.getStudentProfile());
		response.sendRedirect("myInformation.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
