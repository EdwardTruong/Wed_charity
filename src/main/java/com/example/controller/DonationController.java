package com.example.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.dto.DonationDto;
import com.example.dto.UserDonationDto;
import com.example.entity.Donation;
import com.example.entity.UserDonation;
import com.example.exception.DonationNotFoundException;
import com.example.service.DonationService;
import com.example.service.UserDonationService;
import com.example.service.UserService;
import com.example.util.AppUtils;

/*
 * First at all I set HttpSession for check each any role so 
 * 	for each @GetMapping i use HttpSession.getAttribute to do it.
 * When i run project to test logic, i comments all setting httpSession to skip check role.
 * 
 * 
 * BONUTE : function find donation by info include : code or phone number or name of organization or status ; 
 * 		was working.(using 1 word or words) 
 * DONE ! 
 */

@Controller
@RequestMapping("/admin")
public class DonationController {

	@Autowired
	DonationService dService;

	@Autowired
	UserService userService;

	@Autowired
	AppUtils utils;

	@Autowired
	UserDonationService uDService;

	/*
	 * Method index using to return views have pagination The lines was commented in
	 * method to skip checking user role and it's easy to check logic
	 */
	@GetMapping("/donations")
	public String index(Model theModel, HttpSession session) {

//		UserEntity user = (UserEntity) session.getAttribute("user");
//		UserEntity admin = (UserEntity) session.getAttribute("admin");
//
//		if (admin == null && (user == null || user.getRoleEntity().getId() != 1)) {
//			return "login/access_denied";
//		}

//		utils.setUserAdminToTest(session, userService);

		return listPage(theModel, 1, session);
	}

	/*
	 * The listPage method is pagination of users have in databases. The lines was
	 * commented in method to skip checking user role and it's easy to check logic
	 */
	@GetMapping("/pageDonation/{pageNo}")
	public String listPage(Model theModel, @PathVariable("pageNo") int pageNo, HttpSession session) {

//		UserEntity user = (UserEntity) session.getAttribute("user");
//		UserEntity admin = (UserEntity) session.getAttribute("admin");
//
//		if (admin == null && (user == null || user.getRoleEntity().getId() != 1)) {
//			return "login/access_denied";
//		}

		long totalItems = dService.totalDonations();
		int pageSize = 5;
		long totalPages = (int) (totalItems + (pageSize - 1)) / pageSize;

		long firstObjectOnPage = (pageNo - 1) * pageSize + 1;
		long lastObjectOnPage = pageNo * pageSize;
		if (lastObjectOnPage > totalItems) {
			lastObjectOnPage = totalItems;
		}

		List<Donation> donations = dService.findAll(pageNo, pageSize);

		theModel.addAttribute("newDonation", new DonationDto());

		theModel.addAttribute("page", true);
		theModel.addAttribute("donations", donations);
		theModel.addAttribute("firstObjectOnPage", firstObjectOnPage);
		theModel.addAttribute("totalItems", totalItems);
		theModel.addAttribute("lastObjectOnPage", lastObjectOnPage);
		theModel.addAttribute("totalPages", totalPages);
		theModel.addAttribute("currentPage", pageNo);

		return "admin/donation/donations";
	}

	/*
	 * Chưa đổi 
	 * This method find user(s) by phone or email. It's using relative
	 * search 'LIKE CONCAT('%', :input, '%')' in query to do. In layer
	 * dao(repository) in same method i have another query use to absolute searching
	 * but i did not use it. The lines was commented in method to skip checking user
	 * role and it's easy to check logic.
	 */
	@GetMapping("/dfind/{pageNo}")
	public String findDonation(@PathVariable(name = "pageNo") int pageNo,
			@RequestParam(name = "searching") String searching, Model theModel, HttpSession session) {

//		UserEntity user = (UserEntity) session.getAttribute("user");
//		UserEntity admin = (UserEntity) session.getAttribute("admin");
//
//		if (admin == null && (user == null || user.getRoleEntity().getId() != 1)) {
//			return "login/access_denied";
//		}
//
		if (!searching.equals("")) {
			int pageSize = 5;
			int checkStatus = dService.analysisInput(searching);
			long totalItems = 0;
			List<DonationDto> resultDto = new ArrayList<>();
			if(checkStatus >3) {
				resultDto = dService.findDonationByInfo(searching, pageNo, pageSize);
				totalItems = dService.totalDonations(searching);
			}else {
				resultDto = dService.findDonationByInfo(searching, pageNo, pageSize,checkStatus);
				totalItems = dService.totalDonations(searching,checkStatus);
			}
			
			theModel.addAttribute("newDonation", new DonationDto());


			session.setAttribute("searching", searching);

			
			long totalPages = (int) (totalItems + (pageSize - 1)) / pageSize;

			long firstObjectOnPage = (pageNo - 1) * pageSize + 1;
			long lastObjectOnPage = pageNo * pageSize;
			if (lastObjectOnPage > totalItems) {
				lastObjectOnPage = totalItems;
			}

			theModel.addAttribute("page", true);
			theModel.addAttribute("founder", true);
			theModel.addAttribute("donations", resultDto);
			theModel.addAttribute("firstObjectOnPage", firstObjectOnPage);
			theModel.addAttribute("totalItems", totalItems);
			theModel.addAttribute("lastObjectOnPage", lastObjectOnPage);
			theModel.addAttribute("totalPages", totalPages);
			theModel.addAttribute("currentPage", pageNo);
			return "admin/donation/donations";
		}
		return listPage(theModel, 1, session);
	}

	/*
	 * The formAddNewDonation method is show a form to register a new donation.
	 */
	@GetMapping("/formAddNewDonation")
	public String formAddNewDonation(Model theModel) {
		theModel.addAttribute("newDonation", new DonationDto());

		if (AppUtils.allDonationInDatabase >= 10) {
			theModel.addAttribute("max", "Số donation đã tạo đạt giới hạn là 10. Hãy xóa bớt user để thêm mới !");
		}

		return "admin/donation/new";
	}

	/*
	 * The addNewDonation method is CREATE a new donation (entity) has validation
	 * function
	 * 
	 */
	@PostMapping("/addNewDonation")
	public String addNewDonation(@Valid @ModelAttribute("newDonation") DonationDto donationDto,
			BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes, HttpSession session) {

		if (bindingResult.hasErrors()) {
			return "admin/donation/new";
		}

		if (utils.checkInputDate(donationDto.getStartDate(), donationDto.getEndDate())) {
			model.addAttribute("error", "Sai ngày bắt đầu và kết thúc");
			return "admin/donation/new";
		}

		if (dService.findByCode(donationDto.getCode()) != null) {
			model.addAttribute("error", "Code đã tồn tại hãy chọn code khác.");
			return "admin/donation/new";
		}

		dService.saveNew(donationDto);
		redirectAttributes.addFlashAttribute("message", "Thêm mới đợi quyên góp thành công.");
		return "redirect:/admin/donations";
	}

	/*
	 * The detail method is READ donation (entity) and it allows the admin to see
	 * details of a specific donation, including information about the user and
	 * providing pagination functionality.
	 */
	@GetMapping("/detailDonation/{id}")
	public String detail(@PathVariable(value = "id") Integer donationId,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model theModel, HttpSession session) {
//
//		UserEntity user = (UserEntity) session.getAttribute("user");
//		UserEntity admin = (UserEntity) session.getAttribute("admin");
//
//		if (admin == null && (user == null || user.getRoleEntity().getId() != 1)) {
//			return "login/access_denied";
//		}
//
//		utils.setUserAdminToTest(session, userService);

		Donation theDonation = dService.findById(donationId);

		System.out.println("Check in form detail : ");

		if (theDonation == null) {
			throw new DonationNotFoundException("Donation not found !");
		}

		int pageSize = 5;

		long totalItems = uDService.totalItems(theDonation.getId());
		long totalPages = (int) (totalItems + (pageSize - 1)) / pageSize;
		long firstObjectOnPage = (pageNo - 1) * pageSize + 1;
		long lastObjectOnPage = pageNo * pageSize;
		if (lastObjectOnPage > totalItems) {
			lastObjectOnPage = totalItems;
		}
		int startPage = pageNo;
		int endPage = 0;
		if (totalItems < 5) {
			endPage = 1;
		} else if (startPage == totalPages) {
			endPage = startPage;
		} else {
			endPage = startPage + 1;
		}

		List<UserDonationDto> userDonations = uDService.findByDonationIdAndPaginate(donationId, pageNo, pageSize);

		theModel.addAttribute("userDonations", userDonations);
		theModel.addAttribute("donation", theDonation);
		if (userDonations.isEmpty()) {
			theModel.addAttribute("page", false);
		} else {
			theModel.addAttribute("page", true);

			theModel.addAttribute("startPage", startPage);
			theModel.addAttribute("endPage", endPage);

			theModel.addAttribute("firstObjectOnPage", firstObjectOnPage);
			theModel.addAttribute("totalItems", totalItems);
			theModel.addAttribute("lastObjectOnPage", lastObjectOnPage);
			theModel.addAttribute("totalPages", totalPages);
			theModel.addAttribute("pageNo", pageNo);
		}

		theModel.addAttribute("donated", utils.convertToVND(theDonation.getMoney()));
		theModel.addAttribute("startDate", utils.changeDateFormatDMY(theDonation.getStartDate()));
		theModel.addAttribute("endDate", utils.changeDateFormatDMY(theDonation.getEndDate()));

		theModel.addAttribute("pageTitle", "Thông tin đợi quyên góp : " + theDonation.getName());

		return "admin/donation/detail";
	}

	/*
	 * The method edit Donation show 2 partes. 1.Infomation's Donation entity
	 * 2.List<UserDonation> who has donated for current donation. Pagination for
	 * List<UserDonation>. The lines was commented in method to skip checking user
	 * role and it's easy to check logic
	 */
	@GetMapping("/editDonation/{id}")
	public String editDonation(@PathVariable("id") Integer donationId,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model theModel, HttpSession session) {

//		UserEntity user = (UserEntity) session.getAttribute("user");
//		UserEntity admin = (UserEntity) session.getAttribute("admin");
//
//		if (admin == null && (user == null || user.getRoleEntity().getId() != 1)) {return "login/access_denied";}
//		utils.setUserAdminToTest(session, userService);

		Donation theDonation = dService.findById(donationId);

		if (theDonation == null) {
			throw new DonationNotFoundException("Donation not found !");
		}

		int pageSize = 5;

		long totalItems = uDService.totalItems(theDonation.getId());
		long totalPages = (int) (totalItems + (pageSize - 1)) / pageSize;
		long firstObjectOnPage = (pageNo - 1) * pageSize + 1;
		long lastObjectOnPage = pageNo * pageSize;
		if (lastObjectOnPage > totalItems) {
			lastObjectOnPage = totalItems;
		}
		int startPage = pageNo;
		int endPage = 0;
		if (totalItems < 5)
			endPage = 1;
		else if (startPage == totalPages)
			endPage = startPage;
		else
			endPage = startPage + 1;

		List<UserDonationDto> userDonations = uDService.findByDonationIdAndPaginate(donationId, pageNo, pageSize);

		theModel.addAttribute("userDonations", userDonations); // Show infomation.
		theModel.addAttribute("donation", theDonation); // Show infomation.

		theModel.addAttribute("userDonations", userDonations);

		if (userDonations.isEmpty()) {
			theModel.addAttribute("page", false);
		} else {
			theModel.addAttribute("page", true);

			theModel.addAttribute("startPage", startPage);
			theModel.addAttribute("endPage", endPage);

			theModel.addAttribute("firstObjectOnPage", firstObjectOnPage);
			theModel.addAttribute("totalItems", totalItems);
			theModel.addAttribute("lastObjectOnPage", lastObjectOnPage);
			theModel.addAttribute("totalPages", totalPages);
			theModel.addAttribute("pageNo", pageNo);
		}

		theModel.addAttribute("donated", utils.convertToVND(theDonation.getMoney()));
		theModel.addAttribute("numberSize", totalItems);
		
		theModel.addAttribute("pageTitle", "Cập nhật đợt quyên góp : " + theDonation.getName());
		theModel.addAttribute("pageTitle", "Cập nhật đợt quyên góp : " + theDonation.getName());

		theModel.addAttribute("donation", theDonation);

		return "admin/donation/edit";
	}

	/*
	 * The editDonation method is UPDATE donation (entity) and it allows admin to
	 * active of a specific donation, including information about the user and
	 * providing pagination functionality.
	 */
	@PostMapping("/updateDonation")
	public String updateDonation(@Valid @ModelAttribute("donation") Donation donation, BindingResult bindingResult,
			Model theModel, HttpSession session) {
		if (bindingResult.hasErrors()) {
			List<ObjectError> resutl = bindingResult.getAllErrors();
			for (ObjectError i : resutl) {
				System.out.println(i.getDefaultMessage());
			}
			return "admin/donation/edit";
		}
		if (utils.checkInputDate(donation.getStartDate(), donation.getEndDate())) {
			theModel.addAttribute("errorDate", true);
			return "admin/donation/edit";
		}

		Set<UserDonation> findUserDonated = uDService.findByDonationId(donation.getId());

		donation.setListUserDonated(findUserDonated);

		for (UserDonation i : findUserDonated) {
			System.out.println(i.getId() + " - " + i.getStatus());
		}

		dService.update(donation);

		session.setAttribute("message", "Cập nhật thông tin thành công");

		return "redirect:/admin/detailDonation/" + donation.getId();
	}

	/*
	 * To delete a donation we need to delete userDonation where donation_id = dontion.id because 
	 * user_donation CONSTRAINT donation_id FOREIGN KEY (`donation_id`) REFERENCES `donation` (`id`)
	 */
	@PostMapping("/deleteDonation")
	public String deleteDonation(@RequestParam("idDonation") Integer idDonation, Model theModel,
			 HttpSession session) {

//		UserEntity user = (UserEntity) session.getAttribute("user");
//		UserEntity admin = (UserEntity) session.getAttribute("admin");
//
//		if (admin == null && (user == null || user.getRoleEntity().getId() != 1)) {
//			return "login/access_denied";
//		}

		Donation theDonation = dService.findById(idDonation);

		if (theDonation == null) {
			throw new DonationNotFoundException("Donation not found !");
		}

		Set<UserDonation> userDonate = uDService.findByDonationId(idDonation);
 		uDService.delete(userDonate);
		dService.deleteDonation(theDonation);


		session.setAttribute("message", "Đã xóa đợt quyên góp : " + theDonation.getName() + " thành công.");

		return "redirect:/admin/donations";
	}

	/*
	 * The updateMoneyDonatedSuccess method is update Money. It change status 0 to 1 and count donated into the donation.
	 */
	@PostMapping("/updateDonated")
	public String updateMoneyDonatedSuccess(@RequestParam("userDonationId") Integer userDonationId
			, HttpSession session) {

		UserDonation ud = uDService.findById(userDonationId);
		ud.setStatus(1);
		Donation currentDonation = ud.getDonation();
		long currentMoney = currentDonation.getMoney();
		long donated = ud.getMoney();
		long updateMoney = currentMoney + donated;
		currentDonation.setMoney(updateMoney);
		dService.update(currentDonation);
		uDService.update(ud);

		session.setAttribute("success",
				"Cập nhật tiền cho quyên góp thành công :" + " + " + utils.convertToVND(donated));
		return "redirect:/admin/editDonation/" + currentDonation.getId();
	}

	/*
	 * The deniedDonated method is changing status 0 to 2 of user_donation entity and not count donated into donation
	 */
	@PostMapping("/deniedDonated")
	public String deniedDonated(@RequestParam("userDonationId") Integer userDonationId,
			HttpSession session) {

		UserDonation ud = uDService.findById(userDonationId);
		long donated = ud.getMoney();
		ud.setStatus(2);
		Donation currentDonation = ud.getDonation();
		uDService.update(ud);

		session.setAttribute("success", "Hủy quyên góp với tiền : " + utils.convertToVND(donated));
		return "redirect:/admin/editDonation/" + currentDonation.getId();
	}

	/*
	 * *The deleteUserDonation method is DELETE a userDonation entity and
	 * update(minus money if admin accepted - field status is 1 ) money of donation
	 * then user donated
	 */
	@PostMapping("/deleteUserDonation")
	public String deleteUserDonation(@RequestParam("userDonationId") Integer userDonationId,
			HttpSession session) {

		UserDonation ud = uDService.findById(userDonationId);
		String name = ud.getName();
		Donation currentDonation = ud.getDonation();
		long donated = ud.getMoney();
		if (ud.getStatus() == 1) {
			long currentMoney = currentDonation.getMoney();
			currentDonation.setMoney(currentMoney - donated);
			dService.update(currentDonation);
		}
		session.setAttribute("success",
				"Đã xóa quyên góp của nhà hảo tâm " + name + " với tiền : " + utils.convertToVND(donated));

		uDService.delete(ud);
		return "redirect:/admin/editDonation/" + currentDonation.getId();
	}
}
