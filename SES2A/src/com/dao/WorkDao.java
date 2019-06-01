package com.dao;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.base.Common;
import com.bean.Admin;
import com.bean.Attendance;
import com.bean.Room;
import com.bean.SkillSet;
import com.bean.Student;
import com.bean.WaitingList;
import com.bean.WorkShop;
import com.util.HibernateUtil;

public class WorkDao {
	public void toSkillSet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateUtil.getCurrentSession();
		Transaction ts = session.beginTransaction();
		String hql="from SkillSet";
		List<SkillSet> skillSets = session.createQuery(hql).list();
		
		request.getSession().setAttribute("skillSets", skillSets);
		
		//加载 room
		String hql2="from Room";
		List<Room> rooms = session.createQuery(hql2).list();
		request.getSession().setAttribute("rooms", rooms);
		ts.commit();
		response.sendRedirect("setWorkshop.jsp");
	}
	
	public void insertSkillSet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateUtil.getCurrentSession();
		Transaction ts = session.beginTransaction();
		try {
			String name = request.getParameter("name");
			
			SkillSet skillSet = new SkillSet();
			skillSet.setName(name);
			/*替换登陆用户*/
			Admin admin = new Admin();
			admin.setAdminId(Common.admin);
			skillSet.setAdmin(admin);
			/*替换登陆用户*/
			session.save(skillSet);
			
			
			String hql="from SkillSet";
			List<SkillSet> skillSets = session.createQuery(hql).list();
			ts.commit();
			request.getSession().setAttribute("skillSets", skillSets);
			response.sendRedirect("setWorkshop.jsp");
		} catch (Exception e) {
			ts.rollback();
			e.printStackTrace();
		}
	}
	
	public void insertSkillSet2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateUtil.getCurrentSession();
		Transaction ts = session.beginTransaction();
		try {
			String name = request.getParameter("name");
			
			SkillSet skillSet = new SkillSet();
			skillSet.setName(name);
			/*替换登陆用户*/
			Admin admin = (Admin) request.getSession().getAttribute("admin");
			
			skillSet.setAdmin(admin);
			/*替换登陆用户*/
			session.save(skillSet);
			
			
			String hql="from SkillSet";
			List<SkillSet> skillSets = session.createQuery(hql).list();
			ts.commit();
			request.getSession().setAttribute("skillSets", skillSets);
			response.sendRedirect("setWorkshop.jsp");
		} catch (Exception e) {
			ts.rollback();
			e.printStackTrace();
		}
	}
	
	public void updateSkillSet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateUtil.getCurrentSession();
		Transaction ts = session.beginTransaction();
		try {
			String skillSetId = request.getParameter("skillSetId");
			String shortName = request.getParameter("shortName");
			
			SkillSet skillSet = session.get(SkillSet.class, Integer.parseInt(skillSetId));
			skillSet.setShortName(shortName);
			session.save(skillSet);
			
			//String hql="from SkillSet";
			//List<SkillSet> skillSets = session.createQuery(hql).list();
			ts.commit();
			//request.getSession().setAttribute("skillSets", skillSets);
			response.getWriter().print("success");
		} catch (NumberFormatException e) {
			ts.rollback();
			e.printStackTrace();
		}
	}
	
	public void changeSkillSet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateUtil.getCurrentSession();
		Transaction ts = session.beginTransaction();
		try {
			String skillSetId = request.getParameter("skillSetId");
			String shortName = request.getParameter("shortName");
			
			SkillSet skillSet = session.get(SkillSet.class, Integer.parseInt(skillSetId));
			skillSet.setShortName(shortName);
			session.save(skillSet);
			
			//String hql="from SkillSet";
			//List<SkillSet> skillSets = session.createQuery(hql).list();
			ts.commit();
			//request.getSession().setAttribute("skillSets", skillSets);
			response.getWriter().print("success");
		} catch (NumberFormatException e) {
			ts.rollback();
			e.printStackTrace();
		}
	}
	
	
	public void addworkshop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateUtil.getCurrentSession();
		Transaction ts = session.beginTransaction();
		try {
			String ss = request.getParameter("ss");
			String[] arr = ss.split("@");
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
			for(String s:arr){
				String[] fields = s.split(",");
				WorkShop workshop = new WorkShop();
				workshop.setName(fields[0]);//topic
				workshop.setStartDate(sdf.parse(fields[1]));
				workshop.setEndDate(sdf.parse(fields[2]));
				workshop.setMaximumPlace(fields[3]);//MAX
				workshop.setPlaceAvailable(fields[4]);//C/O
				
				Room room = new Room();
				room.setRoomId(Integer.parseInt(fields[5]));
				workshop.setRoom(room);
				
				/*替换登陆用户*/
				Admin admin = new Admin();
				admin.setAdminId(Common.admin);
				workshop.setAdmin(admin);
				/*替换登陆用户*/
				
				SkillSet skillSet = new SkillSet();
				skillSet.setSkillSetId(Integer.parseInt(fields[6]));
				workshop.setSkillSet(skillSet);
				
				session.save(workshop);
			}
			ts.commit();
			response.getWriter().print("success");
		} catch (NumberFormatException | ParseException e) {
			ts.rollback();
			e.printStackTrace();
		}
	}
	
	public void deleteworkshop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateUtil.getCurrentSession();
		Transaction ts = session.beginTransaction();
		try {
			String cks = request.getParameter("cks");
			String[] arr = cks.split(",");
			for(String s:arr){
				WorkShop workshop = new WorkShop();
				workshop.setWorkShopId(Integer.parseInt(s));
				session.delete(workshop);
			}
			ts.commit();
			response.getWriter().print("success");
		} catch (Exception e) {
			ts.rollback();
			e.printStackTrace();
		}
	}
	
	public void showWorkShop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateUtil.getCurrentSession();
		Transaction ts = session.beginTransaction();
		String skillSetId = request.getParameter("skillSetId");
		String hql="from WorkShop where skillSetId=?";
		List<WorkShop> workShops = session.createQuery(hql).setParameter(0, Integer.parseInt(skillSetId)).list();
		ts.commit();
		request.getSession().setAttribute("workShops", workShops);
		response.sendRedirect("createNewsession.jsp?skillSetId="+skillSetId);
	}
	
	public void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateUtil.getCurrentSession();
		Transaction ts = session.beginTransaction();
		String workShopId = request.getParameter("workShopId");
		String hql="from WorkShop where workShopId=?";
		WorkShop workShop = (WorkShop)session.createQuery(hql).setParameter(0, Integer.parseInt(workShopId)).uniqueResult();
		
		request.setAttribute("workShop", workShop);
		
		String hql2="from WaitingList";
		List<WaitingList> waitingList = session.createQuery(hql2).list();
		
		Set waiting = new HashSet();
		for(WaitingList wait : waitingList){
			if(wait.getWorkShopId().equals(workShopId)){
				waiting.add(wait.getStudents().iterator().next());
			}
		}
		request.setAttribute("waiting", waiting);
		//ts.commit();
		//response.sendRedirect("detail.jsp");
		request.getRequestDispatcher("detail.jsp").forward(request,response);
	}
	
	public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateUtil.getCurrentSession();
		Transaction ts = session.beginTransaction();
		
		String workShopId = request.getParameter("workShopId");
		WorkShop workshop = session.get(WorkShop.class, Integer.parseInt(workShopId));
		String targetGroup = request.getParameter("targetGroup");
		String description = request.getParameter("description");
		String placeAvailable = request.getParameter("placeAvailable");
		String maximumPlace = request.getParameter("maximumPlace");
		String roomDropbtn = request.getParameter("roomDropbtn");
		workshop.setTargetGroup(targetGroup);
		workshop.setDescription(description);
		workshop.setPlaceAvailable(placeAvailable);
		workshop.setMaximumPlace(maximumPlace);
		Room room = new Room();
		room.setRoomId(Integer.parseInt(roomDropbtn));
		workshop.setRoom(room);
		session.update(workshop);
		
		request.getSession().setAttribute("workShop", workshop);
		ts.commit();
		request.getRequestDispatcher("detail.jsp").forward(request, response);
	}
	
	public void bookAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateUtil.getCurrentSession();
		Transaction ts = session.beginTransaction();
		
		String stuid = request.getParameter("stuid");
		String workShopId = request.getParameter("workShopId");
		
		
		
		WorkShop workshop = session.get(WorkShop.class, Integer.parseInt(workShopId));
		Student stu = session.get(Student.class, Integer.parseInt(stuid));
		
		stu.setStudentId(Integer.parseInt(stuid));
		Set<Student> set = workshop.getStudents();
		set.add(stu);
		if(set.size()>=35){
			Set<WaitingList> waitset = stu.getWaitingLists();
			WaitingList waiting = new WaitingList();
			waiting.setFirstName(stu.getFirstName());
			waiting.setLastName(stu.getLastName());
			waiting.setWorkShopId(workShopId);
			session.save(waiting);
			waitset.add(waiting);
			stu.setWaitingLists(waitset);
			session.update(stu);
		}else{
			workshop.setStudents(set);
			Set<Attendance> attset = workshop.getAttendances();
			Attendance attendance = new Attendance();
			attendance.setLastName(stu.getLastName());
			attendance.setFirstName(stu.getFirstName());
			attendance.setDate(new Date());
			attendance.setStudent(stu);
			attendance.setWorkShop(workshop);
			attset.add(attendance);
			
			session.save(attendance);
			workshop.setAttendances(attset);
			
			session.save(workshop);
		}
		
		workshop = session.get(WorkShop.class, Integer.parseInt(workShopId));
		request.getSession().setAttribute("workShop", workshop);
		
		String hql="from WaitingList";
		List<WaitingList> waitingList = session.createQuery(hql).list();
		
		
		for(WaitingList wait : waitingList){
			if(wait.getWorkShopId().equals(workShopId)){
				request.setAttribute("waiting", wait.getStudents());
				break;
			}
		}
		
		ts.commit();
		request.getRequestDispatcher("detail.jsp").forward(request,response);
	}
	
	
}
