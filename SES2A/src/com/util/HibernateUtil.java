package com.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;



public class HibernateUtil {
	private static SessionFactory sessionFactory = null;
	static {
		Configuration configuration = new Configuration();
		configuration.configure();
		sessionFactory = configuration.buildSessionFactory();
	}
	public static Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public static void main(String[] args) {
		System.out.println("Success");
	}
}
