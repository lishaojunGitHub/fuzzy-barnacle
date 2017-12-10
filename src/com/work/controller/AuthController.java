package com.work.controller;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import com.jfinal.core.Controller;
import com.work.model.auth.Employee;
import com.work.util.Const;
import com.work.util.RequestUtil;
import com.work.util.SecurityUtil;
import com.work.util.StringUtil;

public class AuthController extends Controller {
	
	public void login() {
        Employee employee = (Employee) getSession().getAttribute("employee");
        if (employee!=null) {
        	redirect("/admin/customer/customer/list");
        } else {
        	renderFreeMarker("/WEB-INF/views/login.ftl");
        }
	}
	
	public void logout() {
		HttpSession session = getSession();
	    session.removeAttribute(Const.SESSIONEMPLOYEE);
	    session.removeAttribute(Const.SESSIONUSER);
	    session.removeAttribute(Const.SESSIONCUSTOMER);
		redirect("/auth/login");
	}
	
	public void doLogin() {
		String username = RequestUtil.getParam(getRequest(), "username", "");
		String password = RequestUtil.getParam(getRequest(), "password", "");
		String remember = RequestUtil.getParam(getRequest(), "remember", "2");
		String error = "";
		boolean flag = true;
		if (username.equals("") || password.equals("")) {
			error = "用户名和密码不能为空"; flag = false;
		} else if (!Employee.checkExist(username)) {
			error = username+"不存在";flag = false;
		} else {
			String dbPassword = Employee.getPassword(username);
			if (StringUtil.isBlank(dbPassword) || !dbPassword.equals(SecurityUtil.getMixedMd5Code(password))) {
				error = "密码错误";flag = false;
			}
		}
		if (flag) {
			Cookie cookie = new Cookie("user_cookie", "");
            if ("1".equals(remember)) {
                cookie.setValue(username);
                cookie.setMaxAge(60 * 60 * 24 * 30);
                this.getResponse().addCookie(cookie);
            } else {
                cookie.setMaxAge(0);
                this.getResponse().addCookie(cookie);
            }
	        HttpSession session = getSession();
	        Employee employee = Employee.getUserByNameAndPwd(username, SecurityUtil.getMixedMd5Code(password));
	        if (employee != null) {
	        	setAttr("userid", employee.getStr("id"));
	            setAttr("username", employee.getStr("username"));
	            
	            session.setAttribute(Const.SESSIONEMPLOYEE, employee);
		        session.setAttribute(Const.SESSIONUSER,employee.getStr("username"));
				redirect("/admin/cp/cp/list");
	        } else {
				setAttr("error", "未知错误请联系客服");
	        	renderFreeMarker("/WEB-INF/views/login.ftl");
	        }
		} else {
			setAttr("error", error);
        	renderFreeMarker("/WEB-INF/views/login.ftl");
		}
		
	}
}
