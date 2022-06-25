package java5_Lab5.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import java5_Lab5.entities.Account;
import java5_Lab5.entities.Order;

public interface OrderRepositories extends JpaRepository<Order, Integer> {
	public List<Order> findByStatus(boolean b);
	public List<Order> findByUserAndStatusAndGiaoHangLessThan(Account account,boolean b,int giaoHang);
	public List<Order> findByStatusAndGiaoHang(boolean b,int ttgiaoHang);
}
