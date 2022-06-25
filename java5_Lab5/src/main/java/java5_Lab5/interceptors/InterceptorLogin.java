package java5_Lab5.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import java5_Lab5.beans.AccountModel;
import java5_Lab5.entities.Account;
import java5_Lab5.service.SessionService;
@Component
public class InterceptorLogin implements HandlerInterceptor{
	@Autowired SessionService sessionService;
	
	
	@Override
	public boolean preHandle (
			HttpServletRequest req,
			HttpServletResponse res,
			Object handle
			) throws Exception {
		Account account= sessionService.get("user");
		if(account==null) {
			sessionService.set("error", "Bạn chưa đăng nhập!");
			res.sendRedirect("/java5_Lab5/trangChu/index");
			return false;
		}
		
		return true;
		
	}
}
