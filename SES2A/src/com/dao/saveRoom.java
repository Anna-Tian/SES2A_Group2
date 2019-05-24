package com.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.bean.Room;
import com.util.HibernateUtil;

public class saveRoom {
	
	public void updateRoom(int roomId, String room) {
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
          System.out.println("\n Updated \n");
 
        } catch (HibernateException e) {
          System.out.println(e.getMessage());
          System.out.println("ERROR");
        }
   }
	
	
	public void addRoom(String room)
	{
		 try {
			 Configuration con = new Configuration().configure();
	 		 SessionFactory factory = con.buildSessionFactory(); 
	 		 Session session =  factory.openSession();
	 		 Transaction transaction = session.beginTransaction();
	 		 
	 		 Room addedRoom = new Room();
	 		 addedRoom.setRoomLocation(room);
	         session.save(addedRoom);
	         transaction.commit();
	         System.out.println("\n Added \n");
	         
		 } catch (HibernateException e)
		 {
			 System.out.println(e.getMessage());
	         System.out.println("ERROR");
		 }
	}
	
	
	public void deleteRoom (int roomId){
		 Configuration con = new Configuration();
 		 con.configure("hibernate.cfg.xml");
 		 SessionFactory factory = con.buildSessionFactory(); 
 		 Session session =  factory.openSession();
 	  
 		 Object obj= session.load(Room.class, roomId);
 		 Room deletedRoom =(Room)obj;
 	  
 		 Transaction transaction = session.beginTransaction();
         session.delete(deletedRoom);
         transaction.commit();
         System.out.println("\n Deleted \n");
		
		
	}
	
	
//	
//	public static void main (String[] args) {
//		updateRoom(119, "NewNewNew");
//		System.out.println("helloo");
//		
//	}


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

