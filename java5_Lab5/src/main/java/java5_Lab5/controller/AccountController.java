package java5_Lab5.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java5_Lab5.beans.AccountModel;
import java5_Lab5.entities.Account;
import java5_Lab5.repositories.AccountRepositories;

@Controller
@RequestMapping("/account")
public class AccountController {
	@Autowired AccountRepositories repositories;
	
	@GetMapping("/index")
	public String category(
			@ModelAttribute("account") AccountModel accountModel
			) {
		return "account/index";
	}
	
	@PostMapping("/add")
	public String addCategory(
			@Validated @ModelAttribute("account") AccountModel accountModel,
			BindingResult result
			) {
		if(result.hasErrors()) {
			return "/account/index";
		}
		Account account= new Account();
		account.setActivated(0);
		account.setAdmin(accountModel.getAdmin());// 0 user 1 admin
		account.setFullname(accountModel.getFullname());
		account.setEmail(accountModel.getEmail());
		account.setPassword(accountModel.getPassword());
		account.setPhoto(accountModel.getPhoto());
		account.setUsername(accountModel.getUsername());
		repositories.save(account);
		return "redirect:/account/index";
	}
	
	@PostMapping("/delete/{id}")
	public String deleteCategory(
			@PathVariable("id") Account account
			) {
		account.setActivated(1);// 1 la xoa
		repositories.save(account);
		return "redirect:/account/index";
	}
	
	
	@PostMapping("/update/{username}")
	public String updateAccount(
			@Validated @ModelAttribute("account") AccountModel accountModel,
			@PathVariable("username") Account account,
			BindingResult result
			) {
		if(result.hasErrors()) {
			return "/account/index";
		}
		account.setActivated(0);
		account.setAdmin(accountModel.getAdmin());// 0 user 1 admin
		account.setFullname(accountModel.getFullname());
		account.setEmail(accountModel.getEmail());
		account.setPassword(accountModel.getPassword());
		account.setPhoto(accountModel.getPhoto().isEmpty()?account.getPhoto():accountModel.getPhoto());
		account.setUsername(accountModel.getUsername());
		repositories.save(account);
		return "redirect:/account/index";
	}
	
	@ModelAttribute("acc")
	public List<Account> categorys(){
		return repositories.findByActivated(0);
	}
	
	@GetMapping("/edit/{username}")
	public String edit(
			@ModelAttribute("account") AccountModel  accountModel,
			@PathVariable("username") Account account
			) {
		accountModel.setUsername(account.getUsername());
		accountModel.setAdmin(account.getAdmin());
		accountModel.setEmail(account.getEmail());
		accountModel.setFullname(account.getFullname());
		accountModel.setPassword(account.getPassword());
		accountModel.setPhoto(account.getPhoto());
		accountModel.setActivated(account.getActivated());
		return "/account/index";
	}
}
