package com.corlymeng.util;

public class MenuTest {
	private String menuPath;
	private String menuName;
	private String menuDescript;
	
	
	public MenuTest() {
		super();
	}
	public MenuTest(String menuPath, String menuName,String menuDescript) {
		super();
		this.menuPath = menuPath;
		this.menuName = menuName;
		this.menuDescript = menuDescript;
	}
	public String getMenuDescript() {
		return menuDescript;
	}
	public void setMenuDescript(String menuDescript) {
		this.menuDescript = menuDescript;
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
