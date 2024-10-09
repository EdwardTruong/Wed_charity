package com.example.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.RoleDao;
import com.example.entity.RoleEntity;
import com.example.service.RoleService;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

	@Autowired
	RoleDao roleDao;
	
	@Override
	public List<RoleEntity> findAll() {
		List<RoleEntity> roles = roleDao.findAll();
		return roles;
	}

	
	@Override
	public RoleEntity findById(Integer id) {
		return roleDao.findById(id);
	}
}
