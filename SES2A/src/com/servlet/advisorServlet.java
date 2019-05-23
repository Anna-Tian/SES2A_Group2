package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.advisorDao;

public class advisorServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		String[] checkbx = request.getParameterValues("chk");

		if (action.equalsIgnoreCase("Add")) {
			try {
				for (int i = 1; i < 4; i++) {
					String staffnumber = request.getParameter("staffnumberadd"+i);
					String firstname = request.getParameter("firstnameadd"+i);
					String lastname = request.getParameter("lastnameadd"+i);
					String email = request.getParameter("emailadd"+i);
//                if (!staffnumber.isEmpty() && !firstname.isEmpty() && !lastname.isEmpty() && !email.isEmpty() ) {
					advisorDao AdvisorDAO = new advisorDao();
					AdvisorDAO.add(staffnumber, firstname, lastname, email);
					System.out.println("Advisors Added successfully.....!!");
					response.sendRedirect("AdvisorsTab.jsp");
                	}
//				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
// Servlet action to get unique advisorId with the corresponding data to Update when action with value "Update" is called
		} else if (action.equalsIgnoreCase("Update")) {
			// Loop all ID that is checked using checkbox array
			for (int i = 0; i < checkbx.length; i++) {

				String staffnumberupdate = request.getParameter("staffno_" + checkbx[i]);
				String firstnameupdate = request.getParameter("fname_" + checkbx[i]);
				String lastnameupdate = request.getParameter("lname_" + checkbx[i]);
				String emailupdate = request.getParameter("staffemail_" + checkbx[i]);
				// Pass the data retrieved into UPDATE function in AdvisorDao
				try {
					advisorDao AdvisorDAO = new advisorDao();
					AdvisorDAO.update(Integer.valueOf(checkbx[i]), staffnumberupdate, firstnameupdate,lastnameupdate, emailupdate);
					System.out.println("Advisors Updated successfully.....!!");
					response.sendRedirect("AdvisorsTab.jsp");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			
// Servlet action to get unique advisorId to Delete when action with value "Delete" is called
		} else if (action.equalsIgnoreCase("Delete")) {
			// Loop all ID that is checked using checkbox array
			for (int i = 0; i < checkbx.length; i++) {
				// Pass the data retrieved into DELETE function in AdvisorDao
				try {
					advisorDao AdvisorDao = new advisorDao();
					AdvisorDao.delete(Integer.valueOf(checkbx[i]));
					System.out.println("Advisors Deleted successfully.....!!");
					response.sendRedirect("AdvisorsTab.jsp");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			
// Servlet action to get unique advisorId to Inactivate Advisors when action with value "Inactivate" is called			
		} else if (action.equalsIgnoreCase("Inactive")) {
			// Loop all ID that is checked using checkbox array
			for (int i = 0; i < checkbx.length; i++) {
				// Pass the data retrieved into INACTIVE function in AdvisorDao
				try {
					advisorDao AdvisorDao = new advisorDao();
					AdvisorDao.inactive(Integer.valueOf(checkbx[i]));
					System.out.println("Advisors Inactivated successfully.....!!");
					response.sendRedirect("AdvisorsTab.jsp");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			
// Servlet action to get unique advisorId to Activate Advisors when action with value "Activate" is called			
		} else if (action.equalsIgnoreCase("Active")) {
			// Loop all ID that is checked using checkbox array
			for (int i = 0; i < checkbx.length; i++) {
				// Pass the data retrieved into ACTIVE function in AdvisorDao
				try {
					advisorDao AdvisorDao = new advisorDao();
					AdvisorDao.active(Integer.valueOf(checkbx[i]));
					System.out.println("Advisors Activated successfully.....!!");
					response.sendRedirect("AdvisorsTab.jsp");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}