package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Admin;
import com.bean.Student;
import com.util.HibernateUtil;

public class StuLogin {
	public Student findStudentByIP(Integer id, String password) {
		Session session = null;
		Transaction transaction = null;
		Student student = null;
		try {
			session = HibernateUtil.getCurrentSession();
			transaction = session.beginTransaction();
			Query query = session.createQuery("from Student s where s.studentId = ? and s.password = ?");
			query.setParameter(0, id);
			query.setParameter(1, password);
			List<Student> list = query.list();
			if(list!=null&&list.size()>0) {
				student = list.get(0);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		transaction.commit();
		
		return student;
	}
	public Student findStudentById(Integer id) {
		Session session = null;
		Transaction transaction = null;
		Student student = null;
		try {
			session = HibernateUtil.getCurrentSession();
			transaction = session.beginTransaction();
			Query query = session.createQuery("from Student s where s.studentId = ?");
			query.setParameter(0, id);
			List<Student> list = query.list();
			if(list!=null&&list.size()>0) {
				student = list.get(0);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		transaction.commit();
		
		return student;
	}
	public Admin findAdminByIP(Integer id, String password) {
		  Session session = null;
		  Transaction transaction = null;
		  Admin admin = null;
		  try {
		   session = HibernateUtil.getCurrentSession();
		   transaction = session.beginTransaction();
		   Query query = session.createQuery("from Admin a where a.adminId = ? and a.password = ?");
		   query.setParameter(0, id);
		   query.setParameter(1, password);
		   List<Admin> list = query.list();
		   if(list!=null&&list.size()>0) {
		    admin = list.get(0);
		   }
		  }catch(Exception e) {
		   e.printStackTrace();
		  }
		  transaction.commit();
		  
		  return admin;
		 }
}
