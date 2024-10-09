package com.example.service;

import java.util.List;

import com.example.dto.DonationDto;
import com.example.entity.Donation;

public interface DonationService {

	Donation findById(Integer id);
	
	Donation findByCode(String code);
	
	Donation saveNew(DonationDto dto);

	void deleteDonation(Donation entity);

	public List<Donation> findAll(int pageNo, int pageSize);

	List<DonationDto> findDonationByInfo(String input,int pageNo, int pageSize);

	List<Donation> findAll();
	
	long totalDonations();

	Donation update(Donation entity);

	int analysisInput(String searching);

	List<DonationDto> findDonationByInfo(String input, int pageNo, int pageSize, int status);

	long totalDonations(String searching);

	long totalDonations(String searching, int checkStatus);
}
