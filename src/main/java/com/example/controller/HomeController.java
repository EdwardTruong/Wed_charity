package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.dto.UserDonationDto;
import com.example.entity.Donation;
import com.example.entity.UserDonation;
import com.example.entity.UserEntity;
import com.example.exception.DonationNotFoundException;
import com.example.service.DonationService;
import com.example.service.UserDonationService;
import com.example.service.UserService;
import com.example.util.AppUtils;




/*
 * First at all I set HttpSession for user if they are login succeed and then i check each any role of users. 
 * 	I use HttpSession.getAttribute("user") or HttpSession.getAttribute("admin") or both for each @GetMapping.
 * 
 * 
 * 
 * 
 * 3.The saveNewUserDonation method is CREATE new user_donation (entity) has validation 
 * 	and of course user need to login succeed and field status is '1' (hoạt động). (@PostMapping) 
 * 
 * 4.The accessDeniedPage method is access denied page. If user wasn't  admin role 
 * 		or HttpSession.getMaxInactiveInterval() = 0 (time off) or some some exceptions
 *  	they going to see access denied page.
 *  
 *  BONUTE : i set timeout of HttpSession :  server.servlet.session.timeout=900s in application.properties.
 *  
 *  DONE !
 */

@Controller
public class HomeController {

	@Autowired
	DonationService dService;

	@Autowired
	UserDonationService uDService;

	@Autowired
	UserService uService;

	@Autowired
	AppUtils utils;

	boolean isHomePage = true;

	/*
	 * It's home page.
	 * The home method retrieves all donations from the database, converts them into DonationDto objects, 
	 * and sends the paginated results to the client.
	 * 
	 */
	@GetMapping({ "/", "/home" })
	public String homePage(Model theModel, HttpSession session) {

		UserEntity admin = (UserEntity) session.getAttribute("admin");
		UserEntity user = (UserEntity) session.getAttribute("user");
		
		if (admin != null) {
			session.setAttribute("admin", admin);
			
		}else if(user != null){
			session.setAttribute("user", user);
		
		}
		return listPage(theModel, 1);
	}
	/*
	 * It's same things with home but listPage using pagination.
	 */
	@GetMapping({ "/page/{pageNo}" })
	public String listPage(Model theModel, @PathVariable("pageNo") int pageNo) {

		long totalItems = dService.totalDonations();
		int pageSize = 5;
		long totalPages = (int)(totalItems + (pageSize - 1)) / pageSize;
		long firstObjectOnPage = (pageNo - 1) * pageSize + 1;
		long lastObjectOnPage = pageNo * pageSize;
		if (lastObjectOnPage > totalItems) {
			lastObjectOnPage = totalItems;
		}		
		
		List<Donation> donations = dService.findAll(pageNo, pageSize);
		theModel.addAttribute("userDonation", new UserDonationDto());
		theModel.addAttribute("page", true);
		theModel.addAttribute("donations", donations);
		theModel.addAttribute("firstObjectOnPage", firstObjectOnPage);
		theModel.addAttribute("totalItems", totalItems);
		theModel.addAttribute("lastObjectOnPage", lastObjectOnPage);
		theModel.addAttribute("totalPages", totalPages);
		theModel.addAttribute("currentPage", pageNo);
		return "public/home";
	}
	/*
	 * -The donationDetail method is getting information of a donation.
	 * -The lines was commented in method to skip checking user role and it's easy to check logic.
	 * 
	 * -The boolean isHomePage use to check when user wamna do something it keeps the user at the current position of the view,  
	 * 	and then return different views.
	 * 
	 * -Pagination only  
	 */
	@GetMapping({ "/detail/{id}" })
	public String donationDetail(@PathVariable("id") Integer donationId,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model theModel, HttpSession session) {

		isHomePage = false;
		
		UserEntity user = (UserEntity) session.getAttribute("user");
		UserEntity admin = (UserEntity) session.getAttribute("admin");
		
		if (admin != null) {
			session.setAttribute("admin", admin);
			
		}else if(user != null){
			session.setAttribute("user", user);
		}

		Donation donation = dService.findById(donationId);

		if (donation == null) {
			throw new DonationNotFoundException("Donation not found !");
		}

		int pageSize = 5;

		List<UserDonationDto> userDonations = uDService.findByDonationIdAndPaginate(donationId, pageNo, pageSize);

		if (userDonations.isEmpty()) {
			theModel.addAttribute("page", false);
			theModel.addAttribute("donationSize", "Chưa có nhà hảo tâm quyên góp.");
			
		} else {
			long totalItems = uDService.totalItems(donation.getId());			
			long totalPages = (int)(totalItems + (pageSize - 1)) / pageSize;
			long firstObjectOnPage = (pageNo - 1) * pageSize + 1;
			long lastObjectOnPage = pageNo * pageSize;
			if (lastObjectOnPage > totalItems) {
				lastObjectOnPage = totalItems;
			}	
			int startPage = pageNo;
			int endPage = pageNo+1;
			if(totalItems <5) {
				endPage = 1;	
			}else if(startPage == totalPages) {
				endPage = startPage;
			}else {
				endPage = startPage+1;
			}
			
			
			theModel.addAttribute("page", true);
			theModel.addAttribute("donationSize", "Số nhà hảo tâm quyên góp : " + totalItems + " người.");
			theModel.addAttribute("userDonations", userDonations);
			
			theModel.addAttribute("startPage", startPage);
			theModel.addAttribute("endPage", endPage);

			theModel.addAttribute("firstObjectOnPage", firstObjectOnPage);
			theModel.addAttribute("totalItems", totalItems);
			theModel.addAttribute("lastObjectOnPage", lastObjectOnPage);
			theModel.addAttribute("totalPages", totalPages);
			theModel.addAttribute("pageNo", pageNo);
			
			
			theModel.addAttribute("userDonation", userDonations);
		}

		theModel.addAttribute("donation", donation);
		
		theModel.addAttribute("newUserDonation", new UserDonationDto());
		theModel.addAttribute("donated", utils.convertToVND(donation.getMoney()));
		theModel.addAttribute("startDate", utils.changeDateFormatDMY(donation.getStartDate()));
		theModel.addAttribute("endDate", utils.changeDateFormatDMY(donation.getEndDate()));

		return "public/detail";
	}

	
	
	@PostMapping("/saveUserDonation")
	public String saveNewUserDonation(@Valid @ModelAttribute("newUserDonation") UserDonationDto dto,
			BindingResult bindingResult, Model theModel, RedirectAttributes redirectAttributes, HttpSession session) {

		Donation donation = dService.findById(dto.getDonationId());

		UserEntity curentUser = (UserEntity) session.getAttribute("user");
		UserEntity admin = (UserEntity) session.getAttribute("admin");
		
		if (curentUser == null && admin == null) {
			return "redirect:/accessDenied";
		}
		
		if(curentUser == null) {
			curentUser = admin;
		}

		if (curentUser.getStatus() == 0) {
			redirectAttributes.addFlashAttribute("error",
					"Trạng thái người dùng đã bị khóa không thể quyên góp. Liên hệ với admin để thay đổi trạng thái hoạt động .");

			if (isHomePage == true) {
				return "redirect:/home";
			}
			return "redirect:/detail/" + dto.getDonationId();
		}


		if (AppUtils.allUserDonatedInDatabase >= 10) {
			redirectAttributes.addFlashAttribute("error",
					"Số nhà hảo tâm đã quyên góp đạt tối đa cho toàn bộ website : 10. Làm ơn hãy đợi admin "
							+ "cập nhật để quyên góp.");

			if (isHomePage == true) {
				return "redirect:/home";
			}
			return "redirect:/detail/" + dto.getDonationId();
		}

		if (bindingResult.hasErrors()) {

			int pageSize = 5;
			int pageNo = 1;

			List<UserDonationDto> userDonations = uDService.findByDonationIdAndPaginate(donation.getId(), pageNo, pageSize);
			theModel.addAttribute("userDonation", userDonations);
			
			if (userDonations.isEmpty()) {
				theModel.addAttribute("page", false);
				theModel.addAttribute("donationSize", "Chưa có nhà hảo tâm quyên góp.");
				
			} else {
				long totalItems = uDService.totalItems(donation.getId());			
				long totalPages = (int)(totalItems + (pageSize - 1)) / pageSize;
				long firstObjectOnPage = (pageNo - 1) * pageSize + 1;
				long lastObjectOnPage = pageNo * pageSize;
				if (lastObjectOnPage > totalItems) {
					lastObjectOnPage = totalItems;
				}	
				int startPage = pageNo;
				int endPage = pageNo+1;
				if(totalItems <5) {
					endPage = 1;	
				}else if(startPage == totalPages) {
					endPage = startPage;
				}else {
					endPage = startPage+1;
				}
				
				theModel.addAttribute("page", true);
				theModel.addAttribute("donationSize", "Số nhà hảo tâm quyên góp : " + totalItems + " người.");
				theModel.addAttribute("userDonations", userDonations);
				
				theModel.addAttribute("startPage", startPage);
				theModel.addAttribute("endPage", endPage);

				theModel.addAttribute("firstObjectOnPage", firstObjectOnPage);
				theModel.addAttribute("totalItems", totalItems);
				theModel.addAttribute("lastObjectOnPage", lastObjectOnPage);
				theModel.addAttribute("totalPages", totalPages);
				theModel.addAttribute("pageNo", pageNo);
				
				theModel.addAttribute("userDonation", userDonations);
			}

			theModel.addAttribute("donation", donation);
			theModel.addAttribute("newUserDonation", new UserDonationDto());
			theModel.addAttribute("donated", utils.convertToVND(donation.getMoney()));
			theModel.addAttribute("startDate", utils.changeDateFormatDMY(donation.getStartDate()));
			theModel.addAttribute("endDate", utils.changeDateFormatDMY(donation.getEndDate()));

			theModel.addAttribute("newUserDonation", dto);
			
			session.setAttribute("errorMoney",bindingResult.getFieldError("money").getDefaultMessage());
			session.setAttribute("errorText", bindingResult.getFieldError("text").getDefaultMessage());
			session.setAttribute("errorName", bindingResult.getFieldError("name").getDefaultMessage());
		
			
			theModel.addAttribute("error", "Quyên góp không thành công.");

			return "public/detail";
		}

		UserDonation udEntity = uDService.saveNew(dto);
		udEntity.setDonation(donation);
		udEntity.setUser(curentUser);
		uDService.update(udEntity);

		redirectAttributes.addFlashAttribute("success", "Đã quyên góp vào " + donation.getName() + " số tiền "
				+ utils.convertToVND(Long.parseLong(dto.getMoney())) + "." + " Đợi ADMIN xác nhận.");

		if (isHomePage == true) {
			return "redirect:/home";
		}
		return "redirect:/detail/" + dto.getDonationId();
	}


}
