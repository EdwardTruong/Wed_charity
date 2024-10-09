package com.example.dto;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class DonationDto {

	private int id;
	
	@Size(min = 1, max = 10, message = "Không để trống, min là 1 và max là 10.")
	private String code;

	@NotBlank(message = "Yêu cầu nhập thông tin tên đợt quyên góp!")
	private String name;

	@NotBlank(message = "Cần có ngày bắt đầu.")
	private String startDate;

	@NotBlank(message = "Cần có ngày kết thúc.")
	private String endDate;

	@Size(min = 1, message = "Yêu Cầu nhập thông tin !")
	private String organizationName;

	@Pattern(regexp = "^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$", message = "Yêu cầu số điện thoại liên lạc.")
	private String phoneNumber;

	@NotBlank(message = "Yêu Cầu nhập thông tin mô tả !")
	private String description;

	private String local;

	private String money;

	@Min(value = 0, message = "Chọn trạng thái đợt quyên góp")
	private int status;

	public DonationDto(int id, String code, String name, String startDate, String endDate, String organizationName,
			String phoneNumber, String description, String local, String money, int status) {
		this.id = id;
		this.code = code;
		this.name = name;
		this.startDate = startDate;
		this.endDate = endDate;
		this.organizationName = organizationName;
		this.phoneNumber = phoneNumber;
		this.description = description;
		this.local = local;
		this.money = money;
		this.status = status;
	}

	public DonationDto() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	

}
