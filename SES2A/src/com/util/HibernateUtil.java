<<<<<<< HEAD
package com.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.dao.TestDaoImpl;


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
	public static void main(String[] args) {
		System.out.println("Success");
	}
}
=======
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
	public static void main(String[] args) {
		System.out.println("Success");
		System.out.println("Succe1ss");
		System.out.println("Succes2s");
		System.out.println("Success");
		System.out.println("Succe77ss");
	}
	
}
>>>>>>> refs/remotes/origin/master
