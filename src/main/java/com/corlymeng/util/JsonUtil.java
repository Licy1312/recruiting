package com.corlymeng.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import java.util.Map;

import net.sf.json.JSONArray;

import com.corlymeng.model.User;

public class JsonUtil {

	public JsonUtil() {
	}
	/**
	 * 将user对象转换为json格式
	 * @param user
	 * @return
	 */
	public static JSONArray user2json(User user){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", user.getId());
		map.put("username", user.getUsername());
		JSONArray jsonArray = JSONArray.fromObject(map);
	
		return jsonArray;
	}
	/**
	 * 将字符串数字转化为list
	 * @param string
	 * @return
	 */
	public static List<String> menuList(String string){
		String[] stringArray = string.split(",");
		List<String> list = new ArrayList<String>();
		for(int i=0;i<stringArray.length;i++){
			list.add(stringArray[i]);
		}
		return list;
	}
}
