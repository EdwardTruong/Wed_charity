package com.example.dao.impl;

import java.util.List;
import java.util.Optional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dao.UserDao;
import com.example.dto.UserDto;
import com.example.entity.UserEntity;


@Repository
public class UserDaoImpl implements UserDao{

	@Autowired
	SessionFactory sessionFactory;
	

	@Override
	public UserEntity findById(int id) {
		Session session =  sessionFactory.getCurrentSession();
		UserEntity user = session.get(UserEntity.class, id);
		return user;
	}

	@Override
	public List<UserEntity> findAll() {
		Session session =  sessionFactory.getCurrentSession();
		Query<UserEntity> query = session.createQuery("FROM UserEntity", UserEntity.class);
		return query.getResultList();
	}

	@Override
	public void save(UserEntity user) {
		Session session =  sessionFactory.getCurrentSession();
		session.save(user);
	}

	@Override
	public void update(UserEntity user) {
		Session session =  sessionFactory.getCurrentSession();
		session.saveOrUpdate(user);
	}
	@Override
	public void delete(int id) {
		Session session =  sessionFactory.getCurrentSession();
		String queryString = "DELETE UserEntity u WHERE u.id= :id";
		Query query = session.createQuery(queryString);
		query.setParameter("id", id);
		query.executeUpdate();
	}

	
	
	@Override
	public UserEntity getUserByUserName(String userName) {
	    Session session = sessionFactory.getCurrentSession();
	    String queryString = "FROM UserEntity u WHERE u.userName = :username";
	    Query query = session.createQuery(queryString);
	    query.setParameter("username", userName);
	    UserEntity user = (UserEntity) query.uniqueResult();
	    return user;
	}

	@Override
	public UserEntity getUserByEmail(String email) {
		 Session session = sessionFactory.getCurrentSession();
		    String queryString = "FROM UserEntity u WHERE u.email = :email";
		    Query query = session.createQuery(queryString);
		    query.setParameter("email", email);
		    UserEntity user = (UserEntity) query.uniqueResult();
		    return user;
	}

//	String queryString = "SELECT u.id, u.fullName, u.email, u.phoneNumber, u.userName, u.roleEntity, u.status, "
//			+ "FROM UserEntity u WHERE u.email LIKE CONCAT('%', :input, '%') OR u.phoneNumber LIKE CONCAT('%', :input, '%')";
	@Override
	public List<UserEntity> searchingFindUserByEmailOrPhoneNumber(String input, int pageNo, int pageSize) {
		 Session session = sessionFactory.getCurrentSession();
		    String queryString = "SELECT u FROM UserEntity u WHERE u.email LIKE CONCAT('%', :input, '%') OR u.phoneNumber LIKE CONCAT('%', :input, '%')";		    
		 
		 Query query = session.createQuery(queryString);
		    query.setParameter("input", input);
		    query.setFirstResult((pageNo-1)*pageSize);
			query.setMaxResults(pageSize);
		    List<UserEntity> users = query.getResultList();
		    return users;
	}

	

	@Override
	public List<UserEntity> listUsers(int pageNo, int pageSize) {
		Session session =  sessionFactory.getCurrentSession();
		Query<UserEntity> query = session.createQuery("FROM UserEntity", UserEntity.class);
		query.setFirstResult((pageNo-1)*pageSize);
		query.setMaxResults(pageSize);
		List<UserEntity> users = query.getResultList();
		return users;
	}

	@Override
	public long totalUser() {
		Session session =  sessionFactory.getCurrentSession();
		Query<Long> count = session.createQuery("SELECT COUNT(u.id) FROM UserEntity u",Long.class);
		long result = count.uniqueResult();
		return result;
	}
	
	@Override
	public long totalUserFound(String input) {
		Session session =  sessionFactory.getCurrentSession();
		Query<Long> count = session.createQuery("SELECT COUNT(u.id) FROM UserEntity u WHERE u.email LIKE CONCAT('%', :input, '%') OR u.phoneNumber LIKE CONCAT('%', :input, '%')",Long.class);
		count.setParameter("input", input);
		long result = count.uniqueResult();
		return result;
	}
	

}
