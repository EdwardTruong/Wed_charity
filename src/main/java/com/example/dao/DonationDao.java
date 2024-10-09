package com.example.dao;

import java.util.List;

import com.example.entity.Donation;


public interface DonationDao  {

	Donation findByCode(String code);

	List<Donation> foundDonationByInfo(String input,int pageNo, int pageSize, int status);

	List<Donation> findDonationByStatus(Integer input,int pageNo, int pageSize);

	Donation save(Donation userDonation);
	
	void delete(Integer id);
	
	Donation findById(int id);

	List<Donation> findAll(int pageNo, int pageSize);

	long totalDonations();

	List<Donation> findAll();

	Donation update(Donation donation);

	List<Donation> foundDonationByInfo(String input, int pageNo, int pageSize);

	long totalDonations(String input,  int status);
	long totalDonations(String input);
	
}
