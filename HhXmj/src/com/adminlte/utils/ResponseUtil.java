package com.adminlte.utils;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

public class ResponseUtil {
	/**
	 * @param response 
	 * @param filePath		//文件完整路径(包括文件名和扩展名)
	 * @param fileName		//下载后看到的文件名
	 * @return  文件名
	 */
	public static void fileDownload(final HttpServletResponse response, String filePath, String fileName) throws Exception{  
		     
		    byte[] data = FileUtils.readFileToByteArray(new File(filePath));  
		    fileName = URLEncoder.encode(fileName, "UTF-8");  
		    response.reset();  
		    response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");  
		    response.addHeader("Content-Length", "" + data.length);  
		    response.setContentType("application/octet-stream;charset=UTF-8");  
		    OutputStream outputStream = new BufferedOutputStream(response.getOutputStream());  
		    outputStream.write(data);  
		    outputStream.flush();  
		    outputStream.close();
		    response.flushBuffer();
		    
		}
	/**
	 * ajax返回值
	 * @param resultCode 1成功 2失败
	 * @param msg
	 * @return
	 */
	public static Map resultMap(Object resultObj){
		Map resultMap = new HashMap();
		resultMap.put("resultCode", 1);
		resultMap.put("resultMsg", "成功");
		resultMap.put("resultObj", resultObj);
        return resultMap;
	}
	/**
	 * ajax返回值
	 * @param resultCode 1成功 2失败
	 * @param msg
	 * @return
	 */
	public static Map resultMap(Integer resultCode,String resultMsg,Object resultObj){
		Map resultMap = new HashMap();
		resultMap.put("resultCode", resultCode);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("resultObj", resultObj);
        return resultMap;
	}
	/**
	 * ajax返回值
	 * @param resultCode 1成功 2失败
	 * @param msg
	 * @return
	 */
	public static Map resultMap(Integer resultCode,String resultMsg){
		Map resultMap = new HashMap();
		resultMap.put("resultCode", resultCode);
		resultMap.put("resultMsg", resultMsg);
        return resultMap;
	}
	
}
