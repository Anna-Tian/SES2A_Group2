
  package com.dao;
  
import org.hibernate.Session; 
import org.hibernate.SessionFactory; 
import org.hibernate.Transaction; 
import org.hibernate.cfg.Configuration;
import java.util.Iterator;
import java.util.List;
  
import com.bean.Advisor;
  
import com.util.HibernateUtil;
  
  public class adImplTest { 
	  public void add () { 
		  Session session =  HibernateUtil.getCurrentSession(); 
		  Transaction transaction =  session.beginTransaction(); 
		  Advisor advisor = new Advisor();
		  advisor.setStaffNumber("11111"); 
		  advisor.setFirstName("dddddd");
		  advisor.setLastName("vvvv"); 
		  advisor.setEmail("asdasda");
		  session.save(advisor); 
		  transaction.commit(); }
  
  public void delete(int advisorId) { 
	  Configuration cfg = new Configuration();
	  cfg.configure("hibernate.cfg.xml");
  
	  SessionFactory factory = cfg.buildSessionFactory(); 
	  Session session =  factory.openSession();
  
	  Object o= session.load(Advisor.class, advisorId); 
	  Advisor a=(Advisor)o;
  
	  Transaction tx = session.beginTransaction(); 
	  session.delete(a);
	  System.out.println("Object Deleted successfully.....!!"); 
	  tx.commit();
	  session.close(); 
	  factory.close(); }
  
  public static void main(String[] args) { 
	  Configuration cfg = new Configuration();
	  SessionFactory factory = cfg.buildSessionFactory(); 
	  Session session = factory.openSession();
	  session.flush();
	  session.clear();
  }

	   
	  
  }
  

 