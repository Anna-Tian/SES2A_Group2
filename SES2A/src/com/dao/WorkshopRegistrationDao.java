package com.dao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.WorkShop;
import com.util.HibernateUtil;

public class WorkshopRegistrationDao {
	public List<WorkShop> test1() {
	    Session session = null;
	    Transaction tx = null;
	    List<WorkShop> list = null;
	    System.out.println("111111");
	    try {
	    	session = HibernateUtil.getCurrentSession();
	    	System.out.println("999999");
	    	tx = session.beginTransaction();
	    	System.err.println("777777");
	    	Query query = session.createQuery("from WorkShop");
	    	System.out.println("888888");
	    	list = query.list();
	    	System.out.println("222222");
	    	for (WorkShop workShop : list) {
	    		System.out.println("333333");
	    		System.out.println(workShop);
	    	}
	    	System.out.println("444444");
	    	tx.commit();
	    }catch(Exception e) {
	    	tx.rollback();
	    	System.out.println("555555");
	    }
	    System.out.println("666666");
	    return list;
	}
	
	public WorkShop findWorkshopById(Integer id) {
		
		Session session = null;
		  Transaction transaction = null;
		  WorkShop workshop = null;
		  try {
		   session = HibernateUtil.getCurrentSession();
		   transaction = session.beginTransaction();
		   workshop = session.get(WorkShop.class, id);
		   transaction.commit();
		  } catch (Exception e) {
		   transaction.rollback();
		   e.printStackTrace();
		  }
		  return workshop;
		
	}
	

		public Set<String> step1() {
		    Session session = null;
		    Transaction tx = null;
		    List<WorkShop> list = null;
		    Set<String> workshopNames = new HashSet<String>();
		    try {
		    	session = HibernateUtil.getCurrentSession();
		    	tx = session.beginTransaction();
		    	Query query = session.createQuery("from WorkShop");
		    	list = query.list();
		    	for (WorkShop workShop : list) {
		    		workshopNames.add(workShop.getTargetGroup());
		    	}
		    	tx.commit();
		    }catch(Exception e) {
		    	tx.rollback();
		    }
		    return workshopNames;
		}
	
	public void test2() {
	    Session session = null;
	    Transaction tx = null;
	    try {
	    	session = HibernateUtil.getCurrentSession();
	    	tx = session.beginTransaction();
	    	WorkShop workShop = new WorkShop();
	    	workShop.setName("rty");
	    	session.save(workShop);
	    	tx.commit();
	    }catch(Exception e) {
	    	tx.rollback();
	    }
	}
	public static void main(String[] args) {
		(new WorkshopRegistrationDao()).test1();
		System.out.println("success");
	}

}
