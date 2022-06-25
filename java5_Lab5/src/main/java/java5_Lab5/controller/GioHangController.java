package java5_Lab5.controller;

import java.util.Date;
import java.util.Iterator;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import java5_Lab5.beans.AccountModel;
import java5_Lab5.beans.OrderModel;
import java5_Lab5.entities.Order;
import java5_Lab5.entities.OrderDetail;
import java5_Lab5.entities.Product;
import java5_Lab5.repositories.OrderDetailRepositories;
import java5_Lab5.repositories.OrderRepositories;
import java5_Lab5.service.ParamService;
import java5_Lab5.service.SessionService;

@RequestMapping("/gioHang")
@Controller
public class GioHangController {
	@Autowired SessionService sessionService;
	@Autowired ParamService paramService;
	@Autowired OrderRepositories orderRepositories;
	@Autowired OrderDetailRepositories orderDetailRepositories;
	@GetMapping("/index")
	public String index(
			@ModelAttribute("account") AccountModel accountModel,
			@ModelAttribute("order") OrderModel orderModel
			) {
		return "/gioHang/index";
	}
	
	@PostMapping("/update/{id}")
	public String update(
			@PathVariable("id") int id,
			@ModelAttribute("prd") Product product2
			) {
		List<Product> list= sessionService.get("listPrd");
		for(Product product:list) {
			if(product.getId()==id) {
				product.setAvailable(product2.getAvailable());
				break;
			}
		}
		
		return "redirect:/gioHang/index";
	}
	@GetMapping("/delete/{id}")
	public String delete(
			@PathVariable("id") int id
			) {
		List<Product> list= sessionService.get("listPrd");
		int i=0;
		for(Product product:list) {
			if(product.getId()==id) {
				list.remove(i);
				sessionService.set("msg", "Xóa thành công");
				break;
			}
			i++;
		}
	
		return "redirect:/gioHang/index";
	}
	
	@PostMapping("/taoDon")
	public String taoDon(
			@ModelAttribute("order") OrderModel orderModel
			) {
		Order order = new Order();
		order.setAddress(orderModel.getAddress());
		order.setCreatedDate(new Date());
		order.setUser(sessionService.get("user"));
		orderRepositories.save(order);
		List<Product> lst= sessionService.get("listPrd");
		OrderDetail orderDetail;
		for(Product product:lst) {
			orderDetail= new OrderDetail();
			orderDetail.setPrice(product.getPrice());
			orderDetail.setOrder(order);
			orderDetail.setProduct(product);
			orderDetail.setQuatity(product.getAvailable());
			orderDetailRepositories.save(orderDetail);
		}
		sessionService.set("msg", "Tạo đơn thành công");
		return "redirect:/gioHang/index";
	}
	
	
	@GetMapping("/themVaoGio/{id}")
	public String themVaoGio(
			@PathVariable("id") Product product
			) {
		List<Product> lstList= sessionService.get("listPrd");
		for(Product product2:lstList) {
			if(product2.getId()==product.getId()) {
				product2.setAvailable(product2.getAvailable()+1);
				sessionService.set("msg", "Thêm thành công");
				return "redirect:/trangChu/index";
			}
		}
		product.setAvailable(1);
		lstList.add(product);
		for(Product product2:lstList) System.out.println(product2.toString());
		sessionService.set("msg", "Thêm thành công");
		return "redirect:/trangChu/index";
	}
	
	@ModelAttribute("tongTien")
	public double tongTien() {
		int tong=0;
		List<Product> list= sessionService.get("listPrd");
		for(Product product: list) {
			tong+=product.getPrice()*product.getAvailable();
		}
		return tong;
	}
	
}
