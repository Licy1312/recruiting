package com.corlymeng.controller;



import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;







import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

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
import com.corlymeng.util.UrlInterface;

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
	 * （接口）根据传过来的username参数 返回该userName的信息
	 * @return
	 */
	@RequestMapping(value="user/{username}", method=RequestMethod.GET)
	public @ResponseBody String getUser(@PathVariable String username){
		User user = userDAO.findByEmail(username);
		JsonUtil jsonUtil = new JsonUtil();
		return jsonUtil.user2json(user).toString();
		
	}
	/**
	 * （接口）将所有用户的信息暴露出去供其他模块访问
	 * @return
	 */
	@RequestMapping(value="user/allUser", method=RequestMethod.GET)
	@SuppressWarnings("unchecked")
	public @ResponseBody List<User> getAllUser(){
		
		List<User> list = userDAO.findAll();
		for(User u: list ){
			u.setRequireds(null);
			u.setApplies(null);
			u.setCollections(null);	
		}
		System.out.println(list);
		return list;	
	}
	
	
	@RequestMapping("salogout")
	public String logout(SessionStatus sessionStatus){
		sessionStatus.setComplete();
		return "samain/salogin";
	}
	/**
	 * 
	 * 跳转到人员招聘模块
	 * @param sessionStatus
	 * @return
	 */
	@RequestMapping("/recruiting")
	public String loginRecruiting(HttpServletRequest request){
		return "redirect:/";
	}
	/**
	 * 
	 * 跳转到材料展示模块
	 * @param sessionStatus
	 * @return
	 */
	@RequestMapping("/material")
	public String loginMaterial(HttpServletRequest request){
		return "redirect:samain/sahome";
	}
	/**
	 * 
	 * 跳转到设备统计模块
	 * @param sessionStatus
	 * @return
	 */
	@RequestMapping("/device")
	public String loginDevice(HttpServletRequest request){
		return "redirect:samain/sahome";
	}
	/**
	 * 
	 * 跳转到新闻模块
	 * @param sessionStatus
	 * @return
	 */
	@RequestMapping("/news")
	public String loginNews(HttpServletRequest request){
		return "redirect:samain/sahome";
	}
	/**
	 * 
	 * 跳转到聊天室模块
	 * @param sessionStatus
	 * @return
	 */
	@RequestMapping("/chatRoom")
	public String loginChatRoom(HttpServletRequest request){
		return "redirect:samain/sahome";
	}
	/**
	 * 
	 * 跳转到权限管理模块
	 * @param sessionStatus
	 * @return
	 */
	@RequestMapping("/permission")
	public String loginPermission(Map<String, Object> map,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("loginUser");
		int id = user.getId();
		String uri = "/rbac/*";
		UrlInterface urlInterface = new UrlInterface();
		JSONObject jo = (JSONObject) JSONSerializer.toJSON(urlInterface.loadJson(id,uri));
		
		String ss=(String) jo.get("status");
		if("pass".equals(ss)){
			
			return "redirect:http://192.168.31.135/rbac/backend/web/index.php?r=rbac";
			
		}else {
			return "samain/error";
		}
		
	}
}
