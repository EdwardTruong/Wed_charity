package com.example.service.impl;

import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.UserDao;
import com.example.dto.UserDto;
import com.example.entity.RoleEntity;
import com.example.entity.UserDonation;
import com.example.entity.UserEntity;
import com.example.mapper.UserMapper;
import com.example.service.RoleService;
import com.example.service.UserDonationService;
import com.example.service.UserService;
import com.example.util.AppUtils;



@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;

	@Autowired
	UserMapper userMapper;
	
	@Autowired
	RoleService roleService;
	
	@Autowired
	UserDonationService uDService;

	@Autowired
	AppUtils utils;

	@Override
	public UserEntity findById(Integer id) {
		UserEntity result = userDao.findById(id);
		return result;
	}

	@Override
	public List<UserDto> findAll(int pageNo, int pageSize) {
		
		 List<UserEntity> listUser = userDao.listUsers(pageNo, pageSize);
		 return userMapper.toListDto(listUser);
	}
	
	@Override
	public long totalUser() {
		return userDao.totalUser();
	}

	@Override
	public UserEntity update(UserEntity user) {
		userDao.update(user);
		return user;
	}

	@Override
	public void deleteUserById(UserEntity user, Set<UserDonation> usersDonated) {
		for(UserDonation i : usersDonated) {
			i.getUser().setId(1);
			uDService.update(i);
		}
		
		userDao.delete(user.getId());
	}


	@Override
	public UserEntity findByUserName(String userName) {
		return userDao.getUserByUserName(userName);
	}



	@Override
	public UserEntity findByEmail(String email) {
		return userDao.getUserByEmail(email);
	}
	
	
	@Override
	public UserEntity getUserByUserNameAndPassword(String userName, String password) {
		UserEntity theUser = userDao.getUserByUserName(userName);
		if (theUser != null && theUser.getPassword().equals(password)) {
			return theUser;
		}
		return null;
	}

	@Override
	public UserEntity saveNew(UserDto dto) {
		dto.setStatus(1);
		dto.setCreated(utils.currentDatefomart());
		UserEntity newUser = userMapper.toEntity(dto);
		RoleEntity role = new RoleEntity();
		
		if(dto.getRoleId().equals("1")) {
			 role = roleService.findById(1);
		}else {
			 role = roleService.findById(2);
		}
		
		newUser.setRoleEntity(role);
		
		
		userDao.save(newUser);
		return newUser;
	}

	@Override
	public UserEntity changeStatusUser(int id) {
		UserEntity theUser = this.findById(id);

		if (theUser.getStatus() == 1) {
			theUser.setStatus(0);
		} else if (theUser.getStatus() == 0) {
			theUser.setStatus(1);
		}
		userDao.save(theUser);
		return theUser;

	}

	@Override
	public List<UserDto> searchingFindUserByEmailOrPhoneNumber(String input, int pageNo, int pageSize) {
		List<UserEntity> user = userDao.searchingFindUserByEmailOrPhoneNumber(input, pageNo, pageSize);
		return userMapper.toListDto(user);
	}

	@Override
	public long totalUserFound(String input) {
		return userDao.totalUserFound(input);
	}
}
