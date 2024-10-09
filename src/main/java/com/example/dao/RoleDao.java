package com.example.dao;

import java.util.List;

import com.example.entity.RoleEntity;


public interface RoleDao {
	RoleEntity findById (int id);
	List<RoleEntity> findAll();
}
