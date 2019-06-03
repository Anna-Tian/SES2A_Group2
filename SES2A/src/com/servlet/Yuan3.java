package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Student;
import com.dao.impl.StudentProfileImpl;

/**
 * Servlet implementation class Yuan3
 */
@WebServlet("/Yuan3")
public class Yuan3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private StudentProfileImpl spi = new StudentProfileImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Yuan3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter writer = response.getWriter();
		Integer studentId = Integer.parseInt((String) request.getAttribute("studentId"));
		Student student = spi.getCurrentStudent(studentId);
		request.getSession().setAttribute("student", student);
		request.getSession().setAttribute("studentProfile", student.getStudentProfile());
		writer.print("true");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
