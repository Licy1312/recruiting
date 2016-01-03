/**
 * @author corlymeng.com
 * @date 2015年10月24日
 */
package com.corlymeng.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

public class MyUtil {
	public static String str2MD5(String str) {
		char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'a', 'b', 'c', 'd', 'e', 'f' };// 用来将字节转换成16进制表示的字符
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			
			// MD5 的计算结果是一个 128 位的长整数， 用字节表示就是 16 个字节
			byte tmp[] = md.digest();
			// 每个字节用 16 进制表示的话，使用两个字符， 所以表示成 16进制需要 32 个字符
			char result[] = new char[16 * 2];
			int k = 0;// 表示转换结果中对应的字符位置
			for (int i = 0; i < 16; i++) {
				// 从第一个字节开始，对 MD5 的每一个字节转换成 16进制字符的转换
				byte byte0 = tmp[i];// 取第 i 个字节
				result[k++] = hexDigits[byte0 >>> 4 & 0xf];// 取字节中高 4 位的数字转换,// >>>
				// 为逻辑右移，将符号位一起右移
				result[k++] = hexDigits[byte0 & 0xf];// 取字节中低 4 位的数字转换

			}
			
			return new String(result);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "errors";
	}
	
	public static String getCurrentTime() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(new Date());
	}
	
	public static boolean isLogin(HttpSession session, String name) {
		if (session.getAttribute(name) != null) {
			return true;
		} else {
			return false;
		}
	}
	
	public static boolean uploadFile(String destPath, MultipartFile upload) throws IllegalStateException, IOException {
		
		File file = new File(destPath);
		//判断目标文件所在的目录是否存在  
        if(!file.getParentFile().exists()) {  
            //如果目标文件所在的目录不存在，则创建父目录  
            System.out.println("目标文件所在目录不存在，准备创建它！");  
            if(!file.getParentFile().mkdirs()) {  
                return false;
            }  
        }  
		upload.transferTo(file);
		return true;
	}
	
	public static boolean delFile(String filepath) {
		File file = new File(filepath);
		if (file.isFile() && file.exists()) {
			file.delete();
			return true;
		}else {
			return false;
		}
	}
	
	public static ResponseEntity<byte[]> downloadFile(String path,String filename) throws IOException {
		HttpHeaders headers = new HttpHeaders();
		byte[] body = null;
		HttpStatus httpState = HttpStatus.NOT_FOUND;
		File file = new File(path);
		if (file.exists() && file.isFile()) {
 
			InputStream is = new FileInputStream(file);
			body = new byte[is.available()];
			is.read(body);
			is.close();
			System.out.println(new MimetypesFileTypeMap().getContentType(file));
			headers.setContentType(MediaType.MULTIPART_FORM_DATA);
			headers.add("Content-Length", "" + body.length);
//			headers.setContentDispositionFormData(filename, filename);
			
			headers.add("Content-Disposition", "attachment;filename="+ 
						URLEncoder.encode(filename, "UTF-8"));
			httpState = HttpStatus.OK;
 
		}
 
		ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(body, headers,
				httpState);
 
		return entity;
	}
}
