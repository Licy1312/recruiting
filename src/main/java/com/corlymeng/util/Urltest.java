package com.corlymeng.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

public class Urltest {
	/**
	 * @author 冀超
	 * @param $id $username
	 * @return status:success error sqlerr(数据库错误)
	 * 注册时的接口
	 * 
	 */
	final static String interface1 = "http://192.168.31.135/rbac/backend/web/index.php?r=rbac/access-interface/create&id=1&username=2";
	/**
	 * @author 冀超
	 * @param $id $url
	 * @return  status: true false notexist(用户不存在)
	 * 验证权限的接口
	 */
	final static String interface2 = "http://192.168.31.135/rbac/backend/web/index.php?r=rbac/access-interface/authentication&id=5&url=/*";		
	
	public static void main(String[] args) {
		System.out.println(loadJson(interface2));
	}
	
	
	public static String loadJson (String url) {
        StringBuilder json = new StringBuilder();
        try {
            URL urlObject = new URL(url);
            URLConnection uc = urlObject.openConnection();
            BufferedReader in = new BufferedReader(new InputStreamReader(uc.getInputStream()));
            String inputLine = null;
            while ( (inputLine = in.readLine()) != null) {
                json.append(inputLine);
            }
            in.close();
        } catch (MalformedURLException e) {
        	e.printStackTrace();
        } catch (IOException e) {
        	e.printStackTrace();
        }
        return json.toString();
    }

}
