package com.dao.impl;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Student;
import com.bean.StudentProfile;
import com.dao.StudentProfileDao;
import com.util.HibernateUtil;

public class StudentProfileImpl implements StudentProfileDao {

	@Override
	public boolean saveStudentProfile(Student student,StudentProfile studentProfile){
		Session session = null;
		Transaction transaction = null;
		boolean flag = false;
		try {
			session = HibernateUtil.getCurrentSession();
			transaction = session.beginTransaction();
			//studentProfile.getStudent().setStudentProfile(studentProfile);
			student.setStudentProfile(studentProfile);
			studentProfile.setStudent(student);
			session.saveOrUpdate(student);
			session.saveOrUpdate(studentProfile);
			transaction.commit();
			flag = true;
		} catch (Exception e) {
			transaction.rollback();
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public Student getCurrentStudent(Integer student_id) {
		Session session = null;
		Transaction transaction = null;
		Student student = null;
		try {
			session = HibernateUtil.getCurrentSession();
			transaction = session.beginTransaction();
			student = session.get(Student.class, student_id);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
		return student;
	}

}
