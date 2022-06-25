package java5_Lab5.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import java5_Lab5.entities.Category;
import java5_Lab5.entities.Product;

@Component
public interface ProductRepositories extends JpaRepository<Product, Integer>{
	public List<Product> findByStatus(boolean b);
	
	public List<Product> findByCategoryAndStatus(Category id,boolean b);
}
