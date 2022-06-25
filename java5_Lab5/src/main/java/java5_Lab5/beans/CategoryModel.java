package java5_Lab5.beans;

import org.hibernate.validator.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CategoryModel {
	private int id;
	@NotBlank(message = "Không bỏ trống tên thể loại")
	private String name;
	private boolean status;
}
