package com.example.dao;

import java.util.List;

import com.example.dto.UserDto;
import com.example.entity.UserEntity;


public interface UserDao {

	UserEntity getUserByUserName(String userName);

	UserEntity getUserByEmail(String email);

	UserEntity findById(int id);
	
	List<UserEntity> findAll();
	
	void save(UserEntity user);
	
	void delete(int id);
	
	void update(UserEntity user);
	
	List<UserEntity> searchingFindUserByEmailOrPhoneNumber(String input,int pageNo, int pageSize);

	List<UserEntity> listUsers(int pageNo, int pageSize);

	long totalUser();

	long totalUserFound(String input);

	

}
