package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.WorkShop;
import com.dao.WorkshopRegistrationDao;

/**
 * Servlet implementation class DetailsServlet
 */
@WebServlet("/DetailsServlet")
public class DetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private WorkshopRegistrationDao workshopRegistrationDao = new WorkshopRegistrationDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println(11111);
		List<WorkShop> list = (new WorkshopRegistrationDao()).test1();
		
		System.out.println("qqqqqq: "+request.getParameter("session1"));
		Integer workShop_id = Integer.parseInt(request.getParameter("session1"));
		System.out.println("qqq: "+workShop_id);
		WorkShop workShop = workshopRegistrationDao.findWorkshopById(workShop_id);
		System.out.println("qqq: "+workShop);
		request.getSession().setAttribute("workShop",workShop);
		
		
		response.sendRedirect("WR_Details_new.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
