package com.adminlte.sys.filex.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.adminlte.sys.filex.service.SysFilexService;
import com.adminlte.utils.DictUtils;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.POIUtil;
import com.adminlte.utils.PathUtil;
import com.adminlte.utils.RequestUtil;
import com.adminlte.utils.ResponseUtil;
import com.adminlte.utils.ShiroUtils;


/** 
 * 类名称：sysFilexController
 * 创建人：Cheng
 * 创建时间：2017-12-13
 */
@Controller
@RequestMapping(value="sys/filex")
public class SysFilexController{
	private Log logger = LogFactory.getLog(SysFilexController.class);
	@Resource(name="sysFilexService")
	private SysFilexService sysFilexService;
	@Resource(name = "dictUtils")
	private DictUtils dictUtils;
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save() throws Exception{
		logger.info("start----------------新增sysFilex");
		Map<String,Object> sysFilex = RequestUtil.getParameterMap(logger);
		if(StringUtils.isEmpty(sysFilex.get("sys_filex_id").toString())){
			sysFilex.put("sys_filex_id", IDUtil.get32UUID());
			sysFilex.put("sys_filex_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			sysFilex.put("sys_filex_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			sysFilexService.save(sysFilex);
		}else{
			sysFilex.put("sys_filex_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    sysFilex.put("sys_filex_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			sysFilexService.updateById(sysFilex);
		}
		
		return ResponseUtil.resultMap(1, "success");
	}
	/**
	 * 上传
	 */
	@RequestMapping("/upload") 
	@ResponseBody
	public String upload(@RequestParam(value="files[]", required=false) MultipartFile[] files,String sysFilexId){
		String path = PathUtil.getWebPath()+"upload/";
		try {
			for(MultipartFile mfile : files){
	            if (!mfile.isEmpty()) {
                	Map<String,Object> sysFilex= new HashMap<String,Object>();
                	String sys_filex_id = IDUtil.get32UUID();
	                	 	sysFilex.put("sys_filex_id", sys_filex_id);
	                	 	String FileName = mfile.getOriginalFilename();
	                	 	
	                	 	sysFilex.put("sys_filex_name", FileName);
	                	 	FileUtils.copyToFile(mfile.getInputStream(),
	    							new File(path+mfile.getOriginalFilename()));
	                	 	sysFilex.put("sys_filex_addr", path+mfile.getOriginalFilename());
							sysFilex.put("sys_filex_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
							sysFilex.put("sys_filex_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
							
	                sysFilexService.save(sysFilex);
	            }
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "success";
	}
	/**
	 * 下载
	 */
	@RequestMapping("/down") 
	public ResponseEntity<byte[]> download(){
		ResponseEntity<byte[]> down = null;
		try {
	        File file=new File("E:\\test.xlsx");  
	        HttpHeaders headers = new HttpHeaders();  
	        String fileName= new String("你好.xlsx".getBytes("UTF-8"),"iso-8859-1");//为了解决中文名称乱码问题  
	        headers.setContentDispositionFormData("attachment", fileName);   
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);   
	        down =  new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),    
	                headers, HttpStatus.CREATED);   
		} catch (Exception e) {
			e.printStackTrace();
		}
		return down;
	}
	/**
	 * 下载
	 */
	@RequestMapping("/download")
	public void download(String sys_filex_addr, HttpServletResponse response) {
        try {
        
            // path是指欲下载的文件的路径。
           
            String path=new String(sys_filex_addr.getBytes("ISO-8859-1"),"utf-8");
            //File file = new File(path);
            File file = new File(sys_filex_addr);
            
            System.out.println("解码前的路径是："+sys_filex_addr);
            System.out.println("解码后的路径是："+path);
            // 取得文件名。
            String filename = file.getName();
            // 取得文件的后缀名。
            String ext = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase();

            // 以流的形式下载文件。
            //InputStream fis = new BufferedInputStream(new FileInputStream(path));
            InputStream fis = new BufferedInputStream(new FileInputStream(sys_filex_addr));
            byte[] buffer = new byte[fis.available()];
            fis.read(buffer);
            fis.close();
            // 清空response
            response.reset();
            // 设置response的Header
            response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes("utf-8"), "ISO_8859_1"));
            response.addHeader("Content-Length", "" + file.length());
            OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
            response.setContentType("application/octet-stream");
            toClient.write(buffer);
            toClient.flush();
            toClient.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
	
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/del")
	@ResponseBody
	public Object delete(){
		logger.info("start----------------删除sysFilex");
		Map<String,Object> sysFilex = RequestUtil.getParameterMap(logger);
		try{
			sysFilexService.delete(sysFilex);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "success");
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(String paneltitle) throws Exception{
		logger.info("start----------------修改sysFilex");
		Map<String,Object> sysFilex = RequestUtil.getParameterMap(logger);
		sysFilex.put("sys_filex_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
	    sysFilex.put("sys_filex_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
		sysFilexService.updateById(sysFilex);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","success");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("sys/filex/sysfilex_list");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表sysFilex");
		Map<String,Object> sysFilex = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				sysFilex.put(conditionName,conditionValue);
			}
			List<Object> varList = sysFilexService.pageList(sysFilex);	//列出sysFilex列表
			mv.addObject("varList", varList);
			mv.addObject("sysFilex", sysFilex);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/filex/sysfilex_list");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 列表
	 */
	@RequestMapping(value="/listtree")
	public ModelAndView listTree(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表sysFilex");
		Map<String,Object> sysFilex = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				sysFilex.put(conditionName,conditionValue);
			}
			List<Object> varList = sysFilexService.pageList(sysFilex);	//列出sysFilex列表
			mv.addObject("varList", varList);
			mv.addObject("sysFilex", sysFilex);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/filex/sysfilex_list_tree");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 列表json方式
	 */
	@RequestMapping(value="/listjson")
	@ResponseBody
	public Object listjson(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表sysFilex");
		Map<String,Object> sysFilex = RequestUtil.getParameterMap(logger);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				sysFilex.put(conditionName,conditionValue);
			}
			List<Object> varList = sysFilexService.pageList(sysFilex);	//列出sysFilex列表
			resultMap.put("varList", varList);
			resultMap.put("sysFilex", sysFilex);
			resultMap.put("conditionName", conditionName);
			resultMap.put("conditionValue", conditionValue);
			resultMap.put("paneltitle", paneltitle);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "成功", resultMap);
	}
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goadd")
	public ModelAndView goAdd(String paneltitle){
		logger.info("start----------------去新增sysFilex页面");
		Map<String,Object> sysFilex = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("sysFilex", sysFilex);
		mv.addObject("dict", dictUtils.getDictByTable("sys_filex"));
		mv.setViewName("sys/filex/sysfilex_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(String paneltitle){
		logger.info("start----------------去修改sysFilex页面");
		Map<String,Object> sysFilex = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("sysFilex", sysFilexService.find(sysFilex));
			
			mv.addObject("dict", dictUtils.getDictByTable("sys_filex"));
			mv.setViewName("sys/filex/sysfilex_edit_dialog");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/delall")
	@ResponseBody
	public Object deleteAll() {
		logger.info("start----------------批量删除sysFilex");
		Map<String,Object> sysFilex = RequestUtil.getParameterMap(logger);
		try {
			sysFilexService.delete(sysFilex);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除sysFilex");
		}
		return ResponseUtil.resultMap(1, "success");
	}
}
