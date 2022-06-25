package java5_Lab5.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java5_Lab5.beans.OrderDetailModel;
import java5_Lab5.entities.Order;
import java5_Lab5.entities.OrderDetail;
import java5_Lab5.entities.Product;
import java5_Lab5.repositories.OrderDetailRepositories;
import java5_Lab5.repositories.OrderRepositories;
import java5_Lab5.repositories.ProductRepositories;


@RequestMapping("/orderDetail")
@Controller
public class OrderDetailController {

	@Autowired OrderDetailRepositories repositories;
	@Autowired OrderRepositories orderRepositories;
	@Autowired ProductRepositories productRepositories;
	
	@GetMapping("/index")
	public String category(
			@ModelAttribute("orderDetail") OrderDetailModel orderDetailModel
			) {
		return "orderDetail/index";
	}
	
	@PostMapping("/add")
	public String addCategory(
			@ModelAttribute("orderDetail") OrderDetailModel orderModel 
			) {
		OrderDetail orderDetail = new OrderDetail();
		orderDetail.setOrder(orderModel.getOrder());
		orderDetail.setPrice(orderModel.getPrice());
		orderDetail.setProduct(orderModel.getProduct());
		orderDetail.setQuatity(orderModel.getQuantity());
		repositories.save(orderDetail);
		return "redirect:/orderDetail/index";
	}
	
	@PostMapping("/delete/{id}")
	public String deleteCategory(
			@PathVariable("id") OrderDetail orderDetail
			) {
		repositories.delete(orderDetail);
		return "redirect:/orderDetail/index";
	}
	
	
	@PostMapping("/update/{id}")
	public String updateCategory(
			@ModelAttribute("orderDetail") OrderDetailModel orderDetailModel,
			@PathVariable("id") OrderDetail orderDetail
			) {
		orderDetail.setOrder(orderDetailModel.getOrder());
		orderDetail.setPrice(orderDetailModel.getPrice());
		orderDetail.setProduct(orderDetailModel.getProduct());
		orderDetail.setQuatity(orderDetailModel.getQuantity());
		repositories.save(orderDetail);
		return "redirect:/orderDetail/index";
	}
	
	
	
	@ModelAttribute("od")
	public List<Order> oderDetails(){
		return orderRepositories.findByStatus(false);
	}
	
	@ModelAttribute("prd")
	public List<Product> product(){
		return productRepositories.findByStatus(false);
	}
	
	
	@GetMapping("/edit/{id}")
	public String edit(
			@ModelAttribute("orderDetail") OrderDetailModel  orderDetailModel,
			@PathVariable("id") OrderDetail orderDetail
			) {
		orderDetailModel.setId(orderDetail.getId());
		orderDetailModel.setOrder(orderDetail.getOrder());
		orderDetailModel.setPrice(orderDetail.getPrice());
		orderDetailModel.setProduct(orderDetail.getProduct());
		orderDetailModel.setQuantity(orderDetail.getQuatity());
		return "/orderDetail/index";
	}
	
}
