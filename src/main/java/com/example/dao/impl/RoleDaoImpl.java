package com.example.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dao.RoleDao;
import com.example.entity.RoleEntity;

@Repository
@Transactional
public class RoleDaoImpl implements RoleDao {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public RoleEntity findById(int id) {
		Session session =  sessionFactory.getCurrentSession();
		RoleEntity role = session.get(RoleEntity.class,id);
		return role;
	}

	@Override
	public List<RoleEntity> findAll() {
		Session session =  sessionFactory.getCurrentSession();
		Query<RoleEntity> query = session.createQuery("FROM RoleEntity", RoleEntity.class);
		return query.getResultList();
	}
	
}
