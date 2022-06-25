package java5_Lab5.beans;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.stereotype.Component;

import java5_Lab5.entities.Order;
import java5_Lab5.entities.Product;
import lombok.Data;
@Data
@Component
public class OrderDetailModel {
	private int id;
	
	private Order order;
	private Product product;
	private double price;
	private int quantity;
}
