package com.dao;


import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Room;
import com.bean.WorkShop;
import com.util.HibernateUtil;

public class test {
	
	public void save() {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		WorkShop workshop = new WorkShop();
		
		workshop.setName("JiachenLiu");
		workshop.setStartDate(new Date());
		workshop.setEndDate(new Date());
		workshop.setDays("July 999st");
		workshop.setPlaceAvailable("10");
		workshop.setTargetGroup("test02");
		workshop.setDescription("kdjsakjdskas");
		
		
		Room room = new Room();
		
		room.setRoomLocation("sjhksahjdsajhk");
		
		
		workshop.setRoom(room);
		room.getWorkShops().add(workshop);
		session.saveOrUpdate(workshop);
		session.saveOrUpdate(room);
		transaction.commit();
	}
	/*public Student getCurrentStudent() {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		Student student = session.get(Student.class, 1);
		transaction.commit();
		return student;
	}*/
	public static void main(String[] args) {
		(new test()).save();
	}

}
