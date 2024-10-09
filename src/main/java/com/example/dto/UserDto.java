package com.example.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.stereotype.Component;

import com.example.entity.RoleEntity;

@Component
public class UserDto {

	private int id;

	@Size(min = 1, max = 100, message = "Nhập địa chỉ")
	private String address;

	@Email(message = "Email Không đúng định dạng. Vui lòng nhập lại.")
	@NotBlank(message = "Yêu cầu thông tin email.")
	private String email;

	@Size(min = 4, message = "Cần điền đầy đủ thông tin.")
	private String fullName;

	@Size(min = 4, message = "Mật khẩu cần ít nhất 4 ký tự.")
	private String password;

	@Pattern(regexp = "^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$", message = "Nhập số điện thoại di động.")
	private String phoneNumber;

	@Size(min = 6, max = 20, message = " Yêu cầu cần có 6 đến 12 ký tự, không có khoảng trắng và không dấu.")
	private String userName;

	private int status;

	private String created;

	private RoleEntity roleEntity;
	
	@NotBlank(message = "Yêu cầu cần có chức danh !")
	private String roleId;

	public UserDto(int id, @Size(min = 1, max = 100, message = "Nhập địa chỉ") String address, String email,
			String fullName, String password, String phoneNumber, String userName, RoleEntity role, String roleId, int status,
			String created) {
		this.id = id;
		this.address = address;
		this.email = email;
		this.fullName = fullName;
		this.password = password;
		this.phoneNumber = phoneNumber;
		this.userName = userName;
		this.status = status;
		this.created = created;
		this.roleEntity = role;
		this.roleId = roleId;
	}

	public UserDto() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}


	public RoleEntity getRoleEntity() {
		return roleEntity;
	}

	public void setRoleEntity(RoleEntity roleEntity) {
		this.roleEntity = roleEntity;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

}
