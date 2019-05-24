package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.dao.saveRoom;
/**
 * Servlet implementation class roomServlet
 */
@WebServlet("/roomServlet")
public class roomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public roomServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] chkBox = request.getParameterValues("roomId");
		String action = request.getParameter("action");
	
		if(action.equalsIgnoreCase("Delete"))
		for (int i = 0; i<chkBox.length; i++)
		{
			if(chkBox != null)
			{
				try {
					saveRoom room = new saveRoom();
					room.deleteRoom(Integer.valueOf(chkBox[i]));
					System.out.println("DELETED");
					response.sendRedirect("roomIndex.jsp");	
				}
				
				catch (Exception e)
				{
					e.printStackTrace();
				}
				
			}
		}
		
		else if(action.equalsIgnoreCase("Update")) {
		for (int i=0; i<chkBox.length; i++)
		{		
			String updated = request.getParameter("roomNumber_" + chkBox[i]);
			
			try {
				saveRoom room = new saveRoom();
				room.updateRoom(Integer.valueOf(chkBox[i]), updated);
				System.out.println("UPDATED");
				response.sendRedirect("roomIndex.jsp");
				}
			
			catch (Exception e){
				e.printStackTrace();
			}
					
		}
			
		}
		
		else if(action.equalsIgnoreCase("Add")) {
					
			
				
			try {
				String added = request.getParameter("roomLocation");
				
				if(!added.isEmpty())
				{
					saveRoom room = new saveRoom();
					room.addRoom(added);
					System.out.println("ADDED");
					response.sendRedirect("roomIndex.jsp");
				}
				else
				{
					PrintWriter out = response.getWriter();  
					response.setContentType("text/html");  
					out.println("<script type=\"text/javascript\">");  
					out.println("alert('Please enter room number');");  
					out.println("</script>");
					
					if(response.isCommitted())
					{
					response.sendRedirect("roomIndex.jsp");
					}
					
				}
			}
				
			catch (Exception e){
				e.printStackTrace();
				}
				
			}
	}
	
}

			
	


