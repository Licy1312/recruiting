package com.corlymeng.controller;

import java.util.ArrayList;
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
import com.corlymeng.util.MenuTest;
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
		int id = user.getId();
		if (user != null && user.getPassword().equals(MyUtil.str2MD5(pwd))) {
			request.getSession().setAttribute("nowUser", user);
			return "redirect:/sa/"+id;
		}
		request.setAttribute("errors", "用户名或密码不正确");
		return "samain/salogin";
	}
	
	@RequestMapping(value="/sa/{id}")
	public String menuSources(@PathVariable("id") int id,HttpServletRequest request){
		User user = userDAO.findById(id);
		request.getSession().setAttribute("nowUser", user);
//		JSONObject jo = (JSONObject) JSONSerializer.toJSON(UrlInterface.menuJson(id));
		
//		String ss=(String) jo.get("status");
//		System.out.println(ss);
		List<String> menuName = new ArrayList<String>();
			menuName.add("人员招聘");
			menuName.add("权限管理");
			menuName.add("新闻发布");
			menuName.add("材料管理");
			menuName.add("设备管理");
			menuName.add("聊天室");
		List<String> menuPath = new ArrayList<String>();
			menuPath.add("/recruiting");
			menuPath.add("/rbac");
			menuPath.add("/news");
			menuPath.add("/material");
			menuPath.add("/device");
			menuPath.add("/chatRoom");
	    
				
//		@SuppressWarnings("unchecked")
//		List<String> menuName = (List<String>) jo.get("names");
//		@SuppressWarnings("unchecked")
//		List<String> menuPath = (List<String>) jo.get("routers");
		
		List<MenuTest> list = new ArrayList<MenuTest>();
		for(int i=0; i<menuName.size();i++){
			
			MenuTest menuTest = new MenuTest(menuPath.get(i),menuName.get(i));
			list.add(menuTest);
		
		}
		List<MenuTest> subList = list.subList(0,menuName.size() );
		List<MenuTest> newList = new ArrayList<MenuTest>();  
        	newList.addAll(subList);
//		if("success".equals(ss)){
			request.getSession().setAttribute("menuTest", newList);
			System.out.println(newList.get(0).getMenuName());
			return "samain/sahome";
//		}else {
//			System.out.println("访问接口失败！");
//		}
		
	}
	
	@RequestMapping(value="/sahome", method=RequestMethod.GET)
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
		return JsonUtil.user2json(user).toString();
		
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
		User user = (User) request.getSession().getAttribute("nowUser");
		int id = user.getId();
		
		System.out.println(id+"...人员招聘................");
		return "redirect:/toLogin";
	}
	/**
	 * 
	 * 跳转到材料展示模块
	 * @param sessionStatus
	 * @return
	 */
	@RequestMapping("/material")
	public String loginMaterial(HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("nowUser");
		int id = user.getId();
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
		User user = (User) request.getSession().getAttribute("nowUser");
		int id = user.getId();
		return "redirect:http://192.168.31.140:8080/SA/charts/device_index.shtml?id="+id;
	}
	/**
	 * 
	 * 跳转到新闻模块
	 * @param sessionStatus
	 * @return
	 */
	@RequestMapping("/news")
	public String loginNews(HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("nowUser");
		int id = user.getId();
		System.out.println(id+"...................");
		return "redirect:http://192.168.1.107:8080/news/user/"+id;
	}
	/**
	 * 
	 * 跳转到聊天室模块
	 * @param sessionStatus
	 * @return
	 */
	@RequestMapping("/chatRoom")
	public String loginChatRoom(HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("nowUser");
		int id = user.getId();
		return "redirect:samain/sahome";
	}
	/**
	 * 
	 * 跳转到权限管理模块
	 * @param sessionStatus
	 * @return
	 */
	@RequestMapping("/rbac")
	public String loginPermission(Map<String, Object> map,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("nowUser");
		int id = user.getId();
		System.out.println(id+".......lichangya............");
		String uri = "/rbac/*";
		JSONObject jo = (JSONObject) JSONSerializer.toJSON(UrlInterface.loadJson(id,uri));
		
		String ss=(String) jo.get("status");
		if("pass".equals(ss)){
			
			return "redirect:http://192.168.31.135/rbac/backend/web/index.php?r=rbac";
			
		}else {
			return "samain/error";
		}
		
	}
}
