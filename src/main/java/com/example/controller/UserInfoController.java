package com.example.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.entity.UserEntity;
import com.example.exception.UserNotFoundException;
import com.example.service.UserService;
import com.example.util.AppUtils;



/*
 * In this project users can find their own information and change some their fields information.
 * 
 * 1.The userInfo method is getting user information.
 * 	- I decide the user's password is "text" to easy check with database. (without login form !)
 *  - file.html user can access : public/home, public/detail , admin/user/detail.html , admin/user/edit.html 
 *  - form user can use  @PostMapping : admin/updateUser , /saveNewUserDonation
 */

@Controller
@RequestMapping("/user")
public class UserInfoController {

	@Autowired 
	UserService userService;
	
	@Autowired
	AppUtils utils;
	
	@GetMapping("/info/{id}")
	public String userInfo(@PathVariable("id") Integer userId, Model theModel, HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		
		if(user.getId() != userId) {
			return "redirect:/accessDenied";
		}
		
		UserEntity entity = userService.findById(userId);
		
		if(entity == null) {
			throw new UserNotFoundException("User not found");
		}
			
			session.setAttribute("user", entity);
			theModel.addAttribute("user",entity);
			theModel.addAttribute("user_created", utils.changeDateFormatDMY(entity.getCreated()));
			theModel.addAttribute("pageTitle", "Thông tin người dùng : " + entity.getFullName());
		
		return "admin/user/detail";
	}
	
	@GetMapping("/edit/{id}")
	public String userEdit(@PathVariable("id") Integer userId, Model theModel, HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		
		if( (user == null)|| user.getId() != userId) {
			return "redirect:/accessDenied";
		}
		
		UserEntity entity = userService.findById(userId);
		
		if(entity == null) {
			throw new UserNotFoundException("User not found");
		}
			
			session.setAttribute("user", entity);
			session.setAttribute("userEdit", true);
			theModel.addAttribute("userEdit", true); // đang fix
		
			theModel.addAttribute("user",entity);
			theModel.addAttribute("user_created", utils.changeDateFormatDMY(entity.getCreated()));
			theModel.addAttribute("pageTitle", "Thông tin người dùng : " + entity.getFullName());
		
		return "admin/user/edit";
	}
	
}
