package com.advisor;

import org.springframework.stereotype.*;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bean.Advisor;

import java.util.*;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping(value = "SES2A")
public class advisorUpdate {
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		AdvisorModel advisorModel = new AdvisorModel();
		return "index";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String update(HttpServletRequest request) {
		AdvisorModel advisorModel = new AdvisorModel();
		String[] advisorid = request.getParameterValues("advisorId");
        String[] staffnumber = request.getParameterValues("staffNumber");
        String[] firstname = request.getParameterValues("firstName");
        String[] lastname = request.getParameterValues("lastName");
        String[] email = request.getParameterValues("email");
        for (int i = 0; i < advisorid.length; i++) {
        	Advisor advisor = advisorModel.find(Integer.valueOf(advisorid[i]));
        	advisor.setStaffNumber(staffnumber[i]);
        	advisor.setFirstName(firstname[i]);
        	advisor.setLastName(lastname[i]);
        	advisor.setEmail(email[i]);
        }
		return "redirect:AdvisorsTab.html";
	}
}
