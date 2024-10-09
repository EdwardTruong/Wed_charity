package com.example.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.DonationDao;
import com.example.dto.DonationDto;
import com.example.entity.Donation;
import com.example.mapper.DonationMapper;
import com.example.service.DonationService;
import com.example.service.UserDonationService;

/*
 * In is project the method findDonationByInfo () has a little error : 
 * if in page 1, the function is ok but in page 2 have problem with count list - fix late
 */

@Service
@Transactional
public class DonationServiceImpl implements DonationService {

	@Autowired
	DonationDao dDao;

	@Autowired
	DonationMapper dMapper;

	@Autowired
	UserDonationService uDService;

	@Override
	public Donation findById(Integer id) {
		Donation donation = dDao.findById(id);
		return donation;
	}

	@Override
	@Transactional
	public Donation saveNew(DonationDto dto) {
		dto.setStatus(0);
		dto.setMoney("0 VND");
		Donation entity = dMapper.toEntity(dto);
		dDao.save(entity);
		return entity;
	}

	@Override
	public Donation findByCode(String code) {
		return dDao.findByCode(code);
	}

	@Override
	@Transactional
	public void deleteDonation(Donation entity) {
		dDao.delete(entity.getId());
	}

	@Override
	public List<Donation> findAll(int pageNo, int pageSize) {
		return (List<Donation>) dDao.findAll(pageNo, pageSize);
	}

	@Override
	public List<Donation> findAll() {
		return (List<Donation>) dDao.findAll();
	}

	@Override
	public List<DonationDto> findDonationByInfo(String input, int pageNo, int pageSize) {

		List<Donation> list = dDao.foundDonationByInfo(input, pageNo, pageSize);

		List<DonationDto> result = dMapper.toListDto(list);
		return result;
	}
	
	@Override
	public List<DonationDto> findDonationByInfo(String input, int pageNo, int pageSize, int status) {

		List<Donation> list = dDao.foundDonationByInfo(input, pageNo, pageSize,status);

		List<DonationDto> result = dMapper.toListDto(list);
		return result;
	}
	

	@Override
	public long totalDonations() {
		return dDao.totalDonations();
	}

	@Override
	public Donation update(Donation entity) {
		return dDao.update(entity);

	}

	@Override
	public int analysisInput(String input) {
		int result = Integer.MAX_VALUE;
		if (input.toLowerCase().contains("mới") || input.toLowerCase().contains("moi")) {
			result = 0;
		} else if (input.toLowerCase().contains("đang quyên góp") || input.toLowerCase().contains("đang")
				|| input.toLowerCase().contains("đang quyên") || input.toLowerCase().contains("dang")
				|| input.toLowerCase().contains("dang quyen")) {
			result = 1;

		} else if (input.toLowerCase().contains("kết thúc") || input.toLowerCase().contains("ket thuc")
				|| input.toLowerCase().contains("kết") || input.toLowerCase().contains("ket")) {
			result = 2;

		} else if (input.toLowerCase().contains("đóng quyên góp") || input.toLowerCase().contains("đóng")
				|| input.toLowerCase().contains("đóng quyên") || input.toLowerCase().contains("dong")) {
			result = 3;
		}
		return result;
	}

	@Override
	public long totalDonations(String searching) {
		return dDao.totalDonations(searching);
		
	}

	@Override
	public long totalDonations(String searching, int checkStatus) {
		return dDao.totalDonations(searching,checkStatus);
	}

}
