package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Message;
import com.dao.MessageDatabase;

/**
 * Servlet implementation class MessageServlet
 */
@WebServlet("/MessageServlet")
public class MessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String message = request.getParameter("message");
		String id = request.getParameter("index");
		String type = request.getParameter("type");
		
		if(type.equals("save")){
			save(message, id, response);
		}
		else if(type.equals("publish")){
			publish(message, id, response);
		}
		else{
			throw new RuntimeException("404,Error Path......");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void save(String message, String id, HttpServletResponse response) throws IOException{
		Message mess = MessageDatabase.getCurrentMessage(Integer.parseInt(id));
		//mess.setMessageTempDetailed(message);
		MessageDatabase.updateMessage(mess);
		System.out.println("SAVE MESSAGE CALLED");
		response.sendRedirect("MessageEditTab.jsp");
	}
	
	private void publish(String message, String id, HttpServletResponse response) throws IOException{
		Message mess = MessageDatabase.getCurrentMessage(Integer.parseInt(id));
		//mess.setMessageDetailed(message);
		MessageDatabase.updateMessage(mess);
		System.out.println("PUBLISH MESSAGE CALLED");
		response.sendRedirect("MessageEditTab.jsp");
	}

}
