package java5_Lab5.beans;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.stereotype.Component;

import java5_Lab5.entities.Account;
import lombok.Data;

@Data
@Component
public class OrderModel {
	private int id;
	private Account user;
	private Date createdDate;
	@NotBlank(message = "Không bỏ trống địa chỉ")
	private String address;
	private boolean status;
}
