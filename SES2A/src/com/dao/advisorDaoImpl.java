/*
 * package com.dao;
 * 
 * import java.util.List;
 * 
 * import org.hibernate.HibernateException; import org.hibernate.Session; import
 * org.hibernate.SessionFactory; import org.hibernate.Transaction; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Repository; import
 * org.hibernate.cfg.Configuration;
 * 
 * import com.bean.Advisor; import com.util.HibernateUtil;
 * 
 * @Repository public class advisorDaoImpl implements advisorDao {
 * 
 * @Autowired private SessionFactory session;
 * 
 * @Override public void add(String staffNumber, String firstName, String
 * lastName, String email) { try { // 1. configuring hibernate Configuration
 * configuration = new Configuration().configure();
 * 
 * // 2. create sessionfactory SessionFactory sessionFactory =
 * configuration.buildSessionFactory();
 * 
 * // 3. Get Session object Session session = sessionFactory.openSession();
 * 
 * // 4. Starting Transaction Transaction transaction =
 * session.beginTransaction(); Advisor advisor = new Advisor();
 * advisor.setStaffNumber(staffNumber); advisor.setFirstName(firstName);
 * advisor.setLastName(lastName); advisor.setEmail(email);
 * session.save(advisor); transaction.commit();
 * System.out.println("\n\n Details Added \n");
 * 
 * } catch (HibernateException e) { System.out.println(e.getMessage());
 * System.out.println("error"); }
 * 
 * }
 * 
 * @Override public void update(Advisor advisor) {
 * session.getCurrentSession().update(advisor); }
 * 
 * @Override public void delete(int advisorId) {
 * session.getCurrentSession().delete(getAdvisor(advisorId)); }
 * 
 * @Override public Advisor getAdvisor(int advisorId) { return
 * (Advisor)session.getCurrentSession().get(Advisor.class, advisorId); }
 * 
 * @Override public List getAllAdvisor() { return
 * session.getCurrentSession().createQuery("from Advisor").list(); }
 * 
 * 
 * }
 */