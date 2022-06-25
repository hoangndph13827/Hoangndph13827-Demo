package java5_Lab5.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.aspectj.weaver.NewConstructorTypeMunger;
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
import java5_Lab5.entities.Category;
import java5_Lab5.entities.Product;
import java5_Lab5.repositories.AccountRepositories;
import java5_Lab5.repositories.CategoryRepositories;
import java5_Lab5.repositories.ProductRepositories;
import java5_Lab5.service.SessionService;
import lombok.val;

@Controller
@RequestMapping("/trangChu")
public class TrangChuController {
	@Autowired ProductRepositories repositoriesProduct;
	@Autowired CategoryRepositories categoryRepositories;
	@Autowired AccountRepositories accountRepositories;
	@Autowired SessionService sessionService;
	
	private  Category category;
	
	@GetMapping("/index")
	public String index(
			@ModelAttribute("account") AccountModel accountModel
			
			) {
		
		return "trangChu/index";
	}
	
	@GetMapping("/dangXuat")
	public String dangXuat(
			@ModelAttribute("account") AccountModel accountModel
			) {
		sessionService.remove("user");
		return "redirect:/trangChu/index";
	}
	
	
	@PostMapping("/login")
	public String login(
			 @ModelAttribute("account") AccountModel accountModel
			) {
		
		Account account=  accountRepositories.
				findByUsername(accountModel.getUsername());
		if(account!=null) {
			if(account.getPassword().equals(accountModel.getPassword())) {
				sessionService.set("user", account);
				sessionService.set("listPrd", new ArrayList<Product>());
			}
		}
		
		return "redirect:/trangChu/index";
	}
	
	
	
	@GetMapping("/timTheoIdCtg/{id}")
	public String timTheoId(
			@PathVariable("id") Category category
			) {
		this.category=category;
		return "redirect:/trangChu/index";
	}
	
	@GetMapping("/allCtg")
	public String allCtg(
			) {
		this.category=null;
		return "redirect:/trangChu/index";
	}
	
	@ModelAttribute("prds")
	public List<Product> pros(){
		if(!(category==null))
			return repositoriesProduct.findByCategoryAndStatus(category,false);
		return repositoriesProduct.findByStatus(false);
	}
	@ModelAttribute("ctgs")
	public List<Category> categorys(){
		return categoryRepositories.findByStatus(false);
	}
}
