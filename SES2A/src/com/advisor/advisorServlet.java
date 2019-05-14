package com.advisor;
 
import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
import com.dao.advisorDao;
 

public class advisorServlet extends HttpServlet {
    
	
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
 
        String staffnumber = request.getParameter("staffnumberadd");
        String firstname = request.getParameter("firstnameadd");
        String lastname = request.getParameter("lastnameadd");
        String email = request.getParameter("emailadd");

        try {
            advisorDao AdvisorDAO = new advisorDao();
            AdvisorDAO.add(staffnumber, firstname, lastname, email);
            response.sendRedirect("AdvisorsTab.jsp");
        } catch (Exception e) {
 
            e.printStackTrace();
        }
 
    }
    
    
}