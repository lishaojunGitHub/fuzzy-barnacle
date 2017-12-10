package com.work.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SecurityUtil {
	
	private static String MIXSTR = "@#$*@&@^!hhu^";
	private static char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'}; 
	public static String getMixedMd5Code(String str){
		try {
			 byte[] btInput = (str+MIXSTR).getBytes();
	         // 获得MD5摘要算法的 MessageDigest 对象
	         MessageDigest mdInst = MessageDigest.getInstance("MD5");
			 // 使用指定的字节更新摘要
	         mdInst.update(btInput);
	         // 获得密文
	         byte[] md = mdInst.digest();
	         // 把密文转换成十六进制的字符串形式
	         int j = md.length;
	         char bytes[] = new char[j * 2];
	         int k = 0;
	         for (int i = 0; i < j; i++) {
	             byte byte0 = md[i];
	             bytes[k++] = hexDigits[byte0 >>> 4 & 0xf];
	             bytes[k++] = hexDigits[byte0 & 0xf];
	         }
	         return new String(bytes);
		} catch (NoSuchAlgorithmException e) {
			return null;
		}
	}
	
	public static void main(String[] args) {
		System.out.println(getMixedMd5Code("admin"));
	}

}
