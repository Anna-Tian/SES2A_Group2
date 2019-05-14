package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.ConfirmationEmail;
import com.bean.SkillSet;
import com.util.HibernateUtil;

public class skillsetDao {
	public void saveSkillSet() {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		SkillSet skill = new SkillSet();
		skill.setSkillSetId(2);
		skill.setName("Upass: software");
		skill.setShortName("Upass: software 2019");
		session.saveOrUpdate(skill);
		transaction.commit();
	}
	
	public SkillSet getCurrentSkill(Integer id) {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		SkillSet skill = session.get(SkillSet.class, id);
		transaction.commit();
		return skill;
	}
	
	
	public List<SkillSet> getSkillSet(){
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		Query query = session.createQuery("from SkillSet");
		ArrayList<SkillSet> skillSets = (ArrayList<SkillSet>) query.list();
		//System.out.println(skillSets);
		transaction.commit();
		return skillSets;
	}
	
	public Boolean addSkill(String name) {
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		boolean flag = false;
		try {
			SkillSet skill = new SkillSet();
			skill.setName(name);	
			session.save(skill);
			transaction.commit();
			flag = true;
	} catch (Exception e) {
			transaction.rollback();
			flag = false;
			e.printStackTrace();
	}
		return flag;
	}
	
	public Boolean updateSkill(Integer id, String shortName) {		
		Session session = HibernateUtil.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		boolean flag = false;
		try {
		SkillSet skill = session.get(SkillSet.class, id);
		skill.setShortName(shortName);
		session.saveOrUpdate(skill);
	    transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			flag = false;
			e.printStackTrace();
	}
		return flag;
	}
	
	public static void main(String[] args) {
		(new skillsetDao()).saveSkillSet();
		
	}

}
