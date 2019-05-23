package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.bean.Advisor;

public class advisorDao {
	public void add(String staffNumber, String firstName, String lastName, String email) {
		try {
			// Configuring hibernate
			Configuration configuration = new Configuration().configure();

			// Create sessionfactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			// Get Session object
			Session session = sessionFactory.openSession();

			// Starting Transaction
			Transaction transaction = session.beginTransaction();
			Advisor advisor = new Advisor();
			advisor.setStaffNumber(staffNumber);
			advisor.setFirstName(firstName);
			advisor.setLastName(lastName);
			advisor.setEmail(email);
			advisor.setIsActive("Active");
			session.save(advisor);
			transaction.commit();
			System.out.println("\n\n Details Added \n");

		} catch (HibernateException e) {
			System.out.println(e.getMessage());
			System.out.println("error");
		}
	}

	public void update(int advisorId, String staffNumberupdate, String firstNameupdate, String lastNameupdate, String emailupdate) {
		try {
			// Configuring hibernate
			Configuration cfg = new Configuration();
			cfg.configure("hibernate.cfg.xml");
			
			// Create sessionfactory 
			SessionFactory factory = cfg.buildSessionFactory();
			
			// Get Session object
			Session session = factory.openSession();
			Object o = session.load(Advisor.class, advisorId);
			Advisor advisorupdate = (Advisor) o;
			
			// Starting Transaction
			Transaction transaction = session.beginTransaction();
			advisorupdate.setStaffNumber(staffNumberupdate);
			advisorupdate.setFirstName(firstNameupdate);
			advisorupdate.setLastName(lastNameupdate);
			advisorupdate.setEmail(emailupdate);
			advisorupdate.setIsActive("Active");
			session.update(advisorupdate);
			transaction.commit();
			System.out.println("\n\n Details Updated \n");

		} catch (HibernateException e) {
			System.out.println(e.getMessage());
			System.out.println("error");
		}
	}

	public void delete(int advisorId) {
		// Configuring hibernate
		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml");
		
		// Create sessionfactory 
		SessionFactory factory = cfg.buildSessionFactory();
		Session session = factory.openSession();
		
		// Get Session object
		Object o = session.load(Advisor.class, advisorId);
		Advisor a = (Advisor) o;

		// Starting Transaction
		Transaction transaction = session.beginTransaction();
		session.delete(a);
		System.out.println("Object Deleted successfully.....!!");
		transaction.commit();
		session.close();
		factory.close();
	}

	public void inactive(int advisorId) {
		try {
			// Configuring hibernate
			Configuration cfg = new Configuration();
			cfg.configure("hibernate.cfg.xml");
			
			// Create sessionfactory 
			SessionFactory factory = cfg.buildSessionFactory();
			Session session = factory.openSession();
			
			// Get Session object
			Object o = session.load(Advisor.class, advisorId);
			Advisor advisorinactivate = (Advisor) o;

			// Starting Transaction
			Transaction transaction = session.beginTransaction();
			advisorinactivate.setIsActive("InActive");
			session.update(advisorinactivate);
			transaction.commit();
			System.out.println("\n\n Advisors Inactivated \n");

		} catch (HibernateException e) {
			System.out.println(e.getMessage());
			System.out.println("error");
		}
	}

	public void active(int advisorId) {
		try {
			// Configuring hibernate
			Configuration cfg = new Configuration();
			cfg.configure("hibernate.cfg.xml");
			
			// Create sessionfactory 
			SessionFactory factory = cfg.buildSessionFactory();
			Session session = factory.openSession();
			
			// Get Session object
			Object o = session.load(Advisor.class, advisorId);
			Advisor advisoractivate = (Advisor) o;

			// Starting Transaction
			Transaction transaction = session.beginTransaction();
			advisoractivate.setIsActive("Active");
			session.update(advisoractivate);
			transaction.commit();
			System.out.println("\n\n Advisors Activate \n");

		} catch (HibernateException e) {
			System.out.println(e.getMessage());
			System.out.println("error");
		}
	}

}