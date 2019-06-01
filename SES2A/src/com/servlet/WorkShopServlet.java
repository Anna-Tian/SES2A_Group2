package com.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.base.BaseServlet;
import com.base.Common;
import com.bean.Admin;
import com.bean.Attendance;
import com.bean.Room;
import com.bean.SkillSet;
import com.bean.Student;
import com.bean.WaitingList;
import com.bean.WorkShop;
import com.dao.WorkDao;
import com.util.HibernateUtil;

/**
 * Servlet implementation class WorkShopServlet
 */
@WebServlet(urlPatterns= {"/workshop","/Work2"})
public class WorkShopServlet extends BaseServlet {
	private WorkDao workDao = new WorkDao();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String servletPath = request.getServletPath();
		if("/workshop".equals(servletPath)) {
			workDao.insertSkillSet2(request, response);
		}else if("/Work2".equals(servletPath)) {
			workDao.showWorkShop(request, response);
		}
	}
	
	
	

}
