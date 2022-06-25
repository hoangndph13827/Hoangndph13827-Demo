package java5_Lab5.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.weaver.patterns.ThisOrTargetAnnotationPointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java5_Lab5.entities.Order;
import java5_Lab5.entities.OrderDetail;
import java5_Lab5.repositories.OrderDetailRepositories;
import java5_Lab5.repositories.OrderRepositories;
import java5_Lab5.repositories.ProductRepositories;
import java5_Lab5.service.SessionService;

@Controller
@RequestMapping("/hoaDon")
public class HoaDonController {
	@Autowired OrderRepositories orderRepositories;
	@Autowired OrderDetailRepositories orderDetailRepositories;
	@Autowired SessionService sessionService;
	@Autowired HttpServletRequest httpServletRequest;
	
	
	@GetMapping("/index")
	public String index() {
		return "/hoaDon/index";
	}
	
	
	@ModelAttribute("listHD")
	public Map<Order, List<OrderDetail>> listDH() {
		Map<Order, List<OrderDetail>> map= new HashMap<Order, List<OrderDetail>>();
		List<Order> orders= orderRepositories.findByStatus(false);
		for(Order order:orders) {
			map.put(order,orderDetailRepositories.findByOrder(order));
			System.out.println("------"+order.toString());
		}
		return map;
	}
	
	
	
	@GetMapping("/trangthaigiaohang/xacnhan/{id}")
	public String xacnhan(
			@PathVariable("id") Order order
			) {
		order.setGiaoHang(1);
		orderRepositories.save(order);
		return "redirect:/hoaDon/index";
	}
	
	@GetMapping("/trangthaigiaohang/huydon/{id}")
	public String huy(
			Model model,
			@PathVariable("id") Order order
			) {
		order.setStatus(true);
		orderRepositories.save(order);
		
		return "redirect:"+this.httpServletRequest.getServletPath();
	}
	
	@GetMapping("/trangthaigiaohang/danggiao/{id}")
	public String dangGiao(
			@PathVariable("id") Order order
			) {
		order.setGiaoHang(2);
		orderRepositories.save(order);
		return "redirect:/hoaDon/index";
	}
	@GetMapping("/trangthaigiaohang/danhan/{id}")
	public String daNhan(
			@PathVariable("id") Order order
			) {
		order.setGiaoHang(3);
		orderRepositories.save(order);
		return "redirect:"+this.httpServletRequest.getServletPath();
	}
	@GetMapping("/trangthaigiaohang/ycHoanTra/{id}")
	public String ycHoanTra(
			@PathVariable("id") Order order
			) {
		order.setGiaoHang(-3);
		orderRepositories.save(order);
		return "redirect:/hoaDon/user/index";
	}
	
	@GetMapping("/trangthaigiaohang/hoanTra/{id}")
	public String hoanTra(
			@PathVariable("id") Order order
			) {
		order.setGiaoHang(-2);
		orderRepositories.save(order);
		return "redirect:/hoaDon/index";
	}
	
	@GetMapping("/user/index")
	public String userIndex(
			Model model
			) {
		Map<Order, List<OrderDetail>> map= new HashMap<Order, List<OrderDetail>>();
		List<Order> orders= orderRepositories.
				findByUserAndStatusAndGiaoHangLessThan(sessionService.get("user"),false, 3);
		for(Order order:orders) {
			map.put(order,orderDetailRepositories.findByOrder(order));
		}
		model.addAttribute("listHD",map);
		return "/hoaDon/hoaDonUser";
	}
	
	
}
