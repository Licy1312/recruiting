/**
 * @author corlymeng.com
 * @date 2015年10月26日
 */
package com.corlymeng.ajax;

import java.util.Map;

public class AjaxMessage {
	private int errors=0;
	private String message;
	private Map<String, String> data;
	public int getErrors() {
		return errors;
	}
	public void setErrors(int errors) {
		this.errors = errors;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Map<String, String> getData() {
		return data;
	}
	public void setData(Map<String, String> data) {
		this.data = data;
	}
	
}
