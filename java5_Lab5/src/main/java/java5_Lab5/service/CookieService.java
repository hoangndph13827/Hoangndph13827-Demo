package java5_Lab5.service;

import java.util.Iterator;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CookieService {
@Autowired
HttpServletRequest request;
@Autowired
HttpServletResponse response;
/**
* Đọc cookie từ request
* @param name tên cookie cần đọc
* @return đối tượng cookie đọc được hoặc null nếu không tồn tại
*/
public Cookie get(String name) {
	Cookie[] cookie = request.getCookies();
	for(Cookie cook:cookie) {
		if (cook.getName().equals(name)) {
			return cook;
		}
	}
	return null;
	}
/**
* Đọc giá trị của cookie từ request
* @param name tên cookie cần đọc
* @return chuỗi giá trị đọc được hoặc rỗng nếu không tồn tại
*/
	public String getValue(String name) {
		Cookie cookie=this.get(name);
		if(cookie == null) {
			return "";
		}
		return cookie.getValue();
	}
/**
* Tạo và gửi cookie về client
* @param name tên cookie
* @param value giá trị cookie
* @param hours thời hạn (giờ)
* @return đối tượng cookie đã tạo
*/
public Cookie add(String name, String value, int hours) {
	Cookie cookie = new Cookie(name, value);
	cookie.setMaxAge(hours*60*60);
	cookie.setPath("/");
	response.addCookie(cookie);
	return cookie;
}
/**
* Xóa cookie khỏi client
* @param name tên cookie cần xóa
 * @throws IllegalAccessException 
*/
public void remove(String name) throws IllegalAccessException {
	Cookie cookie= this.get(name);
	if(cookie== null) throw new IllegalAccessException("Không tồn tại CooKie name :"+name);
	else {
		cookie.setMaxAge(0);
	}
}
}