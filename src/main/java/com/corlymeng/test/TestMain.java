/**
 * @author corlymeng.com
 * @date 2015年10月27日
 */
package com.corlymeng.test;



import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;


public class TestMain {

	public static void main(String[] args) throws IOException {
//		System.out.println(MyUtil.str2MD5("123"));
		Calendar calendar = Calendar.getInstance();
		Date date = new Date();
		System.out.println(calendar.getDisplayName(Calendar.DAY_OF_YEAR, Calendar.AM, Locale.CHINESE));
		DateFormat fmtDateTime = new SimpleDateFormat("yyyy-MM-dd/HHmmss");
		System.out.println(fmtDateTime.format(new Date()));
		File file = new File("D:\\MyEnv\\java\\apache-tomcat-7.0.64\\webapps\\recruiting\\uploads/2015-11-05/161458-1");
		System.out.println(file.exists());
//		file.getParentFile().mkdirs();
//		file.createNewFile();
		
		System.out.println(Integer.valueOf("null"));
	}

}
