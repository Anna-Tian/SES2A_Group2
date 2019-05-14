package com.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import com.bean.Room;
import com.util.HibernateUtil;

public class saveRoom {
	
//	public static boolean deleteRoom (Room room) {
//		boolean saved = false;
//		Session session = HibernateUtil.getCurrentSession();
//		Transaction transaction  = session.beginTransaction();
//		
//		try {
//			session.delete(room);
//			saved = true;
//			
//		}
//		catch (Exception e) {
//			System.out.println("Error saving the rooms into Database");
//			throw e;
//		}
//		
//		transaction.commit();
//		return saved;
		
//	}
	
//	public static void updateRoom (Room room){
//		
//		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
//		Metadata mdata = new MetadataSources(ssr).getMetadataBuilder().build(); 
//		
//		SessionFactory factory = mdata.getSessionFactoryBuilder().build();  
//		Session session = factory.openSession();  
//		Transaction transaction = session.beginTransaction();
//		
//		session.update(room);
//		
//		transaction.commit();
//		session.close();
//	}
	
	public static void updateRoom(int roomId, String room) {
        try {
  		  Configuration cfg = new Configuration();
  		  cfg.configure("hibernate.cfg.xml");
  	  
  		  SessionFactory factory = cfg.buildSessionFactory(); 
  		  Session session =  factory.openSession();
  	  
  		  Object obj= session.load(Room.class, roomId);
  		  Room updatedRoom =(Room)obj;
  	  
  		  Transaction transaction = session.beginTransaction();
            updatedRoom.setRoomLocation(room);
            session.update(updatedRoom);
            transaction.commit();
            System.out.println("\n\n Details Updated \n");
 
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            System.out.println("error");
        }
   }
	
	public static void addRoom(Room room)
	{
		
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata mdata = new MetadataSources(ssr).getMetadataBuilder().build(); 
		
		SessionFactory factory = mdata.getSessionFactoryBuilder().build();  
		Session session = factory.openSession();  
		Transaction transaction = session.beginTransaction();

		session.saveOrUpdate(room);
		
		transaction.commit();
		session.close();
		
	}
	
	
	
	
	public static void deleteRoom (Room room){
		
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata mdata = new MetadataSources(ssr).getMetadataBuilder().build(); 
		
		SessionFactory factory = mdata.getSessionFactoryBuilder().build();  
		Session session = factory.openSession();  
		Transaction transaction = session.beginTransaction();
		
		session.delete(room);
		
		transaction.commit();
		session.close();
	}
	
	public static void main (String[] args) {
		updateRoom(62, "NewNewNew");
		System.out.println("helloo");
		
	}


	public static Room getCurrentRoom(int i) {
	
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction  = session.beginTransaction();
		
		Room room = null;
		
		try {
			
			room = session.get(Room.class, i);
			
			transaction.commit();
			return room;
		}
		catch (Exception e){
			System.out.println("Error");
			throw e;
		}
		
		
	}
	
	
	
	
	
	
	
	

}

