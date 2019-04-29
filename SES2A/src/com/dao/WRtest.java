package com.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Room;
import com.bean.WorkShop;
import com.util.HibernateUtil;

public class WRtest {

	public boolean saveStudentProfile(WorkShop workshop,Room room){
		Session session = null;
		Transaction transaction = null;
		boolean flag = false;
		try {
			session = HibernateUtil.getCurrentSession();
			transaction = session.beginTransaction();
			//studentProfile.getStudent().setStudentProfile(studentProfile);
			workshop.setRoom(room);
			room.getWorkShops().add(workshop);
			session.saveOrUpdate(workshop);
			session.saveOrUpdate(room);
			transaction.commit();
			flag = true;
		} catch (Exception e) {
			transaction.rollback();
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}
}
