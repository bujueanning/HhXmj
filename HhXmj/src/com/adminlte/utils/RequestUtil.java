package com.adminlte.utils;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.commons.logging.Log;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class RequestUtil {
	public static Map<String,Object> getParameterMap(Log logger) {
		StringBuffer logSB = new StringBuffer();
	    // 参数Map
	    Map<String,String[]> requestMap = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest().getParameterMap();
	    // 返回值Map
	    Map<String,Object> returnMap = new HashMap<String,Object>();
	    Iterator<Map.Entry<String, String[]>>  entries = requestMap.entrySet().iterator();
	    Map.Entry<String, String[]> entry;
	    String name = "";
	    String value = "";
	    while (entries.hasNext()) {
	        entry = (Map.Entry<String, String[]>) entries.next();
	        name = (String) entry.getKey();
	        Object valueObj = entry.getValue();
	        if(null == valueObj){
	        	logSB.append(name+": ;");
	            returnMap.put(name, "");
	        }else if(valueObj instanceof String[]){
	        	name = StringUtils.replace(name, "[]", "");
	        	if(StringUtils.contains(name, "ids")){
	        		logSB.append(name+":"+ReflectionToStringBuilder.toString(valueObj,ToStringStyle.SIMPLE_STYLE)+";");
	        		 returnMap.put(name, valueObj);
	        	}else{
	        		value = ReflectionToStringBuilder.toString(valueObj,ToStringStyle.SIMPLE_STYLE);
		        	value = StringUtils.replace(value, "{", "");
				    value = StringUtils.replace(value, "}", "");
				    logSB.append(name+":"+value+";");
				    returnMap.put(name, value);
	        	}
			    
	        }else{
	            logSB.append(name+":"+valueObj.toString()+";");
		        returnMap.put(name, valueObj.toString());
	        }
	        
	    }
	    logger.info("参数----------------"+logSB.toString());
	    return returnMap;
	}
}
