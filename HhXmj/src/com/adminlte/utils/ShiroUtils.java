package com.adminlte.utils;

import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

public class ShiroUtils {
	public static Map<String,Object> getCurrentUser() {
		Map<String,Object> sysUser = null;
		Subject currentSubject = SecurityUtils.getSubject();
		Session session = currentSubject.getSession();
		if (null != currentSubject) {
			sysUser = (Map<String,Object>) session.getAttribute("currentUser");
		}
		return sysUser;
	}

	/**
	 * 将一些数据放到ShiroSession中,以便于其它地方使用
	 * 
	 * @see 比如Controller,使用时直接用HttpSession.getAttribute(key)就可以取到
	 */
	public static void setAttr(Object key, Object value) {
		Subject currentSubject = SecurityUtils.getSubject();
		if (null != currentSubject) {
			Session session = currentSubject.getSession();
			System.out.println("Session默认超时时间为[" + session.getTimeout() + "]毫秒");
			if (null != session) {
				session.setAttribute(key, value);
			}
		}
	}
	/**
	 * 将一些数据放到ShiroSession中,以便于其它地方使用
	 * 
	 * @see 比如Controller,使用时直接用HttpSession.getAttribute(key)就可以取到
	 */
	public static Object getAttr(Object key) {
		Subject currentSubject = SecurityUtils.getSubject();
		Session session = currentSubject.getSession();
		if (null != session) {
			return session.getAttribute(key);
		}
		return null;
	}
}
