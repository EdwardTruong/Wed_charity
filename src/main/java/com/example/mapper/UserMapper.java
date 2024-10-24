package com.example.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import com.example.dto.UserDto;
import com.example.entity.UserEntity;

@Component
public class UserMapper {

	public UserEntity toEntity(UserDto dto) {
		UserEntity entity = new UserEntity();
		entity.setId(dto.getId());
		entity.setAddress(dto.getAddress());
		entity.setEmail(dto.getEmail());
		entity.setFullName(dto.getFullName());
		entity.setPhoneNumber(dto.getPhoneNumber());
		entity.setStatus(dto.getStatus());
		entity.setUserName(dto.getUserName());
		entity.setCreated(dto.getCreated());
		entity.setPassword(dto.getPassword());
		return entity;
	}

	public UserDto toDto(UserEntity entity) {

		UserDto dto = new UserDto();

		String roleId = String.valueOf(entity.getRoleEntity().getId());
		
		dto.setId(entity.getId());
		dto.setAddress(entity.getAddress());
		dto.setEmail(entity.getEmail());
		dto.setFullName(entity.getFullName());
		dto.setPhoneNumber(entity.getPhoneNumber());
		dto.setStatus(entity.getStatus());
		dto.setUserName(entity.getUserName());
		dto.setCreated(entity.getCreated());
		dto.setIdRole(entity.getRoleEntity().getId());
		dto.setRoleId(roleId);

		return dto;
	}

	public List<UserDto> toListDto(List<UserEntity> listEntity) {
		return listEntity.stream().map(entity -> toDto(entity)).toList();
	}

//	public Page<UserDto> toListDto(Page<User> listUsers) {
//		return listUsers.map(this::toDto);
//	}

}
