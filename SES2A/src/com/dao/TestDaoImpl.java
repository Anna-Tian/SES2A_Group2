package com.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.bean.Student;
import com.bean.WorkShop;
import com.sun.org.apache.bcel.internal.generic.NEW;
import com.util.HibernateUtil;

/**
 * To be deleted when other related parts done.
 */
public class TestDaoImpl {
	public void saveStudent() {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		Student student = new Student();
		student.setStudentId(12990747);
		student.setFirstName("Zicheng");
		student.setLastName("Qu");
		student.setPassword("123456");
		student.setFaculty("Engineering and Information Technology");
		student.setCourse("C09066");
		student.setEmail("Zicheng.Qu@student.uts.edu.au");
		student.setPhone("N/A");
		student.setMobile("+61451078677");
		student.setDob("02/ 05/ 1996");
		
		session.save(student);
		transaction.commit();
	}
	public void saveSession() throws ParseException {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		
		com.bean.Session pSession = new com.bean.Session();
		pSession.setDate(new Date());
		pSession.setStartTime(new Date());
		pSession.setEndTime(new Date());
		pSession.setType("type");
		pSession.setAdvisorName("name");
		pSession.setRule("rule");
		pSession.setBooked("1");
		pSession.setIsAttendance("2");
		
		session.save(pSession);
		transaction.commit();
		
	}
	public void saveWorkShop() throws ParseException {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		
		WorkShop workShop = new WorkShop();
		workShop.setName("workShop1");
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
		workShop.setStartDate((simpleDateFormat.parse(simpleDateFormat.format(new Date()))));
		workShop.setEndDate((simpleDateFormat.parse(simpleDateFormat.format(new Date().getTime()+1000*60*60*24*30))));
		workShop.setDays("9");
		workShop.setMaximumPlace("8");
		workShop.setPlaceAvailable("7");
		workShop.setNoOfSessions("6");
		workShop.setTargetGroup("5");
		workShop.setDescription("4");
		session.save(workShop);
		/*
		 * HashSet<Student> students= new HashSet<Student>(); HashSet<WorkShop>
		 * workShops= new HashSet<WorkShop>();
		 * 
		 * students.add(getCurrentStudent()); workShops.add(workShop);
		 * workShop.setStudents(students); getCurrentStudent().setWorkShops(workShops);
		 * 
		 * session.saveOrUpdate(workShop); session.saveOrUpdate(getCurrentStudent());
		 */
		
		transaction.commit();
	}

	public Student getCurrentStudent() {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		Student student = session.get(Student.class, 12990747);
		transaction.commit();
		return student;
	}
	public WorkShop getCurrentWorkShop() {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		WorkShop workShop = session.get(WorkShop.class, 1);
		transaction.commit();
		return workShop;
	}
	public static void main(String[] args) throws ParseException {
		(new TestDaoImpl()).saveSession();
		System.out.println("TestDaoImpl Success");
	}
}
