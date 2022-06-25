package java5_Lab5.interceptors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfiguration implements WebMvcConfigurer {
	@Autowired
	InterceptorLogin intercepter;
	@Autowired
	InterceptorAdmin interceptorAdmin;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(intercepter)
		.addPathPatterns("/**").excludePathPatterns("/trangChu/**")
		.excludePathPatterns("/product/chiTiet/**");
		
		registry.addInterceptor(interceptorAdmin)
		.addPathPatterns("/**").excludePathPatterns("/trangChu/**")
		.excludePathPatterns("/gioHang/**")
		.excludePathPatterns("/hoaDon/user/**")
		.excludePathPatterns("/hoaDon/trangthaigiaohang/**")
		.excludePathPatterns("/product/chiTiet/**");
	}
	
}
