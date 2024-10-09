package com.example.service;

import java.util.List;
import java.util.Set;

import com.example.dto.UserDonationDto;
import com.example.entity.Donation;
import com.example.entity.UserDonation;
import com.example.entity.UserEntity;

public interface UserDonationService {
	List<UserDonation> findAll();

	UserDonation findById(Integer id);
	
	void delete(UserDonation ud);

	UserDonation update(UserDonation entity);

	UserDonation saveNew(UserDonationDto dto);

	List<UserDonationDto> findByDonationIdAndPaginate(Integer donationId, int pageNo, int pageSize);

	long totalItems(Integer donationId);
	
	Set<UserDonation> findByDonationId(Integer donationId);
	
	Set<UserDonation> findByUserId(Integer userId);

	void save(UserDonation userDonation);

	void merge(UserDonation userDonation);

	void delete(Set<UserDonation> usersDonated);
	
}
