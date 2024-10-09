package com.example.dao;

import java.util.List;
import java.util.Set;

import com.example.entity.UserDonation;

public interface UserDonationtDao {
	
	List<UserDonation> findByDonationId(int donationId ,int pageNo, int pageSize);
	
	Set<UserDonation> findByDonationId(int donationId);

	long totalUserDonation(int donationId);
	
	List<UserDonation> findAll();
	
	UserDonation update(UserDonation userDonation);
	void save(UserDonation userDonation);
	
	void delete(Integer id);
	
	UserDonation findById(int id);
	
	void merge(UserDonation userDonation);

	List<UserDonation> findUserDonationByUserIdAndDonationId(int idUser, int idDonation);

	List<UserDonation> findUserDonationByDonationId(int idDonation);

	List<UserDonation> findByUserId(Integer userId);
}
