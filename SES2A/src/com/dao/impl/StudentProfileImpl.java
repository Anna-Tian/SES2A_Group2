package com.dao.impl;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Student;
import com.bean.StudentProfile;
import com.dao.StudentProfileDao;
import com.util.HibernateUtils;

public class StudentProfileImpl implements StudentProfileDao {

	@Override
	public boolean saveStudentProfile(StudentProfile studentProfile){
		Session session = null;
		Transaction transaction = null;
		boolean flag = false;
		try {
			session = HibernateUtils.getCurrentSession();
			transaction = session.beginTransaction();
			studentProfile.getStudent().setStudentProfile(studentProfile);
			session.saveOrUpdate(studentProfile);
			session.saveOrUpdate(studentProfile.getStudent());
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
