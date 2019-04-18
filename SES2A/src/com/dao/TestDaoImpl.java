package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.bean.Student;
import com.util.HibernateUtil;

/**
 * To be deleted when other related parts done.
 */
public class TestDaoImpl {
	public void save() {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		Student student = new Student();
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
	public Student getCurrentStudent() {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		Student student = session.get(Student.class, 1);
		transaction.commit();
		return student;
	}
	public static void main(String[] args) {
		(new TestDaoImpl()).save();
	}
}
