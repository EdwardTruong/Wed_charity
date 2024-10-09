package com.example.util;

import java.beans.PropertyEditorSupport;

import org.springframework.stereotype.Component;

import com.example.dao.RoleDao;
import com.example.entity.RoleEntity;



/*
 * When admin or user need update info then field RoleEntity of UserEntity cannot catch in client and send 
 * it to server, so we need a class extends PropertyEditorSupport to convert String become RoleEntity
 * 	
 * BONUT : 	-Add @Transactional in to  RoleDao to create a transaction when RoleEntityEditor calling.
 * 			-In controller we add @InitBinder to WebDataBinder.registerCustomEditor(class was binder , class binder )
 */

@Component
public class RoleEntityEditor extends PropertyEditorSupport{
	
	private RoleDao roleDao;
	
    public RoleEntityEditor(RoleDao roleDao) {
		this.roleDao = roleDao;
	}



	@Override
    public void setAsText(String text) {
    	if (text != null && !text.isEmpty()) {
            Integer roleId = Integer.parseInt(text); // Assume text is the ID of the RoleEntity
            RoleEntity role = roleDao.findById(roleId);
            setValue(role);
        } else {
            setValue(null); // Set null if text is empty
        }
    }
}
