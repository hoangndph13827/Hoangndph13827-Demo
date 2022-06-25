package java5_Lab5.beans;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Component
public class AccountModel {
	@NotBlank(message = "Không bỏ trống tên")
	private String fullname;
	@NotBlank(message = "Không bỏ trống Email")
	@Email(message = "Sai định dạng Email ")
	private String email;
	@NotBlank(message = "Không bỏ trống Username")
	private String username;
	@NotBlank(message = "Không bỏ trống Password")
	private String password;
	@NotBlank(message = "Hãy chọn ảnh")
	private String photo;
	private int activated;
	private int admin;
}