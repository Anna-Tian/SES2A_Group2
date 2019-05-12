package com.dao;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Student;
import com.util.HibernateUtil;

public class sessionDao {
	public void saveSession() {
		
	Session session = HibernateUtil.getCurrentSession();

	Transaction transaction = session.beginTransaction();
	com.bean.Session qqq=new com.bean.Session();
	 qqq.setSessionId(10);
	Student student = new Student();
	student.setStudentId(111);
	student.getSessions().add(qqq);
	qqq.setStudent(student);
	//report.get set集合，add数据
	session.save(qqq);
	session.save(student);
	transaction.commit();
}
public com.bean.Session getCurrentSession() {
	Session session = HibernateUtil.getCurrentSession();
	Transaction transaction = session.beginTransaction();
	com.bean.Session one = session.get(com.bean.Session.class, 999);
	System.out.println(one);
	transaction.commit();
	return one;
}
public static void main(String[] args) {
	System.out.println("NOK");
	(new sessionDao()).saveSession();
	System.out.println("OK");


}
}
