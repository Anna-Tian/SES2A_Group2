package com.advisor;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.util.HibernateUtil;
import com.bean.*;

public class AdvisorModel {
	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	
	public Advisor find (int id) {
		Advisor advisor = null;
		Session session = null;
		Transaction transaction = null;
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			org.hibernate.Query query = session.createQuery("from advisor where id = :id");
			query.setParameter("id", id);
			advisor = (Advisor) query.uniqueResult();
			transaction.commit();
		}catch (Exception e) {
			advisor = null;
			if (transaction != null) {
				transaction.rollback();
			}
		}finally {
			session.close();
		}
		return advisor;
	}
}
