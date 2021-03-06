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
	public void add(String staffNumber, String firstName, String lastName, String email ) {
        try {
            // 1. configuring hibernate
            Configuration configuration = new Configuration().configure();
 
            // 2. create sessionfactory
            SessionFactory sessionFactory = configuration.buildSessionFactory();
 
            // 3. Get Session object
            Session session = sessionFactory.openSession();
 
            // 4. Starting Transaction
            Transaction transaction = session.beginTransaction();
            Advisor advisor = new Advisor();
            advisor.setStaffNumber(staffNumber);
            advisor.setFirstName(firstName);
            advisor.setLastName(lastName);
            advisor.setEmail(email);
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
  		  Configuration cfg = new Configuration();
  		  cfg.configure("hibernate.cfg.xml");
  	  
  		  SessionFactory factory = cfg.buildSessionFactory(); 
  		  Session session =  factory.openSession();
  	  
  		  Object o= session.load(Advisor.class, advisorId); 
  		  Advisor advisorupdate=(Advisor)o;
  	  
  		  Transaction transaction = session.beginTransaction();
            advisorupdate.setStaffNumber(staffNumberupdate);
            advisorupdate.setFirstName(firstNameupdate);
            advisorupdate.setLastName(lastNameupdate);
            advisorupdate.setEmail(emailupdate);
            session.update(advisorupdate);
            transaction.commit();
            System.out.println("\n\n Details Updated \n");
 
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            System.out.println("error");
        }
   }
	public void delete(int advisorId) {  
		  Configuration cfg = new Configuration();
		  cfg.configure("hibernate.cfg.xml");
	  
		  SessionFactory factory = cfg.buildSessionFactory(); 
		  Session session =  factory.openSession();
	  
		  Object o= session.load(Advisor.class, advisorId); 
		  Advisor a=(Advisor)o;
	  
		  Transaction transaction = session.beginTransaction(); 
		  session.delete(a);
		  System.out.println("Object Deleted successfully.....!!"); 
		  transaction.commit();
		  session.close(); 
		  factory.close(); 
		  }
 
	}
//	public Advisor getAdvisor(int advisorId);
//	public List getAllAdvisor();

