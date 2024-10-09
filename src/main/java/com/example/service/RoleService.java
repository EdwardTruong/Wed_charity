package com.example.service;

import java.util.List;

import com.example.entity.RoleEntity;

public interface RoleService {
	List<RoleEntity> findAll();

	RoleEntity findById(Integer id);
}
