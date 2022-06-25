package java5_Lab5.beans;

import java.util.Date;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotBlank;

import java5_Lab5.entities.Category;
import lombok.Data;
@Data
public class ProductModel {
	private int id;
	@NotBlank(message = "Không bỏ trống Name")
	private String name;
	@NotBlank(message = "Chưa chọn ảnh")
	private String image;
	@Min(value = 0,message = "Nhập sai giá")
	private double price;
	private Date createdDate;
	@Min(message = "NHập số lượng",value = 1)
	private int available;
	private Category category;
	private boolean status;
}
