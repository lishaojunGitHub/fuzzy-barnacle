package com.work.util;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;


/**
 * 用于处理HTTP请求的工具类
 */
public class RequestUtil {

	/**
	 * 获取COOKIE
	 * 
	 * @param name
	 */
	public static Cookie getCookie(HttpServletRequest request, String name) {
		Cookie[] cookies = request.getCookies();
		if (cookies == null)
			return null;
		for (Cookie ck : cookies) {
			if (StringUtils.equalsIgnoreCase(name, ck.getName()))
				return ck;
		}
		return null;
	}

	/**
	 * 获取COOKIE
	 * 
	 * @param name
	 */
	public static String getCookieValue(HttpServletRequest request, String name) {
		Cookie[] cookies = request.getCookies();
		if (cookies == null)
			return null;
		for (Cookie ck : cookies) {
			if (StringUtils.equalsIgnoreCase(name, ck.getName()))
				return ck.getValue();
		}
		return null;
	}

	/**
	 * 设置COOKIE
	 * 
	 * @param name
	 * @param value
	 * @param maxAge
	 */
	public static void setCookie(HttpServletRequest request,
			HttpServletResponse response, String name, String value, int maxAge) {
		setCookie(request, response, name, value, maxAge, true);
	}

	/**
	 * 设置COOKIE
	 * 
	 * @param name
	 * @param value
	 * @param maxAge
	 */
	public static void setCookie(HttpServletRequest request,
			HttpServletResponse response, String name, String value,
			int maxAge, boolean all_sub_domain) {
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(maxAge);
		if (all_sub_domain) {
			String serverName = request.getServerName();
			String domain = getDomainOfServerName(serverName);
			if (domain != null && domain.indexOf('.') != -1) {
				cookie.setDomain('.' + domain);
			}
		}
		cookie.setPath("/");
		response.addCookie(cookie);
	}

	public static void deleteCookie(HttpServletRequest request,
			HttpServletResponse response, String name, boolean all_sub_domain) {
		setCookie(request, response, name, "", 0, all_sub_domain);
	}

	/**
	 * 获取用户访问URL中的根域 例如: www.xxxx.cn -> xxxx.cn
	 * 
	 * @param req
	 * @return
	 */
	public static String getDomainOfServerName(String host) {
		if (isIPAddr(host))
			return null;
		String[] names = StringUtils.split(host, '.');
		int len = names.length;
		if (len == 1)
			return null;
		if (len == 3) {
			return makeup(names[len - 2], names[len - 1]);
		}
		if (len > 3) {
			String dp = names[len - 2];
			if (dp.equalsIgnoreCase("com") || dp.equalsIgnoreCase("gov")
					|| dp.equalsIgnoreCase("net") || dp.equalsIgnoreCase("edu")
					|| dp.equalsIgnoreCase("org"))
				return makeup(names[len - 3], names[len - 2], names[len - 1]);
			else
				return makeup(names[len - 2], names[len - 1]);
		}
		return host;
	}

	/**
	 * 判断字符串是否是一个IP地址
	 * 
	 * @param addr
	 * @return
	 */
	public static boolean isIPAddr(String addr) {
		if (StringUtils.isBlank(addr))
			return false;
		String[] ips = StringUtils.split(addr, '.');
		if (ips.length != 4)
			return false;
		try {
			int ipa = Integer.parseInt(ips[0]);
			int ipb = Integer.parseInt(ips[1]);
			int ipc = Integer.parseInt(ips[2]);
			int ipd = Integer.parseInt(ips[3]);
			return ipa >= 0 && ipa <= 255 && ipb >= 0 && ipb <= 255 && ipc >= 0
					&& ipc <= 255 && ipd >= 0 && ipd <= 255;
		} catch (Exception e) {
		}
		return false;
	}

	private static String makeup(String... ps) {
		StringBuilder s = new StringBuilder();
		for (int idx = 0; idx < ps.length; idx++) {
			if (idx > 0)
				s.append('.');
			s.append(ps[idx]);
		}
		return s.toString();
	}

	/**
	 * 获取浏览器提交的整形参数
	 * 
	 * @param param
	 * @param defaultValue
	 * @return
	 */
	public static int getParam(HttpServletRequest req, String param,
			int defaultValue) {
		return NumberUtils.toInt(req.getParameter(param), defaultValue);
	}
	
	/**
	 * 获取浏览器提交的整形参数
	 * 
	 * @param param
	 * @param defaultValue
	 * @return
	 */
	public static float getParam(HttpServletRequest req, String param,
			float defaultValue) {
		return NumberUtils.toFloat(req.getParameter(param), defaultValue);
	}

	/**
	 * 获取浏览器提交的整形参数
	 * 
	 * @param param
	 * @param defaultValue
	 * @return
	 */
	public static long getParam(HttpServletRequest req, String param,
			long defaultValue) {
		return NumberUtils.toLong(req.getParameter(param), defaultValue);
	}

	public static long[] getParamValues(HttpServletRequest req, String name) {
		String[] values = req.getParameterValues(name);
		if (values == null)
			return null;
		return (long[]) ConvertUtils.convert(values, long.class);
	}

	/**
	 * 获取浏览器提交的字符串
	 * 
	 * @param param
	 * @param defaultValue
	 * @return
	 */
	public static String getParam(HttpServletRequest req, String param,
			String defaultValue) {
		String value = req.getParameter(param);
		if (req.getMethod().equalsIgnoreCase("get") && value !=null) {
			try {
				value = new String(value.getBytes("ISO-8859-1"), "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return (StringUtils.isEmpty(value)) ? defaultValue : value;
	}

	public static String getSessionParam(HttpServletRequest req, String param,
			String defaultValue) {
		String value = (String) req.getSession().getAttribute(param);
		return (StringUtils.isEmpty(value)) ? defaultValue : value;
	}

	public static int getSessionParam(HttpServletRequest req, String param,
			int defaultValue) {
		String value = (String) req.getSession().getAttribute(param);
		return NumberUtils.toInt(value, defaultValue);
	}

	
}
