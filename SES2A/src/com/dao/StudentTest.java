package com.dao;

import java.util.Date;
import java.util.Iterator;

import com.bean.Room;
import com.bean.Student;
import com.bean.WorkShop;
import org.apache.catalina.Group;
import org.apache.catalina.Role;
import org.apache.catalina.User;
import org.apache.catalina.UserDatabase;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.util.HibernateUtil;

public class StudentTest {
	
	public void test() {
		
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();

		Student student = session.get(Student.class, 12345);
		WorkShop workShop05 =session.get(WorkShop.class, 6);
		WorkShop workShop06 =session.get(WorkShop.class, 7);
		
		Date startDate05 = workShop05.getStartDate();
		Date endDate05 = workShop05.getEndDate();
		Date startDate06 = workShop06.getStartDate();
		Date endDate06 = workShop06.getEndDate();
		
		if ( ((startDate06.before(endDate05))&&((startDate06.after(startDate05)))) || (endDate06.before(endDate05))&&((endDate06.after(startDate05))) ){ 
			  System.out.println("05与06冲突");
		}
		else{
				System.out.println("不冲突");
		}
		//workShop.getStudents().add(student);

		//session.saveOrUpdate(student);
		//session.saveOrUpdate(workShop);

		transaction.commit();

	}

	public static void main(String[] args) {
		(new StudentTest()).test();
	}

}

