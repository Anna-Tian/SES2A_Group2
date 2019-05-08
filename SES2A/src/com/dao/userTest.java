package com.dao;

import java.util.Iterator;

import org.apache.catalina.Group;
import org.apache.catalina.Role;
import org.apache.catalina.User;
import org.apache.catalina.UserDatabase;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.omg.CORBA.PUBLIC_MEMBER;

import com.util.HibernateUtil;

public class userTest {
	
	public void test() {
		
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		
	}

}
