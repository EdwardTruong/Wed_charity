package com.example.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;



@Entity
@Table(name = "user")
public class UserEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "address")
	@NotBlank(message = "Yêu cầu địa chỉ.")
	private String address;

	@Column(name = "email", unique = true)
	@Email(message = "Email Không đúng định dạng. Vui lòng nhập lại.")
	@NotBlank(message = "Yêu cầu nhập email.")
	private String email;

	@Column(name = "full_name")
	@NotBlank(message = "Yêu cầu thông tin username.")
	private String fullName;

	@Column(name = "note")
	private String note;

	@Column(name = "password")
	@Size(min = 4, message = "Mật khẩu cần ít nhất 4 ký tự.")
	private String password;

	@Column(name = "phone_number")
	@Pattern(regexp = "^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$", message = "Yêu cầu số điện thoại di động.")
	private String phoneNumber;

	@Column(name = "status")
	@NotNull(message = "Yêu cầu thông tin hoạt động.")
	private int status;

	@Column(name = "user_name", unique = true)
	@NotBlank(message = "Cần thông tin username.")
	private String userName;

	@Column(name = "created")
	private String created;

	@ManyToOne(fetch = FetchType.EAGER, cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
	@JoinColumn(name = "role_id")
	private RoleEntity roleEntity;

	@OneToMany(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, mappedBy = "user")
    private Set<UserDonation> donationList;

	public Set<UserDonation> getDonationList() {
		return donationList;
	}

	public void setDonationList(Set<UserDonation> donationList) {
		this.donationList = donationList;
	}
    
	public UserEntity(int id, String address, String email, String fullName, String note, String password, String phoneNumber,
			int status, String userName, String created, RoleEntity role) {
		this.id = id;
		this.address = address;
		this.email = email;
		this.fullName = fullName;
		this.note = note;
		this.password = password;
		this.phoneNumber = phoneNumber;
		this.status = status;
		this.userName = userName;
		this.created = created;
		this.roleEntity = role;

	}

	public UserEntity() {
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

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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









}
