package com.work.util;

import java.util.UUID;

public class Const {
	
	public final static String SESSIONCUSTOMER = "sessioncustomer"; //评估系统查询的公司名称
	public final static String SESSIONUSER = "sessionusername";
	public final static String SESSIONEMPLOYEE = "employee"; //登录用户bean
	
	public final static String INDUSTRY = ""; //行业  电力与电网
	
	public final static int SIZE = 20;
	
	public static void main(String[] args) {
		System.out.println(new Const().getAutoId(1));
	}
	
	public String getAutoId(int i) {
		String s = UUID.randomUUID().toString()+i; 
		s = s.substring(24, 35);
		return s;
	}
}
