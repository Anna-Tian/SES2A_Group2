package com.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Student;
import com.util.HibernateUtil;

/**
 * just for test, to be delete when merging.
 * @author apple
 *
 */
public class Test {
	public void saveStudent() {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		Student student = new Student();
		student.setStudentId(999);
		student.setFirstName("Junwei");
		student.setLastName("Liang");
		student.setPassword("password1");
		student.setFaculty("Engineering and Information Technology");
		student.setCourse("C09066");
		student.setEmail("Junwei.Liang@student.uts.edu.au");
		student.setPhone("N/A");
		student.setMobile("+61000000");
		student.setDob("01/01/2000");
		
		session.save(student);
		transaction.commit();
	}
	public static void main(String[] args) {
		(new Test()).saveStudent();
		System.out.println("Success");
	}
}
