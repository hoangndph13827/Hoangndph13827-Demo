package java5_Lab5.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;

@Entity
@Data
@Table(name="orders")
public class Order {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@ManyToOne
	@JoinColumn(name="Username")
	private Account user;
	
	@Column(name="createdate")
	@Temporal(TemporalType.DATE)
	private Date createdDate;
	
	@Column(name="address")
	private String address;
	
	@Column(name = "giaohang")
	private int giaoHang;//-3 yeu cau hoàn chả //-2 đã xác nhận hoàn chả //-1 huy //0 chua xac nhan //1 AD'xac nhan,KH'chuan bị hàng //2 dang giao // 3 da nhan
	
	
	@Column(name = "status")
	private boolean status;
}