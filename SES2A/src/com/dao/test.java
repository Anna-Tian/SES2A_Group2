package com.dao;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Room;
import com.bean.WorkShop;
import com.util.HibernateUtil;

public class test {
	
	public void save() throws ParseException {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		WorkShop workshop = new WorkShop();
		SimpleDateFormat sdf =   new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String beginTimeString="2017-03-23 08:00:00";
		String endTimeString="2017-03-26 08:00:00";
		Date beginTimeDate = sdf.parse( beginTimeString );
		Date endTimeDate = sdf.parse( endTimeString );
		
		workshop.setName("workshop010");
		workshop.setStartDate(beginTimeDate);
		workshop.setEndDate(endTimeDate);
		workshop.setDays("Just");
		workshop.setPlaceAvailable("10");
		workshop.setTargetGroup("test03");
		workshop.setDescription("1332");
		
		
		Room room = new Room();
		
		room.setRoomLocation("005");
		
		
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
	public static void main(String[] args) throws ParseException {
		(new test()).save();
	}

}
