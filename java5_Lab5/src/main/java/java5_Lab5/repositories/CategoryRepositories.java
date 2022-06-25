package java5_Lab5.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import java5_Lab5.entities.Category;

@Component
public interface CategoryRepositories extends JpaRepository<Category, Integer>{
	public List<Category> findByStatus(boolean b);
	
}
