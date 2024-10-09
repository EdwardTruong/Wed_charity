package com.example.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.UserDonationtDao;
import com.example.dto.UserDonationDto;
import com.example.entity.UserDonation;
import com.example.mapper.UserDonationMapper;
import com.example.service.UserDonationService;
import com.example.util.AppUtils;

@Service
@Transactional
public class UserDonationServiceImpl implements UserDonationService {

	@Autowired
	UserDonationtDao uDao;

	@Autowired
	UserDonationMapper udMapper;

	@Autowired
	AppUtils utils;

	@Override
	public List<UserDonation> findAll() {
		return uDao.findAll();
	}

	@Override
	public UserDonation findById(Integer id) {
		UserDonation userDonation = uDao.findById(id);
		return userDonation;
	}

	@Override
	@Transactional
	public UserDonation update(UserDonation entity) {
		uDao.update(entity);
		return entity;
	}

	@Override
	@Transactional
	public void delete(UserDonation ud) {
		uDao.delete(ud.getId());
	}
	
	
	@Override
	@Transactional
	public void delete(Set<UserDonation> usersDonated) {
		for(UserDonation i : usersDonated) {
			this.delete(i);
		}
	}

	@Override
	@Transactional
	public UserDonation saveNew(UserDonationDto dto) {
		dto.setCreated(utils.currentDatefomart());
		dto.setStatus(0);
		UserDonation entity = udMapper.toEntity(dto);
		uDao.save(entity);
		return entity;
	}

	@Override
	public List<UserDonationDto> findByDonationIdAndPaginate(Integer donationId, int pageNo, int pageSize) {
		List<UserDonation> listUserDotated = uDao.findByDonationId(donationId, pageNo, pageSize);
		List<UserDonationDto> dtos = udMapper.toListDto(listUserDotated);
		return dtos;
	}

	@Override
	public long totalItems(Integer donationId) {
		return uDao.totalUserDonation(donationId);
	}

	@Override
	public Set<UserDonation> findByDonationId(Integer donationId) {
		return (Set<UserDonation>) uDao.findByDonationId(donationId);
	}



	@Override
	public void save(UserDonation userDonation) {
		uDao.save(userDonation);
	}

	@Override
	public void merge(UserDonation userDonation) {
		uDao.merge(userDonation);
		System.out.println(userDonation.getId());

	}


	@Override
	public Set<UserDonation> findByUserId(Integer userId) {
		List<UserDonation> temp = uDao.findByUserId(userId);
		Set<UserDonation> result = new HashSet<>();
		for(UserDonation i : temp) {
			result.add(i);
		}
		return result;
	}
}
