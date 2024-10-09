package com.example.dto;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

public class UserDonationDto {

	private int id;

	private String created;

	@NotBlank(message = "Nhập tên người quyên góp")
	private String name;

	private int userId;

	private int donationId;

	@Min(value = 10000, message = "Số tiền tối thiểu là 10.000 VND")
	@Max(value = 999999999, message = "Số tiền tối đa là 999,999,999 VND.")
	private String money;

	private int status;

	@NotBlank(message = "Hãy viết một số thông tin chia sẽ.")
	private String text;

	public UserDonationDto(int id, String created, String name, int userId, int donationId, String money, int status,
			String text) {
		this.id = id;
		this.created = created;
		this.name = name;
		this.userId = userId;
		this.donationId = donationId;
		this.money = money;
		this.status = status;
		this.text = text;
	}

	public UserDonationDto() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getDonationId() {
		return donationId;
	}

	public void setDonationId(int donationId) {
		this.donationId = donationId;
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

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	
	
}
