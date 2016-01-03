/**
 * @author corlymeng.com
 * @date 2015年10月20日
 */
package com.corlymeng.controller;

import java.util.List;
import java.util.Map;




import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.corlymeng.ajax.AjaxMessage;
import com.corlymeng.model.Apply;
import com.corlymeng.model.ApplyDAO;
import com.corlymeng.model.CollectionDAO;
import com.corlymeng.model.DepartmentDAO;
import com.corlymeng.model.Major;
import com.corlymeng.model.MajorDAO;
import com.corlymeng.model.Required;
import com.corlymeng.model.RequiredDAO;
import com.corlymeng.model.User;
import com.corlymeng.model.UserDAO;
import com.corlymeng.util.MyUtil;
import com.corlymeng.util.UrlInterface;

@Controller
public class IndexController {
	
	public IndexController() {
		System.out.println("construct index controller");
	}
	
	@Autowired
	private MajorDAO majorDAO;
	
	@Autowired
	private RequiredDAO requiredDAO;
	
	@Autowired
	private ApplyDAO applyDAO;
	@Autowired
	private UserDAO userDao;
	@Autowired
	private DepartmentDAO departmentDAO;
	@Autowired
	private CollectionDAO collectionDAO;
	
	@RequestMapping("/")
	public String showHome(String username){
		String url="http://192.168.31.135/rbac/backend/web/index.php?r=rbac/access-interface/authentication&id=7&url=/recruiting";
		UrlInterface urlInterface = new UrlInterface();
		System.out.println(urlInterface.loadJson(url)+"...............");

		return "home";
	}
	
	@RequestMapping("/index")
	public String showIndex(@RequestParam(value="major", required=false) String majorId,
				@RequestParam(value="department", required=false) String departmentId,
				Map<String, Object> map) {
		map.put("title", "大牛网");
		System.out.println("major: " + majorId + "-- department: " +departmentId);
		map.put("majorBase", "index?department="+departmentId);
		map.put("departmentBase", "index?major="+majorId);
		
		List<Major> majors = majorDAO.findByParentid(Integer.valueOf(0));
		
		//获取所有的学科分类
		map.put("majors", majors);
		
		//获取单位列表
		map.put("department", departmentDAO.findAll());
		
		System.out.println("show Index");
		
		//获取职位列表
		if (majorId == null || majorId.equals("null")) {
			majorId = "-1";
		}
		if (departmentId == null || departmentId.equals("null")) {
			departmentId = "-1";
		}
		map.put("majorid", majorId);
		map.put("departmentid", departmentId);
		
		map.put("requires", requiredDAO.findAll());
		map.put("subtitle", "热门职位");
		return "index";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/isApply", method=RequestMethod.POST)
	public AjaxMessage isApply(@RequestParam("id") Integer id, HttpSession httpSession) {
		AjaxMessage result = new AjaxMessage();
		if (!MyUtil.isLogin(httpSession, "loginUser") || id <0) {
			result.setMessage("没有登陆！");
			result.setErrors(1);
		}else {
			//查询用户是发已经提交过
			User user = (User) httpSession.getAttribute("loginUser");
			Required required = new Required();
			required.setId(id);
			List<Apply> applies = applyDAO.findByUserAndRequired(user, required);
			if (applies.size() > 0) {
				result.setErrors(2);
				result.setMessage("用户已经申请");
			}
		}
		return result;
	}
	
	@RequestMapping("/major/{id}")
	public String majorJobs(@PathVariable("id") Integer id, Map<String, Object> map) {
		System.out.println(id);
		Major majorTmp = majorDAO.findById(id);
		if (majorTmp == null) {
			return "redirect:index";
		}
		map.put("title", "大牛网-"+majorTmp.getName());
		
		Major parentMajor=null;
		
		List<Major> majors = majorDAO.findByParentid(Integer.valueOf(0));
		for (Major major : majors) {
			if (major.getId() == majorTmp.getParentid()) {
				parentMajor = major;
			}
			major.setChildren(majorDAO.findByParentid(major.getId()));
		}
		map.put("majors", majors);
		
		//获取职位列表
		map.put("requires", requiredDAO.findAll());
		
		map.put("subtitle", parentMajor.getName()+" > "+majorTmp.getName());
		return "index";
	}
	
	@RequestMapping("/require/{id}")
	public String requireDetail(@PathVariable("id") Integer id, Map<String, Object> map, HttpSession session) {
		User user = (User)session.getAttribute("loginUser");
		if (user==null) {
			map.put("isApplied", "true");
		}
		try {
			if (collectionDAO.isCollected(id, user.getId()) ) {
				map.put("isCollected", "true");
			}else {
				map.put("isCollected", "false");
			}
			if (applyDAO.isApplied(user.getId())) {
				map.put("isApplied", "true");
			}else {
				map.put("isApplied", "false");
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("require/id not find user");
//			return "redirect:login";
		}
		
		Required required = requiredDAO.findById(id);
		String intro = StringEscapeUtils.escapeHtml(required.getIntro()).replace("\r\n", "<br/><br/>");
		required.setIntro(intro);
		map.put("require", required);
		
		return "require";
	}

}
