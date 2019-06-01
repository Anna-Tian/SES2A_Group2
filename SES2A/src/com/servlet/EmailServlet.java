package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.ConfirmationEmail;
import com.dao.emailDao;
import com.util.MailUtils;

/**
 * Servlet implementation class EmailServlet
 */
@WebServlet(urlPatterns= {"/EmailServlet","/EmailServlet_publish","/EmailServlet_sendEmail", "/EmailServlet_update"})
public class EmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private emailDao eDao = new emailDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String servletPath = request.getServletPath();
		if("/EmailServlet".equals(servletPath)){
			Email(request, response);
		}else if("/EmailServlet_update".equals(servletPath)) {
			emailUpdate(request, response);
		}else if("/EmailServlet_publish".equals(servletPath)){
			emailPublish(request, response);
		}else if("/EmailServlet_sendEmail".equals(servletPath)){
			emailSend(request, response);
		}else {
			
		}
		
	}
	
	private void emailSend(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter writer = response.getWriter();
		try {
			String toEmail = "12879678@student.uts.edu.au"; //"12879678"+"@student.uts.edu.au"
			
			String emailTemplate = request.getParameter("emailTemplate");
			   
			   String sendTime = "";
			   Date date = new Date();
			   SimpleDateFormat u = new SimpleDateFormat("HH:mm aa dd-MM-yyyy ");
			   sendTime = u.format(date);
			   
			   emailTemplate = emailTemplate.replace("[% datetime %]", sendTime);
			   
			   MailUtils.sendMail(toEmail, emailTemplate);
			writer.print("true");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			writer.print("false");
			e.printStackTrace();
		}
		
	}
	
	private void emailUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		PrintWriter writer = response.getWriter();
		String emailId = request.getParameter("emailId");
		
		String updateTime = "";
		Date date = new Date();
		SimpleDateFormat u = new SimpleDateFormat("dd/MM/yyyy HH:mm aa");
		updateTime = u.format(date);
		ConfirmationEmail email = eDao.updateEmail(Integer.parseInt(emailId),updateTime);
		writer.print(email.getUpdateTime());
	}

	private void emailPublish(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter writer = response.getWriter();
		String emailId = request.getParameter("emailId");
		String emailTemplate = request.getParameter("emailTemplate");
		
		String publishTime = "";
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm aa");/*("yyyy-MM-dd HH:mm:ss aa")*/
		publishTime = sdf.format(date);
//		System.out.println(publishTime);
		
//		boolean flag = eDao.updateEmail(Integer.parseInt(emailId), emailTemplate);
//		if(flag) {
//			writer.print("true");
//		}else {
//			writer.print("false");
//		}
		ConfirmationEmail email = eDao.publishEmail(Integer.parseInt(emailId), emailTemplate,publishTime);
		writer.print(email.getPublishTime());
		
	}

	private void Email(HttpServletRequest request, HttpServletResponse response) throws IOException {		
		PrintWriter writer = response.getWriter();
		Integer emailId = Integer.parseInt(request.getParameter("emailId"));
		ConfirmationEmail email = eDao.getCurrentEmail(emailId);
		//request.getSession().setAttribute("emailContent",email.getTemplate());
//		System.out.println("111111111111: "+email.getConfirmationId());
		if(email.getPublishTime()!= null && email.getUpdateTime()!=null) {
			writer.print(email.getTemplate()+"$"+email.getPublishTime()+"$"+email.getUpdateTime());			
		}else if(email.getPublishTime()== null && email.getUpdateTime()!=null) {
			writer.print(email.getTemplate()+"$"+"Never publishes$"+email.getUpdateTime());
		}else if(email.getPublishTime()!= null && email.getUpdateTime()==null) {
			writer.print(email.getTemplate()+"$"+email.getUpdateTime()+"$Never updates");
		}else {
			writer.print(email.getTemplate()+"$"+"Never publishes$Never updates");	
		}
//		writer.print(email.getTemplate()+"$"+email.getPublishTime()+"$"+email.getUpdateTime());
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
