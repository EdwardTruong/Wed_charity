package com.example.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dao.DonationDao;
import com.example.entity.Donation;

@Repository
public class DonationDaoImpl implements DonationDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public Donation findByCode(String code) {
		Session session =  sessionFactory.getCurrentSession();
		String queryString = "FROM Donation d WHERE d.code = :code";
	    Query query = session.createQuery(queryString);
	    query.setParameter("code", code);
	    Donation donation = (Donation) query.uniqueResult();
	    return donation;
	}


/*
 *	It's ok but i did not use it
 *   String queryString = "SELECT d FROM Donation d WHERE d.code LIKE CONCAT('%', :input, '%') OR d.phoneNumber LIKE CONCAT('%', :input, '%')"
 *	+ " OR d.organizationName LIKE CONCAT('%', :input, '%')";
 *
 */	
	@Override
	public List<Donation> foundDonationByInfo(String input, int pageNo, int pageSize) {
		   Session session = sessionFactory.getCurrentSession();
		    String queryString 	= "SELECT d FROM Donation d WHERE CONCAT(d.code,' ', d.phoneNumber, ' ', d.organizationName, ' ') "
		    		+ "LIKE :input";// query using in JpaRepository will woking
		    Query query = session.createQuery(queryString);
		    query.setParameter("input", "%" + input + "%"); // set value param with "%" to find depend on input
		    query.setFirstResult((pageNo-1)*pageSize);
			query.setMaxResults(pageSize);
		    List<Donation> donations = query.list();
		    return donations;
	}
	
	@Override
	public List<Donation> foundDonationByInfo(String input, int pageNo, int pageSize, int status) {
		   Session session = sessionFactory.getCurrentSession();
		   String queryString = "SELECT d FROM Donation d WHERE CONCAT(d.code,' ',d.phoneNumber, ' ', d.organizationName, ' ', d.status) LIKE :input OR d.status = :status";
		 
		    Query query = session.createQuery(queryString);
		    query.setParameter("input", "%" + input + "%"); // set value param with "%" to find depend on input
		    query.setParameter("status", status);
		    query.setFirstResult((pageNo-1)*pageSize);
			query.setMaxResults(pageSize);
		    List<Donation> donations = query.list();
		    return donations;
	}


	@Override
	public List<Donation> findDonationByStatus(Integer input, int pageNo, int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		String queryString = "FROM Donation d WHERE d.status = :input";
		Query query = session.createQuery(queryString);
	    query.setParameter("input", input);
	    List<Donation> donations = query.list();
		return donations;
	}


	@Override
	public Donation save(Donation donation) {
		Session session = sessionFactory.getCurrentSession();
		session.save(donation);
		return donation;
	}


	@Override
	public void delete(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String queryString = "DELETE Donation WHERE id=:id";
		Query query = session.createQuery(queryString);
		query.setParameter("id", id);
		query.executeUpdate();
	}


	@Override
	public Donation findById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Donation donation = session.get(Donation.class, id);
		return donation;
	}
	
	@Override
	public List<Donation> findAll(int pageNo, int pageSize){
		Session session = sessionFactory.getCurrentSession();
		Query<Donation> query = session.createQuery("FROM Donation", Donation.class);
		query.setFirstResult((pageNo-1)*pageSize);
		query.setMaxResults(pageSize);
		List<Donation> donations = query.getResultList();
		return donations;
	}

	
	@Override
	public List<Donation> findAll(){
		Session session = sessionFactory.getCurrentSession();
		Query<Donation> query = session.createQuery("FROM Donation", Donation.class);
		List<Donation> donations = query.getResultList();
		return donations;
	}

	@Override
	public long totalDonations() {
		Session session =  sessionFactory.getCurrentSession();
		Query<Long> count = session.createQuery("SELECT COUNT(*) FROM Donation",Long.class);
		long result = count.uniqueResult();
		return result;
	}

	//Test cái này : 
	@Override
	public Donation update(Donation donation) { // Using update donation info
		Session session =  sessionFactory.getCurrentSession();
		session.saveOrUpdate(donation);
		return donation;
	}


	@Override
	public long totalDonations(String input, int status) {
		 Session session = sessionFactory.getCurrentSession();
		   String queryString = "SELECT d FROM Donation d WHERE CONCAT(d.code,' ',d.phoneNumber, ' ', d.organizationName, ' ', d.status) LIKE :input OR d.status = :status";
		 
		    Query query = session.createQuery(queryString);
		    query.setParameter("input", "%" + input + "%"); // set value param with "%" to find depend on input
		    query.setParameter("status", status);
		    List<Donation> donations = query.list();
		    return donations.size();
	}
	
	@Override
	public long totalDonations(String input) {
		  Session session = sessionFactory.getCurrentSession();
		    String queryString 	= "SELECT d FROM Donation d WHERE CONCAT(d.code,' ', d.phoneNumber, ' ', d.organizationName, ' ') "
		    		+ "LIKE :input";// query using in JpaRepository will woking
		    Query query = session.createQuery(queryString);
		    query.setParameter("input", "%" + input + "%"); // set value param with "%" to find depend on input

		    List<Donation> donations = query.list();
		return donations.size();
	}
	
}
