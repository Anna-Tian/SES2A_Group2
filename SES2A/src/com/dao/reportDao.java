package com.dao;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Report;
import com.util.HibernateUtil;

public class reportDao {
	public void saveReport() {

		Session session = HibernateUtil.getCurrentSession();

		Transaction transaction = session.beginTransaction();
		Report report=new Report();
		report.setTitle("Workshop");
		report.setDescription("Improve your Speaking");
		report.setFromDate(new Date());
		report.setToDate(new Date());
		report.setRecordDate("2019-05-06");
		

		session.save(report);
		transaction.commit();
	}
	public Report getCurrentReport() {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		Report report = session.get(Report.class, 999);
		System.out.println(report);
		transaction.commit();
		return report;
	}
	public static void main(String[] args) {
		System.out.println("NOK");
		(new reportDao()).getCurrentReport();
		System.out.println("OK");
	}
}
