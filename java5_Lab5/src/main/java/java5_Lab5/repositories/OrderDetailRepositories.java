package java5_Lab5.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import java5_Lab5.entities.Order;
import java5_Lab5.entities.OrderDetail;

@Component
public interface OrderDetailRepositories extends JpaRepository<OrderDetail, Integer>{
	public List<OrderDetail> findByOrder(Order order);
}
