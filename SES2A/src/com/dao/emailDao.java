package com.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.ConfirmationEmail;
import com.util.HibernateUtil;

public class emailDao {

	public void saveEmail() {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		ConfirmationEmail email = new ConfirmationEmail();
		email.setConfirmationId(1);
		email.setTitle("Confirmation of waiting list(to student)");
		email.setSubject("Confirmation of waiting list");
		//email.setTemplate("[% student_givernname %] [% student_surname %] has cancelled a one-to-one appointment with you.\n" + "Appointment time: [% datetime %]");
		email.setTemplate("98888888888888888888888888");

		session.saveOrUpdate(email);
		transaction.commit();
	}
	
	public ConfirmationEmail getCurrentEmail(Integer id) {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		ConfirmationEmail email = session.get(ConfirmationEmail.class, id);
		transaction.commit();
		return email;
	}
	
//	public ConfirmationEmail updateEmail(Integer id, String updateTime) {		
//		Session session = HibernateUtil.getCurrentSession();
//		Transaction transaction = session.beginTransaction();
//		ConfirmationEmail email = session.get(ConfirmationEmail.class, id);
//		email.setUpdateTime(updateTime);
//		session.saveOrUpdate(email);
//	    transaction.commit();
//		return email;
//	}
	
	public ConfirmationEmail publishEmail(Integer id, String template, String publishTime) {
//		Session session = null;
//		Transaction transaction = null;
//		boolean flag = false;
//		try {
//			session = HibernateUtil.getCurrentSession();
//			transaction = session.beginTransaction();
//			
//			ConfirmationEmail email = session.get(ConfirmationEmail.class, id);
//			email.setTemplate(template);
//			
//			email.setPublishTime(publishTime);
//			
//			session.saveOrUpdate(email);
//			transaction.commit();
//			flag = true;
//		} catch (Exception e) {
//			transaction.rollback();
//			flag = false;
//			e.printStackTrace();
//		}
//		return flag;
		
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		ConfirmationEmail email = session.get(ConfirmationEmail.class, id);
		email.setTemplate(template);
		email.setPublishTime(publishTime);
		session.saveOrUpdate(email);
		transaction.commit();
		return email;
	}

	
	public static void main(String[] args) {
		(new emailDao()).saveEmail();
	}

}
