package com.adminlte.auction.kill.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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

import com.adminlte.auction.kill.service.KillProcessService;
import com.adminlte.utils.DictUtils;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.POIUtil;
import com.adminlte.utils.PathUtil;
import com.adminlte.utils.RequestUtil;
import com.adminlte.utils.ResponseUtil;
import com.adminlte.utils.ShiroUtils;


/** 
 * 类名称：killProcessController
 * 创建人：jiao
 * 创建时间：2017-11-20
 */
@Controller
@RequestMapping(value="kill/process")
public class KillProcessController{
	private Log logger = LogFactory.getLog(KillProcessController.class);
	@Resource(name="killProcessService")
	private KillProcessService killProcessService;
	@Resource(name = "dictUtils")
	private DictUtils dictUtils;
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save() throws Exception{
		logger.info("start----------------新增killProcess");
		Map<String,Object> killProcess = RequestUtil.getParameterMap(logger);
		if(StringUtils.isEmpty(killProcess.get("kill_process_id").toString())){
			killProcess.put("kill_process_id", IDUtil.get32UUID());
			killProcess.put("kill_process_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			killProcess.put("kill_process_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			killProcessService.save(killProcess);
		}else{
			killProcess.put("kill_process_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    killProcess.put("kill_process_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			killProcessService.updateById(killProcess);
		}
		
		return ResponseUtil.resultMap(1, "success");
	}
	/**
	 * 上传
	 */
	@RequestMapping("/upload") 
	@ResponseBody
	public String upload(@RequestParam(value="files[]", required=false) MultipartFile[] files,String killProcessId){
		String path = PathUtil.getWebPath()+"upload/";
		try {
			for(MultipartFile mfile : files){
	            if (!mfile.isEmpty()) {
                	Map<String,Object> killProcessMap = new HashMap<String,Object>();
							killProcessMap.put("killid", "");
							killProcessMap.put("kill_time", "");
							killProcessMap.put("kill_name", "");
	                killProcessService.saveList(POIUtil.readExcelToMap(mfile.getInputStream(),mfile.getName(),killProcessMap),killProcessMap);
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
	@RequestMapping("/download") 
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
	 * 删除
	 */
	@RequestMapping(value="/del")
	@ResponseBody
	public Object delete(){
		logger.info("start----------------删除killProcess");
		Map<String,Object> killProcess = RequestUtil.getParameterMap(logger);
		try{
			killProcessService.delete(killProcess);
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
		logger.info("start----------------修改killProcess");
		Map<String,Object> killProcess = RequestUtil.getParameterMap(logger);
		killProcess.put("kill_process_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
	    killProcess.put("kill_process_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
		killProcessService.updateById(killProcess);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","success");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("kill/process/killprocess_list");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表killProcess");
		Map<String,Object> killProcess = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				killProcess.put(conditionName,conditionValue);
			}
			List<Object> varList = killProcessService.pageList(killProcess);	//列出killProcess列表
			mv.addObject("varList", varList);
			mv.addObject("killProcess", killProcess);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("kill/process/killprocess_list");
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
		logger.info("start----------------列表killProcess");
		Map<String,Object> killProcess = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				killProcess.put(conditionName,conditionValue);
			}
			List<Object> varList = killProcessService.pageList(killProcess);	//列出killProcess列表
			mv.addObject("varList", varList);
			mv.addObject("killProcess", killProcess);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("kill/process/killprocess_list_tree");
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
		logger.info("start----------------列表killProcess");
		Map<String,Object> killProcess = RequestUtil.getParameterMap(logger);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				killProcess.put(conditionName,conditionValue);
			}
			List<Object> varList = killProcessService.pageList(killProcess);	//列出killProcess列表
			resultMap.put("varList", varList);
			resultMap.put("killProcess", killProcess);
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
		logger.info("start----------------去新增killProcess页面");
		Map<String,Object> killProcess = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("killProcess", killProcess);
		mv.addObject("dict", dictUtils.getDictByTable("kill_process"));
		mv.setViewName("kill/process/killprocess_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(String paneltitle){
		logger.info("start----------------去修改killProcess页面");
		Map<String,Object> killProcess = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("killProcess", killProcessService.find(killProcess));
			
			mv.addObject("dict", dictUtils.getDictByTable("kill_process"));
			mv.setViewName("kill/process/killprocess_edit_dialog");
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
		logger.info("start----------------批量删除killProcess");
		Map<String,Object> killProcess = RequestUtil.getParameterMap(logger);
		try {
			killProcessService.delete(killProcess);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除killProcess");
		}
		return ResponseUtil.resultMap(1, "success");
	}
}
