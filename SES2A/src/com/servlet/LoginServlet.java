package com.servlet;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Student;
import com.bean.StudentProfile;
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
		StudentProfile studentProfile = student.getStudentProfile();
		request.getSession().setAttribute("studentProfile", studentProfile);
		if(studentProfile!=null) {
			String[] eduBg = studentProfile.getEduBg().substring(1,studentProfile.getEduBg().length()-1).split(", ");
			String[] eduBgMark = studentProfile.getEduBgMark().substring(1,studentProfile.getEduBgMark().length()-1).split(", ");
			request.getSession().setAttribute("eduBg", eduBg);
			request.getSession().setAttribute("eduBgMark", eduBgMark);
			System.out.println(Arrays.toString(eduBgMark));
		}
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
