package com.corlymeng.util;

public class MenuTest {
	private String menuPath;
	private String menuName;
	
	public MenuTest() {
		super();
	}
	public MenuTest(String menuPath, String menuName) {
		super();
		this.menuPath = menuPath;
		this.menuName = menuName;
	}
	public String getMenuPath() {
		return menuPath;
	}
	public void setMenuPath(String menuPath) {
		this.menuPath = menuPath;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
}
