package com.example.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.dto.UserLoginDto;
import com.example.entity.UserEntity;
import com.example.service.UserService;
import com.example.util.AppUtils;



/*
 *	LoginController is a function for authentication.
 *	
 *	1. The formLogin method is a form for client login page
 *	2. The processForm method is process form.
 *		- I decided to allow users with the admin role to access any urls.
 *		- Users with the user role restrict access url by HttpSession for each method.
 *		- URL access for User role is UserInfoController.class 
 *		and 1 @PostMapping in UserController.class (/home , user/info, user/edit, admin/updateUser)
 */

@Controller
public class LoginController {

	@Autowired
	UserService userService;

	@Autowired
	AppUtils utils;

	@GetMapping("/login")
	public String formLogin(Model theModel) {
		theModel.addAttribute("userLoginDto", new UserLoginDto());
		return "login/login";
	}

	@PostMapping("/processFormLogin")
	public String processForm(@ModelAttribute("userLoginDto") UserLoginDto loginDto,
			HttpSession session, Model theModel) {

		UserEntity theUser = userService.getUserByUserNameAndPassword(loginDto.getUsername(), loginDto.getPassword());

		if (theUser == null) {
	        session.setAttribute("error", "Sai tài khoản hoặc mật khẩu.");
	        return "redirect:/login";
		}
		if (theUser.getRoleEntity().getId() == 1) {
			session.setAttribute("admin", theUser);
			return "redirect:/admin/home";
		}else {
			session.setAttribute("user", theUser);
		}
		
		return "redirect:/home";
	}

	@GetMapping("/logout")
	public String logout( HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/accessDenied")
	public String accessDeniedPage(Model theModel, HttpSession session) {
		UserEntity userEntity = (UserEntity)session.getAttribute("user");
		
		if(userEntity != null) {
			session.setAttribute("user", userEntity);
		}
		return "login/access_denied";
	}
	
}
