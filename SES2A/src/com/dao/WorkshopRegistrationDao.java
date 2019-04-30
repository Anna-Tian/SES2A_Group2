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
	public List<WorkShop> test1(String targetGroup) {
	    Session session = null;
	    Transaction tx = null;
	    List<WorkShop> list = null;
	    try {
	    	session = HibernateUtil.getCurrentSession();
	    	tx = session.beginTransaction();
	    	Query query = session.createQuery("from WorkShop where targetGroup=?");
	    	query.setParameter(0,targetGroup);
	    	list = query.list();
	    	tx.commit();
	    }catch(Exception e) {
	    	tx.rollback();
	    }
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
	

		public List<String> step1() {
			Session session = null;
		    Transaction tx = null;
		    List<String> list = null;
		    try {
		    	session = HibernateUtil.getCurrentSession();
		    	tx = session.beginTransaction();
		    	Query query = session.createQuery("from WorkShop");
		    	List<String> list1 = new ArrayList<String>();
		    	List<WorkShop> list2 = query.list();
		    	for (WorkShop workShop : list2) {
					list1.add(workShop.getTargetGroup());
				}
		    	list = removeDuplicate(list1);
		    	tx.commit();
		    }catch(Exception e) {
		    	tx.rollback();
		    }
		    return list;
		}
		
		public List<String> removeDuplicate(List<String> list) {   
		    HashSet<String> h = new HashSet<String>(list);   
		    list.clear();   
		    list.addAll(h);   
		    return list;   
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
		(new WorkshopRegistrationDao()).test1("test");
		System.out.println("success");
	}

}
