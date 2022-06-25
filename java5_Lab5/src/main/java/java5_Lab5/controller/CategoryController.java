package java5_Lab5.controller;

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
import java5_Lab5.entities.Category;
import java5_Lab5.repositories.CategoryRepositories;
@RequestMapping("/category")
@Controller
public class CategoryController {
	
	@Autowired CategoryRepositories repositories;
	
	@GetMapping("/index")
	public String category(
			@ModelAttribute("category") CategoryModel categoryModel
			) {
		return "category/index";
	}
	
	@PostMapping("/add")
	public String addCategory(
			@Validated @ModelAttribute("category") CategoryModel categoryModel,
			BindingResult result
			) {
		if(result.hasErrors()) {
			return "/category/index";
		}
		Category category= new Category();
		category.setName(categoryModel.getName());
		repositories.save(category);
		return "redirect:/category/index";
	}
	
	@PostMapping("/delete/{id}")
	public String deleteCategory(
			@PathVariable("id") Category category
			) {
		category.setStatus(true);
		repositories.save(category);
		return "redirect:/category/index";
	}
	
	
	@PostMapping("/update/{id}")
	public String updateCategory(
			@Validated @ModelAttribute("category") CategoryModel categoryModel,
			@PathVariable("id") Category category,
			BindingResult result
			) {
		if(result.hasErrors()) {
			return "/category/index";
		}
		category.setName(categoryModel.getName());
		repositories.save(category);
		return "redirect:/category/index";
	}
	
	@ModelAttribute("ctgs")
	public List<Category> categorys(){
		return repositories.findByStatus(false);
	}
	
	@GetMapping("/edit/{id}")
	public String edit(
			Model model,
			@ModelAttribute("category") CategoryModel  categoryModel,
			@PathVariable("id") Category cate
			) {
		categoryModel.setId(cate.getId());
		categoryModel.setName(cate.getName());
		return "/category/index";
	}
	
	
	
}
