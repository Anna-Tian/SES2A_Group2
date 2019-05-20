package com.servlet;
 
import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.bean.Advisor;
import com.dao.advisorDao;
 

public class advisorServlet extends HttpServlet {
    
	
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
    	
    	String action = request.getParameter("action");
    	String[] checkbx = request.getParameterValues("chk");
        String staffnumberupdate = request.getParameter("staffno");
        String firstnameupdate = request.getParameter("fname");
        String lastnameupdate = request.getParameter("lname");
        String emailupdate = request.getParameter("staffemail");
        if(action.equalsIgnoreCase("Add")) {
        try {
//        	int i;
//        	for(i = 0; i < 3; i++) {
                String staffnumber = request.getParameter("staffnumberadd");
                String firstname = request.getParameter("firstnameadd");
                String lastname = request.getParameter("lastnameadd");
                String email = request.getParameter("emailadd");
//                if (!staffnumber.isEmpty() && !firstname.isEmpty() && !lastname.isEmpty() && !email.isEmpty() ) {
                	advisorDao AdvisorDAO = new advisorDao();
                	AdvisorDAO.add(staffnumber, firstname, lastname, email);
      		  		System.out.println("Object Added successfully.....!!");
      		  		response.sendRedirect("AdvisorsTab.jsp");
//                	}
//        		}
        		}catch (Exception e) {
            		e.printStackTrace(); 
            	}
        	

        }else if (action.equalsIgnoreCase("Update")) {
        	for (int i=0; i < checkbx.length; i++) {
            	if(checkbx != null) {
                	Integer advisorId = Integer.valueOf(request.getParameter("chk"));
                    try {
                        advisorDao AdvisorDAO = new advisorDao();
                        AdvisorDAO.update(Integer.valueOf(checkbx[i]),staffnumberupdate, firstnameupdate, lastnameupdate, emailupdate);
              		    System.out.println("Object Updated successfully.....!!");
                        response.sendRedirect("AdvisorsTab.jsp");
                    } catch (Exception e) {
             
                        e.printStackTrace();
                    }
            	}
        	}

        	
        	

        }else if(action.equalsIgnoreCase("Delete")) {        	
        	Integer advisorId = Integer.valueOf(request.getParameter("chk"));
        	for (int i=0; i < checkbx.length; i++) {
               	if(checkbx != null) {
                    try {
                      advisorDao AdvisorDao = new advisorDao();
                      AdvisorDao.delete(Integer.valueOf(checkbx[i]));
            		  System.out.println("Object Deleted successfully.....!!"); 
                      response.sendRedirect("AdvisorsTab.jsp");


                    }catch (Exception e) {
                            	e.printStackTrace();
                         	}
                    	}
        	}
 
        	}
    	}
    
}