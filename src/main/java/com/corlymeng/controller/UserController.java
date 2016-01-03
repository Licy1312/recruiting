/**
 * @author corlymeng.com
 * @date 2015年10月26日
 */
package com.corlymeng.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.corlymeng.ajax.AjaxMessage;
import com.corlymeng.model.Apply;
import com.corlymeng.model.ApplyDAO;
import com.corlymeng.model.Article;
import com.corlymeng.model.ArticleDAO;
import com.corlymeng.model.Collection;
import com.corlymeng.model.CollectionDAO;
import com.corlymeng.model.Project;
import com.corlymeng.model.ProjectDAO;
import com.corlymeng.model.Required;
import com.corlymeng.model.RequiredDAO;
import com.corlymeng.model.User;
import com.corlymeng.model.UserDAO;
import com.corlymeng.util.MyUtil;

@SessionAttributes("loginUser")
@RequestMapping("/user")
@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;
	@Autowired
	private ApplyDAO applyDAO;
	@Autowired
	private ArticleDAO articleDAO;
	@Autowired
	private ProjectDAO projectDAO;
	@Autowired
	private CollectionDAO collectionDAO;
	@Autowired
	private RequiredDAO requiredDAO;
	
	private User user;
	private String rootPath = System.getProperty("rootPath");
	
	@ModelAttribute
	public void getUser(Map<String, Object> map, HttpSession httpSession){
		System.out.println("model attribute");
		user = (User) httpSession.getAttribute("loginUser");
		map.put("user", user);
		map.put("applies", applyDAO.findByUserAndRequired(user,null));
	}
	
	//我的简历界面
	@RequestMapping(value="/myresume")
	public String myResume(Map<String, Object> map) {
		map.put("articles", articleDAO.findByUserid(user.getId()));
		map.put("projects", projectDAO.findByUserid(user.getId()));
		
		return "myresume";
	}
	
	//投递箱
	@RequestMapping("/dilivery")
	public String myDelivery() {
		
		return "delivery";
	}
	
	@RequestMapping("/collection")
	public String myCollection(Map<String, Object> map) {
		System.out.println(collectionDAO.findByProperty("user", user).size());
		map.put("collections", collectionDAO.findByProperty("user", user));
		return "collection";
	}
	
	@ResponseBody
	@RequestMapping(value="/myresume/upload", method=RequestMethod.POST)
	public AjaxMessage uploadResume(@RequestParam(value="file",required=false) MultipartFile upload) throws IllegalStateException, IOException {
		AjaxMessage result = new AjaxMessage();
		if (upload.isEmpty()) {
			result.setErrors(1);
			result.setMessage("文件为空，上传失败");
		}else {
			DateFormat fmtDateTime = new SimpleDateFormat("yyyy-MM-dd/HHmmss");
			String destFileName = "uploads/" + fmtDateTime.format(new Date())+ "-" + user.getId();
			System.out.println(destFileName);
			String realName = upload.getOriginalFilename();
			boolean b = MyUtil.uploadFile(rootPath+destFileName, upload);
			if (b) {
				user.setFilename(upload.getOriginalFilename());
				user.setFilepath(destFileName);
				userDAO.attachDirty(user);
				Map<String, String> resMap = new HashMap<String, String>();
				resMap.put("href", destFileName);
				resMap.put("fileName", realName);
				result.setData(resMap);
				result.setMessage("文件上传成功");
			}
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/myresume/del", method=RequestMethod.DELETE)
	public AjaxMessage delResume() {
		AjaxMessage result = new AjaxMessage();
		System.out.println(user.getId()+rootPath);
		if (MyUtil.delFile(rootPath + user.getFilepath())) {
			user.setFilename(null);
			user.setFilepath(null);
			userDAO.attachDirty(user);
			result.setMessage("删除成功");
		} else {
			result.setErrors(1);
			result.setMessage("删除失败");
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/myresume/download")
	public ResponseEntity<byte[]> dwonloadResume() throws IOException {
		String path = System.getProperty("rootPath") +user.getFilepath();
		return MyUtil.downloadFile(path, user.getFilename());
	}
	
	@RequestMapping(value="/myresume", method=RequestMethod.POST)
	public String modifyUser(User user, Map<String, Object> map) {
		System.out.println(user);
		userDAO.attachDirty(user);
		map.put("loginUser", user);
		map.put("message", "更新成功");
		return "myresume";
	}
	
	@ResponseBody
	@RequestMapping(value="/delapply", method=RequestMethod.POST)
	public AjaxMessage delApply(@RequestParam("id") Integer id) {
		AjaxMessage result = new AjaxMessage();
		System.out.println(id);
//		Apply apply = new Apply();
//		apply.setId(id);
//		applyDAO.delete(apply);
		Apply apply = applyDAO.findById(id);
		applyDAO.delete(apply);
		result.setErrors(0);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/myresume/addAP", method=RequestMethod.POST)
	public AjaxMessage addAP(@RequestParam("type") String type, @RequestParam("title") String title,
				@RequestParam("description") String description) {
		AjaxMessage result = new AjaxMessage();
		if (type.equals("article")) {
			Article article = new Article(title, description, user.getId());
			articleDAO.save(article);
		}else if (type.equals("project")) {
			Project project = new Project(title, description, user.getId());
			projectDAO.save(project);
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/collection", method=RequestMethod.POST)
	public AjaxMessage addCollection(@RequestParam("id") Integer id){
		AjaxMessage result = new AjaxMessage();
		Collection collection = new Collection();
		Required required = new Required();
		required.setId(id);
		collection.setRequired(required);
		collection.setUser(user);
		collection.setCollectiontime(new Date());
		collectionDAO.save(collection);
		result.setErrors(0);
		result.setMessage("收藏成功");
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/collection", method=RequestMethod.DELETE)
	public AjaxMessage delCollection(@RequestParam("id") Integer id) {
		AjaxMessage result = new AjaxMessage();
		collectionDAO.delete1(id, user.getId());
		return result;
	}
	
	// 提交简历
	@ResponseBody
	@RequestMapping(value="/apply", method=RequestMethod.POST)
	public AjaxMessage applyJob(@RequestParam("id") Integer id, HttpSession httpSession) {
		AjaxMessage ajaxMessage = new AjaxMessage();
		Apply apply = new Apply();
		apply.setRequired(requiredDAO.findById(id));
		User user = (User) httpSession.getAttribute("loginUser");
		apply.setUser(user);
		apply.setApplytime(new Date());
		apply.setIsConfirm((short) -1);
		applyDAO.save(apply);
		ajaxMessage.setErrors(0);
		ajaxMessage.setMessage("提交成功");
		return ajaxMessage;
	}
}
