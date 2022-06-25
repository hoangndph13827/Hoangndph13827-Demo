package java5_Lab5.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java5_Lab5.beans.CategoryModel;
import java5_Lab5.beans.ProductModel;
import java5_Lab5.entities.Category;
import java5_Lab5.entities.Product;
import java5_Lab5.repositories.CategoryRepositories;
import java5_Lab5.repositories.ProductRepositories;

@RequestMapping("/product")
@Controller
public class ProductController {
@Autowired ProductRepositories repositories;
@Autowired CategoryRepositories categoryRepositories;
	@GetMapping("/index")
	public String product(
			@ModelAttribute("product") ProductModel productModel
			) {
		System.out.println("-----------tao---------");
		return "product/index";
	}
	
	@PostMapping("/add")
	public String addCategory(
			@Validated @ModelAttribute("product") ProductModel productModel,
			BindingResult result
			) {
		if(result.hasErrors()) {
			return "product/index";
		}
		Product product= new Product();
		product.setName(productModel.getName());
		product.setAvailable(0);
		product.setCategory(productModel.getCategory());
		product.setCreatedDate(new Date());
		product.setImage(productModel.getImage());
		product.setPrice(productModel.getPrice());
	 	repositories.save(product);
		return "redirect:/product/index";
	}
	
	@PostMapping("/delete/{id}")
	public String deleteCategory(
			 @PathVariable("id") Product product
			) {
		product.setStatus(true);
		repositories.save(product);
		return "redirect:/product/index";
	}
	
	@GetMapping("/chiTiet/{id}")
	public String chiTiet(
			Model model,
			@PathVariable("id") Product product
			) {
		model.addAttribute("product",product);
		model.addAttribute("sptt", repositories.findByCategoryAndStatus(product.getCategory(), false));
		return "product/chiTiet";
	}
	
	@PostMapping("/update/{id}")
	public String updateCategory(
			@Validated() @ModelAttribute("product") ProductModel productModel,
			@PathVariable("id") Product product,
			BindingResult result
			) {
		if(result.hasErrors()) {
			return "product/index";
		}
		product.setName(productModel.getName());
		product.setAvailable(0);
		product.setCategory(productModel.getCategory());
		product.setCreatedDate(new Date());
		product.setImage(productModel.getImage().isEmpty()?product.getImage():productModel.getImage());
		product.setPrice(productModel.getPrice());
	 	repositories.save(product);
		return "redirect:/product/index";
	}
	
	@ModelAttribute("prds")
	public List<Product> products(){
		return repositories.findByStatus(false);
	}
	
	@ModelAttribute("ctgs")
	public List<Category> categorys(){
		return categoryRepositories.findByStatus(false);
	}
	
	@GetMapping("/edit/{id}")
	public String edit(
			Model model,
			 @ModelAttribute("product") ProductModel  productModel,
			@PathVariable("id") Product product
			) {
		productModel.setId(product.getId());
		productModel.setName(product.getName());
		productModel.setCreatedDate(product.getCreatedDate());
		productModel.setImage(product.getImage());
		productModel.setPrice(product.getPrice());
		productModel.setCategory(product.getCategory());
		return "/product/index";
	}
	
}
