package com.work.util;

import java.io.File;

import com.jfinal.core.Const;


public class StringUtil {

	public static void main(String[] args) {
		System.out.println(getRandom());
		System.out.println("张健".length());
	}
	
	public static String getPath() {
		return new File(Const.class.getClassLoader().getResource("/").getPath()).getParentFile().getParent();
	}
	
	public static boolean createFolder(File folder) {
		if (!folder.exists()) {
			return folder.mkdir();
		}
		return true;
	}
	
	public static boolean isBlank(String check) {
		if (check==null || check.trim().equals(""))
			return true;
		return false;
	}
	
	public static String getRandom() {
        String result = "";
        char c;
		for (int i = 0; i < 8; i++) {
            c = (char) (int) (Math.random() * 26 + 97);
            result += c;
        }
        if (result.endsWith(".")) 
        	result = result.substring(0, result.length() - 1);
        return result;
	}
	
	public static String getRandomPkgname() {
        String pkg = "com.";
        char c;
        for (int i = 0; i < 8; i++) {
            c = (char) (int) (Math.random() * 26 + 97);
            pkg += c;
        }
        if (pkg.endsWith(".")) 
            pkg = pkg.substring(0, pkg.length() - 1);
        return pkg;
	}
	 /**
     * 返回mysql limit 字符串
     * 
     * @param 当前页号p,页面大小
     * @return
     */
    public static String getLimit(int p, int page_size) {
        String limit = "";
        /*int m = 0;
        int n = Const.PAGE_SIZE;
        m = p - 1 < 0 ? 0 : p - 1;
        n = page_size <= 0 ? Const.PAGE_SIZE : page_size;
        limit = " LIMIT " + m * n + "," + n;*/
        return limit;
    }
}
