package com.example.dao.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dao.UserDonationtDao;
import com.example.entity.UserDonation;

@Repository
public class UserDonationtDaoImpl implements UserDonationtDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<UserDonation> findByDonationId(int donationId, int pageNo, int pageSize) {
	    Session session = sessionFactory.getCurrentSession();
	    Query<UserDonation> query = session.createQuery("FROM UserDonation ud WHERE ud.donation.id = :donationId", UserDonation.class);
	    query.setParameter("donationId", donationId);
	    query.setFirstResult((pageNo - 1) * pageSize);
	    query.setMaxResults(pageSize);
	    List<UserDonation> usersDonation = query.list();
	    return usersDonation;
	}

	@Override
	public long totalUserDonation(int donationId) {
		Session session = sessionFactory.getCurrentSession();
		Query<Long> count = session
				.createQuery("SELECT COUNT(ud) FROM UserDonation ud WHERE ud.donation.id = :donationId", Long.class)
				.setParameter("donationId", donationId);
		long result = count.uniqueResult();
		return result;
	}

	@Override
	public List<UserDonation> findAll() {
		Session session = sessionFactory.getCurrentSession();
		Query<UserDonation> query = session.createQuery("FROM UserDonation", UserDonation.class);
		List<UserDonation> result = query.getResultList();
		return result;
	}

	@Override
	public UserDonation update(UserDonation userDonation) { // Using update
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(userDonation);
		return userDonation;
	}

	@Override
	public void delete(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String queryString = "DELETE UserDonation WHERE id=:id";
		Query query = session.createQuery(queryString);
		query.setParameter("id", id);
		query.executeUpdate();
	}

	@Override
	public UserDonation findById(int id) {
		Session session = sessionFactory.getCurrentSession();
		UserDonation userDonation = session.get(UserDonation.class, id);
		return userDonation;
	}

	@Override
	public Set<UserDonation> findByDonationId(int donationId) {
	    Session session = sessionFactory.getCurrentSession();
	    Query<UserDonation> query = session.createQuery("FROM UserDonation ud WHERE ud.donation.id = :donationId", UserDonation.class);
	    query.setParameter("donationId", donationId); 
	    List<UserDonation> usersDonation = query.getResultList();
	    Set<UserDonation> result = new HashSet<>();
	    for(UserDonation i : usersDonation) {
	    	result.add(i);
	    }
	    return result;
	}

	@Override
	public void save(UserDonation userDonation) {
		  Session session = sessionFactory.getCurrentSession();
		  session.save(userDonation);
	}

	@Override
	public void merge(UserDonation userDonation) {
		Session session = sessionFactory.getCurrentSession();
		  session.merge(userDonation);
	}
	
	@Override
	public List<UserDonation> findUserDonationByUserIdAndDonationId(int idUser, int idDonation) {
		 Session session = sessionFactory.getCurrentSession();
		    String queryString = "FROM UserDonation ud WHERE ud.user.id = :idUser and ud.donation.id = :idDonation";
		    Query query = session.createQuery(queryString);
		    query.setParameter("idUser", idUser);
		    query.setParameter("idDonation", idDonation);
		    List<UserDonation> users = query.getResultList();
		    return users;
	}

	@Override
	public List<UserDonation> findUserDonationByDonationId(int idDonation) {
		Session session = sessionFactory.getCurrentSession();
	    String queryString = "FROM UserDonation ud WHERE ud.donation.id = :idDonation";
	    Query query = session.createQuery(queryString);
	    query.setParameter("idDonation", idDonation);
	    List<UserDonation> usersDonated = query.getResultList();
	    return usersDonated;
	}

	@Override
	public List<UserDonation> findByUserId(Integer userId) {
		Session session = sessionFactory.getCurrentSession();
	    String queryString = "FROM UserDonation ud WHERE ud.user.id = :userId";
	    Query query = session.createQuery(queryString);
	    query.setParameter("userId", userId);
	    List<UserDonation> usersDonated = query.getResultList();
		return usersDonated;
	}

	

}
