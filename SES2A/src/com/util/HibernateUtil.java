package com.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.dao.TestDaoImpl;


public class HibernateUtil {
	private static SessionFactory sessionFactory = null;
	static {
		Configuration configuration = new Configuration();
		configuration.configure(); //获取到src下HibernateUtil.java的配置文件.
		sessionFactory = configuration.buildSessionFactory(); //创建session工厂
	}
	public static Session getCurrentSession() {
		return sessionFactory.getCurrentSession(); //返回session对象
	}
	public static void main(String[] args) {
		System.out.println("Success");
	}
}
