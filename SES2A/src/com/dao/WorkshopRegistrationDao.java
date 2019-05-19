package com.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Student;
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
	
	public String stringBuffer(String a, String b, String c, String d) {
		StringBuffer buf=new StringBuffer();
		buf.append("You have successfully registered ");
		buf.append(a);
		buf.append(" on ");
		buf.append(b);
		buf.append(", ");
		buf.append(c);
		buf.append(" at ");
		buf.append(d);
		buf.append(". ");
		
		String e=buf.toString();
		return e;
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
	
	
	public boolean bookingWorkshop(Student student, WorkShop workShop) {
		boolean flag = true;
		List<WorkShop> list = new ArrayList<>();
		
		Session session = null;
		Transaction transaction = null;
		try {
			session = HibernateUtil.getCurrentSession();
			transaction = session.beginTransaction();
			student = session.get(Student.class, 12345);
			Set<WorkShop> workShops = student.getWorkShops();
			for(WorkShop ws:workShops) {
				list.add(ws);
			}
			
			for(WorkShop wShop : list) {
				System.out.println(wShop.getWorkShopId());
				if (ifConflict(workShop, wShop) || workShop.getWorkShopId() == wShop.getWorkShopId()) {
					System.out.println("111111111111111111111");
					//student.getWorkShops().add(workShop);
					flag = false;
				}
				
			}
			if(flag) {
				student.getWorkShops().add(workShop);
				System.out.println("333333333333333333333");
			}
			System.out.println("44444444444444444");
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Excepppppppppppppection");
		}
		
		return flag;
	}
	
	public boolean ifConflict(WorkShop wr1, WorkShop wr2) {
		Boolean flagBoolean = true;
		Date startDate_1 = wr1.getStartDate();
		Date endDate_1 = wr1.getEndDate();
		Date startDate_2 = wr2.getStartDate();
		Date endDate_2 = wr2.getEndDate();
		if ( ((startDate_2.before(endDate_1))&&((startDate_2.after(startDate_1)))) || (endDate_2.before(endDate_1))&&((endDate_2.after(startDate_1))) ){ 
			  flagBoolean = true;
		}
		
		else{
				flagBoolean = false;
		}
		
		return flagBoolean;
	}
	
	
	
	public static void main(String[] args) {
		(new WorkshopRegistrationDao()).test1("test");
		System.out.println("success");
	}
}
