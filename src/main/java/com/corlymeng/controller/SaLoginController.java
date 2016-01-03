package com.corlymeng.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.corlymeng.model.User;
import com.corlymeng.model.UserDAO;
import com.corlymeng.util.JsonUtil;
import com.corlymeng.util.MyUtil;

@Controller
public class SaLoginController {
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(value="salogin", method=RequestMethod.GET)
	public String loginPage(){
		return "samain/salogin";
	}
	
	@RequestMapping(value="salogin", method=RequestMethod.POST)
	public String login(String email, String pwd,HttpServletRequest request) {
		User user = userDAO.findByEmail(email);
		if (user != null && user.getPassword().equals(MyUtil.str2MD5(pwd))) {
			request.getSession().setAttribute("loginUser", user);	
			return "samain/sahome";
		}
		request.setAttribute("errors", "用户名或密码不正确");
		return "samain/salogin";
	}
	@RequestMapping(value="sahome", method=RequestMethod.GET)
	public String sahome(){
		return "samain/sahome";
	}
	/**
	 * 根据传过来的username参数 返回该userName的信息
	 * @return
	 */
	@RequestMapping(value="user/{username}", method=RequestMethod.GET)
	public @ResponseBody String getUser(@PathVariable String username){
		System.out.println(username+"..............");
		User user = userDAO.findByEmail(username);
		JsonUtil jsonUtil = new JsonUtil();
		return jsonUtil.user2json(user).toString();
		
	}
	@RequestMapping(value="user/allUser", method=RequestMethod.GET)
	@SuppressWarnings("unchecked")
	public @ResponseBody String getAllUser(){
		List<User> list = userDAO.findAllUser();
		JsonUtil jsonUtil = new JsonUtil();
		return jsonUtil.userList2json(list).toString();
		
	}
	
	@RequestMapping("salogout")
	public String logout(SessionStatus sessionStatus){
		sessionStatus.setComplete();
		return "redirect:samain/salogin";
	}
}
