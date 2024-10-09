package com.example.service;

import java.util.List;
import java.util.Set;

import com.example.dto.UserDto;
import com.example.entity.UserDonation;
import com.example.entity.UserEntity;

public interface UserService {
	
	List<UserEntity> findAll(int pageNo, int pageSize);

	UserEntity findById(Integer id);
	
	UserEntity findByUserName(String userName);
	
	UserEntity findByEmail(String email);

	UserEntity saveNew(UserDto dto);

	UserEntity update(UserEntity user);

	void deleteUserById(UserEntity user, Set<UserDonation> usersDonated);

	UserEntity getUserByUserNameAndPassword(String userName, String password);

	UserEntity changeStatusUser(int id);

	List<UserDto> searchingFindUserByEmailOrPhoneNumber(String input, int pageNo, int pageSize);

	long totalUser();

	long totalUserFound(String input);


	
//	Page<UserDto> findUserByInfo(int pageNo, int pageSize, String input);
//	Page<UserDto> findAll(int pageNo , int pageSize);	
}
