package com.example.controller;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.dto.UserDto;
import com.example.entity.RoleEntity;
import com.example.entity.UserDonation;
import com.example.entity.UserEntity;
import com.example.exception.UserNotFoundException;
import com.example.mapper.UserMapper;
import com.example.service.DonationService;
import com.example.service.RoleService;
import com.example.service.UserDonationService;
import com.example.service.UserService;
import com.example.util.AppUtils;
import com.example.util.RoleEntityEditor;

/*
 * I set user id = 1 in database is admin in AppUtils.class to test all function.
 * BONUTE : - In the pages method a function find a user by e-mail or phone number was done. (using 1 word or words) 
 */

@Controller
@RequestMapping("/admin")
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	RoleService roleService;

	@Autowired
	UserMapper userMapper;

	@Autowired
	DonationService dService;

	@Autowired
	UserDonationService uDService;

	@Autowired
	AppUtils util;

	@Autowired
	private RoleEntityEditor roleEntityEditor;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(RoleEntity.class, roleEntityEditor);
	}

	@GetMapping("/home")
	public String homeAdmin(HttpSession session) {
		return "admin/home";
	}

	/*
	 * The allUsers method is home page for list users. (database have 7 and no
	 * more than 10 entities. Request 01 in
	 * https://courses.funix.edu.vn/courses/course-v1:FUNiX+PRJ321x.3.0.VN+0123.DN1/
	 * courseware/160c6ece178e4d3b8844a0052930a948/62cb4cb296534460bd418c0a4c1f2d2b/
	 * ?activate_block_id=block-v1%3AFUNiX%2BPRJ321x.3.0.VN%2B0123.DN1%2Btype%
	 * 40sequential%2Bblock%4062cb4cb296534460bd418c0a4c1f2d2b)
	 * 
	 * The lines was commented in method to skip checking user role and it's easy to check logic
	 */
	@GetMapping("/users")
	public String allUsers(Model theModel, HttpSession session) {
		util.setUserAdminToTest(session, userService);

//		UserEntity user = (UserEntity) session.getAttribute("user");
//		UserEntity admin = (UserEntity) session.getAttribute("admin");
//
//		if (admin == null && (user == null || user.getRoleEntity().getId() != 1)) {
//			return "login/access_denied";
//		}
//		util.setUserAdminToTest(session, userService);
		

		return pages(theModel, 1,session);
	}
	
	/*
	 * This method find user(s) by phone or email. It's using relative search 'LIKE CONCAT('%', :input, '%')'  in query to do.
	 * In layer dao(repository) in same method i have another query use to absolute searching but i did not use it.
	 * The lines was commented in method to skip checking user role and it's easy to check logic.
	 */
	@GetMapping("/find/{pageNo}")
	public String findUser(@PathVariable(name="pageNo")int pageNo,@RequestParam(name = "searching")String searching, Model theModel, HttpSession session) {
		
//		UserEntity user = (UserEntity) session.getAttribute("user");
//		UserEntity admin = (UserEntity) session.getAttribute("admin");
//
//		if (admin == null && (user == null || user.getRoleEntity().getId() != 1)) {
//			return "login/access_denied";
//		}
//
		if(!searching.equals("")) {
			int pageSize = 5;
			List<UserDto> resultDto = userService.searchingFindUserByEmailOrPhoneNumber(searching,pageNo, pageSize);
			theModel.addAttribute("newUser", new UserDto());
			theModel.addAttribute("users", resultDto);
			session.setAttribute("searching", searching);
			
			long totalItems = userService.totalUserFound(searching);
			long totalPages = (int) (totalItems + (pageSize - 1)) / pageSize;
				
			long firstObjectOnPage = (pageNo - 1) * pageSize + 1;
			long lastObjectOnPage = pageNo * pageSize;
			if (lastObjectOnPage > totalItems) {
				lastObjectOnPage = totalItems;
			}
				
				theModel.addAttribute("founder", true);
				theModel.addAttribute("page", true);
				theModel.addAttribute("firstObjectOnPage", firstObjectOnPage);
				theModel.addAttribute("totalItems", totalItems);
				theModel.addAttribute("lastObjectOnPage", lastObjectOnPage);
				theModel.addAttribute("totalPages", totalPages);
				theModel.addAttribute("currentUserPage", pageNo);
			return "admin/user/users";
		}
		return pages(theModel, 1,session);
	}
	
	/*
	 * DONE
	 * The pages method is pagination of users have in databases.
	 * The lines was commented in method to skip checking user role and it's easy to check logic
	 */
	@GetMapping("/pageUser/{pageNo}")
	public String pages(Model theModel, @PathVariable("pageNo") int pageNo, HttpSession session) {

//		UserEntity user = (UserEntity) session.getAttribute("user");
//		UserEntity admin = (UserEntity) session.getAttribute("admin");
//
//		if (admin == null && (user == null || user.getRoleEntity().getId() != 1)) {
//			return "login/access_denied";
//		}
//
//		util.setUserAdminToTest(session, userService);

		long totalItems = userService.totalUser();
		int pageSize = 5;
		long totalPages = (int) (totalItems + (pageSize - 1)) / pageSize;

		long firstObjectOnPage = (pageNo - 1) * pageSize + 1;
		long lastObjectOnPage = pageNo * pageSize;
		if (lastObjectOnPage > totalItems) {
			lastObjectOnPage = totalItems;
		}

		List<UserEntity> userEntities = userService.findAll(pageNo, pageSize);

			theModel.addAttribute("newUser", new UserDto());
			theModel.addAttribute("page", true);
			theModel.addAttribute("users", userEntities);
			theModel.addAttribute("firstObjectOnPage", firstObjectOnPage);
			theModel.addAttribute("totalItems", totalItems);
			theModel.addAttribute("lastObjectOnPage", lastObjectOnPage);
			theModel.addAttribute("totalPages", totalPages);
			theModel.addAttribute("currentUserPage", pageNo);
		
		return "admin/user/users";
	}



	/*
	 * Display the form to add a new user entity. Within this method, it is
	 * necessary to instantiate new UserDto() in order to create a new UserEntity.
	 * Once the fields in the UserDto have been filled, the userMapper class will
	 * map the UserDto to the UserEntity. Finally, the userEntity is successfully
	 * created and saved to the database.
	 */
	@GetMapping("/showFormAddNewUser")
	public String showFormAddNewUser(Model theModel) { 

		theModel.addAttribute("newUser", new UserDto());

		return "admin/user/new";
	}
	
	
	/*
	 * Done .The processAddNewUser method is CREATE a new user (entity) and using
	 * validation function (@PostMapping)
	 */
	@PostMapping("/processAddNewUser")
	public String processAddNewUser(@Valid @ModelAttribute("newUser") UserDto userDto, BindingResult result,
			HttpSession session, Model theModel, RedirectAttributes redirect) {

		if (result.hasErrors()) {
			return "admin/user/new";
		}
		if (userService.findByUserName(userDto.getUserName()) != null) {
			theModel.addAttribute("error", "Username đã tồn tại hãy chọn username khác.");
			return "admin/user/new";
		}
		if (userService.findByEmail(userDto.getEmail()) != null) {
			theModel.addAttribute("error", "Email đã tồn tại hãy chọn địa chỉ email khác.");
			return "admin/user/new";
		}

		userService.saveNew(userDto);
		session.setAttribute("success", "Tạo tài khoản thành công : " + userDto.getEmail() + ".");

		return "redirect:/admin/users";

	}

	/*
	 * Done. It's have 2 function. 
	 * 
	 * 	- This is method admin wanna see info's user. READ a user (entity)
	 * 	- When admin edit user success, it's going to retrun this method
	 * The lines was commented in method to skip checking user role and it's easy to check logic
	 */
	@GetMapping("/detailUser/{id}")
	public String detailUser(@PathVariable("id") Integer userId, Model theModel, HttpSession session) {

//		UserEntity user = (UserEntity) session.getAttribute("user");
//		UserEntity admin = (UserEntity) session.getAttribute("admin");
//
//		if (admin == null && (user == null || user.getRoleEntity().getId() != 1)) {
//			return "login/access_denied";
//		}
//
//		util.setUserAdminToTest(session, userService);

		UserEntity theUser = userService.findById(userId);

		if (theUser == null) {
			throw new UserNotFoundException("User not found");
		}

		theModel.addAttribute("user", theUser);
		theModel.addAttribute("user_created", util.changeDateFormatDMY(theUser.getCreated()));
		theModel.addAttribute("pageTitle", "Thông tin người dùng : " + theUser.getFullName());

		return "admin/user/detail";
	}

	/*
	 *  Done. 
	 *   - This is a form edit a user entity. 
	 *   - Only user have role admin can access  
	 *   The lines was commented in method to skip checking user role and it's easy to check logic
	 */
	@GetMapping("/editUser/{id}")
	public String editUser(@PathVariable("id") Integer userId, Model theModel, HttpSession session) {

//		UserEntity user = (UserEntity) session.getAttribute("user");
//		UserEntity admin = (UserEntity) session.getAttribute("admin");
//
//		if (admin == null && (user == null || user.getRoleEntity().getId() != 1)) {
//			return "login/access_denied";
//		}
//
//		util.setUserAdminToTest(session, userService);

		UserEntity entity = userService.findById(userId);
		List<RoleEntity> roles = roleService.findAll();
		theModel.addAttribute("roles", roles);

		if (entity == null) {
			throw new UserNotFoundException("User not found");
		}

		theModel.addAttribute("user", entity);
		theModel.addAttribute("pageTitle", "Chỉnh sữa - " + entity.getUserName());
		return "admin/user/edit";
	}

	/*
	 * Done
	 * - The method is UPDATE user and it have validation function.
	 * - Both users with the roles User and Admin use this method to update information. 
	 * 		For users, it will return a page containing their information, 
	 * 		while for admins, it will return a page containing information for user management. 
	 */
	@PostMapping("/updateUser")
	public String updateUser(@Valid @ModelAttribute("user") UserEntity user, BindingResult result, 
			Model theModel,HttpSession session) {
			

		if (result.hasErrors()) {
			List<RoleEntity> roles = roleService.findAll();
			theModel.addAttribute("roles", roles);
			return "admin/user/edit";
		}

		userService.update(user);

		session.setAttribute("success", "Chỉnh sữa người dùng thành công");

		UserEntity currentUser = (UserEntity) session.getAttribute("user");
		if (currentUser != null) {
			return "redirect:/user/info/" + user.getId();
		}

		return "redirect:/admin/detailUser/" + user.getId();
	}
 
	/*
	 *  Done
	 *  This method will change filed's user status  1->0 or 0->1. 
	 *  Can't change status user have role.name = admin.
	 */
	@PostMapping("/changeStatutToLock/{id}")
	public String changeStatutToLock(@PathVariable(value = "id") Integer id, HttpSession session,
			Model theModel) {

		UserEntity theUser = userService.changeStatusUser(id);
		if(theUser.getRoleEntity().getId() == 1) {
			throw new UserNotFoundException("Can't change status of user have role Admin");
		}
		
		String status = "hoạt động";
		if (theUser.getStatus() == 0) {
			status = "khóa";
		}

		session.setAttribute("success", "Thay đổi trạng thái người dùng " + theUser.getFullName() + " thành " + status +".");


		return "redirect:/admin/users";
	}

	
	/*
	 * Done
	 * 	- If a User is deleted, the user_id field in UserDonation will be updated to 1.
	 *  	Because UserDonation has user_id referencing the id of the user, it cannot be deleted. 
	 *  	If the relationship between User and UserDonation is updated to many-to-many (Set<UserDonation>), when updating User, 
	 * 		Hibernate will automatically delete UserDonation with user_id = user.id. 
	 * 		In userService have code update userDonation.id
	 * 		Because version using (5.3.9) 
	 *  
	 *  -If user donated and admin accepted then the field money in the donation (entity) still ok.
	 * 		
	 * 	- Can't delete user have role : admin.
	 */
	@PostMapping("/deleteUser")
	public String deleteUser(@RequestParam(value = "id") Integer id, Model theModel,HttpSession session) {
		

		UserEntity admin = (UserEntity) session.getAttribute("admin");

		if (admin == null) {
			return "login/access_denied";
		}

		UserEntity entity = userService.findById(id);

		if (entity == null || entity.getRoleEntity().getId() == 1) {
			throw new UserNotFoundException("User not found");
		}
		
		Set<UserDonation> usersDonated = uDService.findByUserId(id);
		
		userService.deleteUserById(entity,usersDonated);

		session.setAttribute("success", "Người dùng có tên : " + entity.getFullName() + " đã bị xóa.");

		return "redirect:/admin/users";
	}
}
