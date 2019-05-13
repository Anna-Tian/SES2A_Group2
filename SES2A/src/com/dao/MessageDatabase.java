package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.bean.Message;
import com.util.HibernateUtil;

public class MessageDatabase {
	
	//Finds and returns the message with the given ID
	public static Message getCurrentMessage(int id) {

		try{
			Session session = HibernateUtil.getCurrentSession();
			Transaction transaction = session.beginTransaction();
			Message message = session.get(Message.class, id);
			transaction.commit();
			return message;
		}
		catch (NullPointerException e){
			System.out.println("CAUGHT IN getCurrentMessage: MESSAGE ID IS OUT OF BOUND!!!");
			throw e;
		}			
	}
	
	
	//updates the given message object in the database
	public static boolean updateMessage(Message message){
		boolean updated = false;
		Session session = HibernateUtil.getCurrentSession();
		System.out.println(session);
		Transaction transaction = session.beginTransaction();
		
		try{
			session.saveOrUpdate(message);
			updated = true;
		}
		catch(Exception e){
			System.out.println("CAUGHT IN updateMessage: ERROR UPDATING THE DATABASE");
			throw e;
		}
		
		transaction.commit();
		return updated;
	}
	
	//Printing out details and the location of the message
	public static void printMessage(Message message){
		System.out.println(message.getMessageDetailed());
		System.out.println(message.getMessageTempDetailed());
		System.out.println(message.getMessageLocation());
	}
	
	/************TESTING PURPOSE******************/
	/*public static void main(String[] agrs){
		try{
			System.out.println("BEFORE HIBERNATE FUNCTION");
			Message mess = getCurrentMessage(1);
			printMessage(mess);
			mess.setMessageDetailed("new message for testing");
			mess.setMessageTempDetailed("new message for testing");
			updateMessage(mess);
		}
		catch(NullPointerException e){
			System.out.println("CAUGHT IN MAIN: MESSAGE ID IS OUT OF BOUND!!!");
		}
	}*/
}
