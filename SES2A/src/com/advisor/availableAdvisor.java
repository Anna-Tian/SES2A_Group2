//package com.advisor;
//
//import org.springframework.stereotype.*;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import com.bean.Advisor;
//
//import java.util.*;
//
//import javax.servlet.http.HttpServletRequest;
//
//
//@Controller
//@RequestMapping(value = "SES2A")
//public class advisorUpdate {
//	@RequestMapping(method = RequestMethod.GET)
//	public String index(ModelMap modelMap) {
//		AdvisorModel advisorModel = new AdvisorModel();
//		return "index";
//	}
//	
//	@RequestMapping(method = RequestMethod.POST)
//	public String update(HttpServletRequest request) {
//		AdvisorModel advisorModel = new AdvisorModel();
//		String[] advisorid = request.getParameterValues("advisorId");
//        String[] staffnumber = request.getParameterValues("staffNumber");
//        String[] firstname = request.getParameterValues("firstName");
//        String[] lastname = request.getParameterValues("lastName");
//        String[] email = request.getParameterValues("email");
//        for (int i = 0; i < advisorid.length; i++) {
//        	Advisor advisor = advisorModel.find(Integer.valueOf(advisorid[i]));
//        	advisor.setStaffNumber(staffnumber[i]);
//        	advisor.setFirstName(firstname[i]);
//        	advisor.setLastName(lastname[i]);
//        	advisor.setEmail(email[i]);
//        }
//		return "redirect:AdvisorsTab.html";
//	}
//}
package com.advisor;

import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
import com.dao.advisorDao;
 

public class availableAdvisor extends HttpServlet {
    
	
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
 
    	String action = request.getParameter("action");
    	String[] checkbx = request.getParameterValues("chk");
        String staffnumber = request.getParameter("staffno");
        String firstname = request.getParameter("fname");
        String lastname = request.getParameter("lname");
        String email = request.getParameter("staffemail");
        
        if(action.equalsIgnoreCase("Update")) {
        	if(checkbx != null) {
                try {
                    advisorDao AdvisorDAO = new advisorDao();
                    AdvisorDAO.update(staffnumber, firstname, lastname, email);
                    response.sendRedirect("AdvisorsTab.jsp");
                } catch (Exception e) {
         
                    e.printStackTrace();
                }
        	}

        }

 
    }
    
    
}