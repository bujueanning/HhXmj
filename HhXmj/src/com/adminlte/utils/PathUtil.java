package com.adminlte.utils;

/**
 * 路径工具类
 * 
 * 
 */
public class PathUtil {
	/*
	 * 获取classpath,file:/D:/eclipse/springTest/WebRoot/WEB-INF/classes/
	 */
	public static String getClassPath(){
		return Thread.currentThread().getContextClassLoader().getResource("").toString().replaceAll("file:/", "");	
	}
	/*
	 * 获取classpath,file:/D:/eclipse/springTest/WebRoot/WEB-INF/classes/
	 */
	public static String getWebPath(String filePath){
		String classPath = Thread.currentThread().getContextClassLoader().getResource("").toString().replaceAll("file:/", "");
		return classPath.replaceAll("WEB-INF/classes/", filePath);	
	}
	public static String getWebPath(){
		String classPath = Thread.currentThread().getContextClassLoader().getResource("").toString().replaceAll("file:/", "");
		return classPath.replaceAll("WEB-INF/classes/", "");	
	}
}
