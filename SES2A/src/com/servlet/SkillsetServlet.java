package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.SkillSet;
import com.dao.skillsetDao;

/**
 * Servlet implementation class SkillsetServlet
 */
@WebServlet(urlPatterns= {"/SkillsetServlet","/SkillsetServlet_add","/SkillsetServlet_update"})
public class SkillsetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private skillsetDao sDao = new skillsetDao();
    List<SkillSet> skillSet = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SkillsetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String servletPath = request.getServletPath();
		if("/SkillsetServlet".equals(servletPath)){
			skillset(request, response);
		}else if("/SkillsetServlet_add".equals(servletPath)){
			skillsetAdd(request, response);
		}else if("/SkillsetServlet_update".equals(servletPath)){
			skillsetUpdate(request, response);
		}else {
			
		}		
	}

	private void skillsetUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		PrintWriter writer = response.getWriter();
		String skillSetId = request.getParameter("skillSetId");
		String shortName = request.getParameter("shortName");
		boolean flag = sDao.updateSkill(Integer.parseInt(skillSetId),shortName);
		if(flag) {
			writer.print("true");
		}else {
			writer.print("false");
		}
	}

	private void skillsetAdd(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		PrintWriter writer = response.getWriter();
		String name = request.getParameter("name");
		boolean flag = sDao.addSkill(name);
		if(flag) {
			writer.print("true");
		}else {
			writer.print("false");
		}
	}

	private void skillset(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		List<SkillSet> skillSet = sDao.getSkillSet();
		System.out.println("Test: "+skillSet);
		request.getSession().setAttribute("skillSet", skillSet);
		response.sendRedirect("archivedWorkshop.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
