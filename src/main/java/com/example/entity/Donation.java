package com.example.entity;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Entity
@Table(name = "donation")
public class Donation {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "code")
	@NotBlank(message = "Yêu Cầu nhập thông tin !")
	private String code;

	@Column(name = "local")
	private String local;

	@Column(name = "name")
	@NotBlank(message = "Yêu Cầu nhập thông tin tên đợt quyên góp!")
	private String name;

	@Column(name = "start_date")
	@NotBlank(message = "Cần có ngày bắt đầu.")
	private String startDate;

	@Column(name = "end_date")
	@NotBlank(message = "Cần có ngày kết thúc.")
	private String endDate;

	@Column(name = "organization_name")
	@NotBlank(message = "Yêu Cầu nhập thông tin !")
	private String organizationName;

	@Column(name = "phone_number")
	@Pattern(regexp = "^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$", message = "Yêu cầu số điện thoại")
	private String phoneNumber;

	@Column(name = "description")
	@NotBlank(message = "Yêu Cầu nhập thông tin !")
	private String description;

	@Column(name = "money")
	private long money;

	@Column(name = "status")
	@Min(value = 0, message = "Yêu cầu giai đoạn đợt quyên góp")
	private int status;

	 @OneToMany(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, mappedBy = "donation")
	private Set<UserDonation> listUserDonated;

    public Set<UserDonation> getListUserDonated() {
        return listUserDonated;
    }

    public void setListUserDonated(Set<UserDonation> listUserDonated) {
        this.listUserDonated = listUserDonated;
    }

	public Donation(int id, String code, String local, String name, String startDate, String endDate,
			String organizationName, String phoneNumber, String description, long money, int status) {

		this.id = id;
		this.code = code;
		this.local = local;
		this.name = name;
		this.startDate = startDate;
		this.endDate = endDate;
		this.organizationName = organizationName;
		this.phoneNumber = phoneNumber;
		this.description = description;
		this.money = money;
		this.status = status;
	}

	public Donation() {

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

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
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

	public long getMoney() {
		return money;
	}

	public void setMoney(long money) {
		this.money = money;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}










}