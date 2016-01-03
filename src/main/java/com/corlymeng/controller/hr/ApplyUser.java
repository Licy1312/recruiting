/**
 * @author corlymeng.com
 * @date 2015年10月25日
 */
package com.corlymeng.controller.hr;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;










import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.corlymeng.model.Apply;
import com.corlymeng.model.ApplyDAO;
import com.corlymeng.model.Required;
import com.corlymeng.model.RequiredDAO;
import com.corlymeng.model.User;
import com.corlymeng.model.UserDAO;
import com.corlymeng.util.MyUtil;

@RequestMapping("/hr/users")
@Controller
public class ApplyUser {

	@Autowired
	UserDAO userDAO;
	@Autowired
	ApplyDAO applyDAO;
	@Autowired
	RequiredDAO requiredDAO;
	
	private User user;
	
	@RequestMapping({"/", "/index"})
	public String showUser(Map<String, Object> map, HttpSession httpSession) {
		user = (User) httpSession.getAttribute("loginDepart");
		if (requiredDAO.findByProperty("user", user).size()<1) {
			return "hr/user";
		}
		Required required = (Required) requiredDAO.findByProperty("user", user).get(0);
		java.util.List<Apply> applys = applyDAO.findByProperty("required", required);
		List<User> users = new ArrayList<User>();
		for(Apply a : applys){
			if (a.getIsConfirm()==1) {
				users.add(a.getUser());
			}
		}
		map.put("users", users);
		return "hr/user";
	}
	
	@ModelAttribute
	public void getApply(@RequestParam(value="id", required=false) Integer id,
			Map<String, Object> map) {
		if (id != null) {
			System.out.println("model Attribute apply");
			map.put("apply", applyDAO.findById(id));
		}
	}
	
	
	@RequestMapping("/check")
	public String checkUser(Map<String, Object> map) {
		
		return "hr/check";
	}

	@RequestMapping(value="/confirm", method=RequestMethod.POST)
	public String confirm(Apply apply) {
		System.out.println(apply);
		applyDAO.attachDirty(apply);
		return "redirect:../";
	}
	
	@ResponseBody
	@RequestMapping(value="/download/{id}")
	public ResponseEntity<byte[]> dwonloadResume(@PathVariable("id") Integer id) throws IOException {
		User user = userDAO.findById(id);
		String path = System.getProperty("rootPath") +user.getFilepath();
		return MyUtil.downloadFile(path, user.getFilename());
	}
	
}
