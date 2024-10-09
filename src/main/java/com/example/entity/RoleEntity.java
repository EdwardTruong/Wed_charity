package com.example.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "role")
public class RoleEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@NotNull
	@Column(name = "role_name")
	private String roleName;

	@OneToMany(mappedBy = "roleEntity", fetch = FetchType.EAGER)
	private List<UserEntity> users;

	
	
	public RoleEntity(int id, String roleName) {
		this.id = id;
		this.roleName = roleName;
	}
	
	public RoleEntity() {
	}

	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public List<UserEntity> getUsers() {
		return users;
	}

	public void setUsers(List<UserEntity> users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "RoleEntity [id=" + id + ", name=" + roleName + ", users=" + users + "]";
	}

	public void add(UserEntity tempUser) {
		if (users == null) {
			users = new ArrayList<>();
		}
		users.add(tempUser);

		tempUser.setRoleEntity(this);
	}
}
