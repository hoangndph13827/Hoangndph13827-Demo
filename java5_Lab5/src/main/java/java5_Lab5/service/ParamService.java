package java5_Lab5.service;

import java.io.File;
import java.nio.file.Files;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ParamService {
	@Autowired
	HttpServletRequest request;
	
	public String getString(String name,String defaultValue) {
		String value= request.getParameter(name);
		if (value.isEmpty()) {
			return defaultValue;
		}
		return value;
	}
	public int getInt(String name,int defaultValue) {
		try {
			System.out.println(request.getParameter(name)+"----------------------------");
			int value= Integer.valueOf(request.getParameter(name));
			
			return value;
		} catch (Exception e) {
			e.printStackTrace();
			return defaultValue;
		}
		
	}
	public double getDouble(String name,double defaultValue) {
		try {
			double value= Double.valueOf(request.getParameter(name)+"");
			
			return value;
		} catch (Exception e) {
			e.printStackTrace();
			return defaultValue;
		}
		
	}
	public boolean getBoolean(String name,boolean defaultValue) {
		try {
			int a= Integer.valueOf(request.getParameter(name)+"");
			boolean value= (a==0)?true:false;
			
			return value;
		} catch (Exception e) {
			e.printStackTrace();
			return defaultValue;
		}
		
	}
	
	public Date getDate(String name,Date defaultValue) {
		try {
			Date value= new Date(request.getParameter(name)+"");
			return value;
		} catch (Exception e) {
			e.printStackTrace();
			return defaultValue;
		}
		
	}
	
	public File save(MultipartFile file, String path) {
		File file2= (File) file;
	
		return (File) file2;
	}
	
	
}
