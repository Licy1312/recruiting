/**
 * @author corlymeng.com
 * @date 2015年10月24日
 */
package com.corlymeng.controller;

import java.util.Date;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.corlymeng.model.Department;
import com.corlymeng.model.DepartmentDAO;
import com.corlymeng.model.User;
import com.corlymeng.model.UserDAO;
import com.corlymeng.util.MyUtil;

/**
 * 用户注册、登陆控制器
 * @author corlymeng.com
 *
 */

@SessionAttributes({"loginUser", "loginDepart"})
@Controller
public class LoginAndRegister {
	
	@Autowired
	private DepartmentDAO departDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(value="register", method=RequestMethod.GET)
	public String registerPage(){
		return "register";
	}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String register(String email, String pwd, String pwd1, Integer type, Map<String, Object> map) {
		if (email == null || email.isEmpty()) {
			map.put("errors", "邮箱不能为空");
			return "register";
		}
		if (!pwd.equals(pwd1)) {
			map.put("errors", "两次输入密码不一致");
			return "register";
		}
		if (type == 2) {
			Department depart = new Department();
			depart.setEmail(email);
			depart.setPassword(MyUtil.str2MD5(pwd));
			departDAO.save(depart);
		}else{
			User user = new User();
			user.setUsername(email);
			
			user.setPassword(MyUtil.str2MD5(pwd));
			user.setRegtime(new Date());
			userDAO.save(user);
			
		}
		map.put("messages", "注册成功！请登陆");
		User user = userDAO.findByEmail(email);
		getInteface(user);
		return "login";
	}
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String loginPage(){
		return "login";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(String email, String pwd, Map<String, Object> map) {
		
		User user = userDAO.findByEmail(email);
		if (user != null && user.getPassword().equals(MyUtil.str2MD5(pwd))) {
			if (user.getUsertype().equals(1)) {
				map.put("loginUser", user);
				return "redirect:index";
			}else if (user.getUsertype().equals(2)) {
				map.put("loginDepart", user);
				return "redirect:hr/";
			}
			
		}
		map.put("errors", "用户名或密码不正确");
		System.out.println("login");
		return "login";
	}
	
	@RequestMapping("logout")
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:index";
	}
	
	public static void getInteface(User user){
		int id = user.getId();
		String username = user.getUsername();
	}
}
