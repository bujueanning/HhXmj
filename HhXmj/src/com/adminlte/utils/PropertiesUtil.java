package com.adminlte.utils;

import java.io.FileInputStream;
import java.util.Properties;

public class PropertiesUtil {
	public static Properties getProperties(String propName){
		Properties prop = new Properties();// 属性集合对象     
		try {
	        FileInputStream fis = new FileInputStream(PathUtil.getClassPath()+"/"+propName);// 属性文件输入流     
	        prop.load(fis);// 将属性文件流装载到Properties对象中     
	        fis.close();// 关闭流     
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return prop;
	}
}
