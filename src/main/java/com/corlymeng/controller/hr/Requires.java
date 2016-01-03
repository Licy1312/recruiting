/**
 * @author corlymeng.com
 * @date 2015年10月25日
 */
package com.corlymeng.controller.hr;

import java.util.Collection;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.corlymeng.model.DepartmentDAO;
import com.corlymeng.model.Major;
import com.corlymeng.model.MajorDAO;
import com.corlymeng.model.Required;
import com.corlymeng.model.RequiredDAO;
import com.corlymeng.model.User;
import com.corlymeng.util.MyUtil;

/**
 * 招聘需求管理
 *
 */
@RequestMapping("/hr/requires")
@Controller
public class Requires {
	
	@Autowired
	private RequiredDAO requiredDAO;
	@Autowired
	private DepartmentDAO departmentDAO;
	@Autowired
	private MajorDAO majorDAO;
	
	@RequestMapping("/{type}")
	public String showRequires(@PathVariable(value="type") String type, Map<String, Object> map, HttpSession httpSession) {
		if (type.equals("add")) {
			Required required = new Required();
			required.setSalary("面议");
			required.setAddress("上海");
			map.put("required", required);
			map.put("majors", majorDAO.findByParentid(Integer.valueOf(0)));
			map.put("departments", departmentDAO.findAll());
			map.put("subtitle", "添加招聘需求");
			return "/hr/addRequires";
		}
		User user = (User) httpSession.getAttribute("loginDepart");
		map.put("requires", requiredDAO.findByProperty("user", user));
		return "/hr/requires";
	}
	
	// 添加招聘需求
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String addRequires(@Valid Required required, BindingResult result, Map<String, Object> map) {
		System.out.println("id: "+required.getId());
		if (result.getErrorCount() > 0) {
			map.put("subtitle", "添加招聘需求");
			return "/hr/addRequires";
		}
		required.setStartdate(new Date());
		System.out.println(required);
		requiredDAO.attachDirty(required);
		return "redirect:/hr/requires/show";
	}
	
	@RequestMapping("/detail/{id}")
	public String showDetail(@PathVariable("id") Integer id, Map<String, Object> map) {
		System.out.println(id);
		Required required = requiredDAO.findById(id);
		map.put("required", required);
		map.put("departments", departmentDAO.findAll());
		map.put("subtitle", "修改招聘需求");
		return "hr/addRequires";
	}
	
	@ResponseBody
	@RequestMapping("getMajor")
	public Collection<Major> name(@RequestParam("id") Integer id) {
		return majorDAO.findByParentid(id);
	}
}
