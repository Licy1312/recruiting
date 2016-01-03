/**
 * @author corlymeng.com
 * @date 2015年10月24日
 */
package com.corlymeng.controller.hr;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.corlymeng.model.ApplyDAO;
import com.corlymeng.model.Department;
import com.corlymeng.model.DepartmentDAO;
import com.corlymeng.model.Required;
import com.corlymeng.model.RequiredDAO;
import com.corlymeng.model.User;
import com.corlymeng.model.UserDAO;

@SessionAttributes(value={"loginDepart"})
@Controller
@RequestMapping("/hr")
public class Index {
	
	@Autowired
	private ApplyDAO applyDAO;
	
	@Autowired
	private RequiredDAO requiredDAO;
	
	@Autowired
	private UserDAO userDAO;

	private User user = null;
	
	@ModelAttribute
	public void getDepart(Map<String, Object> map, HttpSession httpSession) {
		user = (User) httpSession.getAttribute("loginDepart");
		map.put("user", user);
	}
	
	
	@RequestMapping({"/","index"})
	public String initIndex(Map<String, Object> map) {
		Required required = null;
		if (requiredDAO.findByProperty("user", user).size()>0) {
			required = (Required) requiredDAO.findByProperty("user", user).get(0);
			List applies = applyDAO.findByUserAndRequired(null, required);
			map.put("appliesSize", applies.size());
			map.put("applies", applies);
		}
		
		List<Required> requireds = requiredDAO.findAll();
		map.put("requiredsSize", requireds.size());
		
		List<ApplyUser> users = userDAO.findAll();
		map.put("usersSize", users.size());
		
		
		return "hr/index";
	}
	
	
	@RequestMapping(value="/setting", method=RequestMethod.GET)
	public String setting() {
		
		return "hr/department";
	}
	
	@RequestMapping(value="/setting", method=RequestMethod.POST)
	public String updateDepart(Department department, Map<String, Object> map) {
		System.out.println(department);
		map.put("message", "更新成功");
		return "hr/department";
	}
}
