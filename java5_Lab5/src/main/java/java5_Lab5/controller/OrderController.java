package java5_Lab5.controller;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java5_Lab5.beans.OrderModel;
import java5_Lab5.entities.Account;
import java5_Lab5.entities.Order;
import java5_Lab5.repositories.AccountRepositories;
import java5_Lab5.repositories.OrderRepositories;

@RequestMapping("/order")
@Controller
public class OrderController {

	@Autowired OrderRepositories repositories;
	@Autowired AccountRepositories accountRepositories;
	
	@GetMapping("/index")
	public String order(
			 @ModelAttribute("order") OrderModel orderModel
			) {
		return "order/index";
	}
	
	@PostMapping("/add")
	public String addCategory(
			@Validated @ModelAttribute("order") OrderModel orderModel,
			BindingResult result
			) {
		if(result.hasErrors()) {
			return "/order/index";
		}
		Order order= new Order();
		order.setAddress(orderModel.getAddress());
		order.setCreatedDate(new Date());
		order.setUser(orderModel.getUser());
		repositories.save(order);
		return "redirect:/order/index";
	}
	
	@PostMapping("/delete/{id}")
	public String deleteCategory(
			@PathVariable("id") Order orderModel
			) {
		orderModel.setStatus(true);
		repositories.save(orderModel);
		return "redirect:/order/index";
	}
	
	
	@PostMapping("/update/{id}")
	public String updateCategory(
			@Validated @ModelAttribute("order") OrderModel orderModel,
			@PathVariable("id") Order order,
			BindingResult result
			) {
		if(result.hasErrors()) {
			return "/order/index";
		}
		order.setAddress(orderModel.getAddress());
		order.setCreatedDate(new Date());
		order.setUser(orderModel.getUser());
		repositories.save(order);
		return "redirect:/order/index";
	}
	
	@ModelAttribute("od")
	public List<Order> orders(){
		return repositories.findByStatus(false);
	}
	
	@ModelAttribute("users")
	public List<Account> users(){
		return accountRepositories.findByActivated(0);
	}
	
	
	@GetMapping("/edit/{id}")
	public String edit(
			@ModelAttribute("order") OrderModel  orderModel,
			@PathVariable("id") Order order
			) {
		orderModel.setId(orderModel.getId());
		orderModel.setAddress(order.getAddress());
		orderModel.setCreatedDate(orderModel.getCreatedDate());
		orderModel.setUser(order.getUser());
		return "/order/index";
	}
	
}
