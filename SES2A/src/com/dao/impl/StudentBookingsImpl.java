package com.dao.impl;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Student;
import com.bean.WorkShop;
import com.dao.StudentBookings;
import com.util.HibernateUtil;

public class StudentBookingsImpl implements StudentBookings {

	@Override
	public boolean removeWorkShop(Integer workshop_id, Integer student_id) {
		Session session = null;
		Transaction transaction = null;
		boolean flag = false;
		try {
			session = HibernateUtil.getCurrentSession();
			transaction = session.beginTransaction();
			
			Student student = session.get(Student.class, student_id);
			WorkShop workShop = session.get(WorkShop.class, workshop_id);
			student.getWorkShops().remove(workShop);
			workShop.getStudents().remove(student);
			
			session.saveOrUpdate(student);
			session.saveOrUpdate(workShop);
			
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
