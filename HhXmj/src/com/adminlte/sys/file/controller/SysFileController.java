package com.adminlte.sys.file.controller;

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
import com.adminlte.sys.file.service.SysFileService;
import com.adminlte.utils.DictUtils;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.POIUtil;
import com.adminlte.utils.PathUtil;
import com.adminlte.utils.RequestUtil;
import com.adminlte.utils.ResponseUtil;
import com.adminlte.utils.ShiroUtils;


/** 
 * 类名称：sysFileController
 * 创建人：Cheng
 * 创建时间：2017-05-02
 */
@Controller
@RequestMapping(value="sys/file")
public class SysFileController{
	private Log logger = LogFactory.getLog(SysFileController.class);
	@Resource(name="sysFileService")
	private SysFileService sysFileService;
	@Resource(name = "dictUtils")
	private DictUtils dictUtils;
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save() throws Exception{
		logger.info("start----------------新增sysFile");
		Map<String,Object> sysFile = RequestUtil.getParameterMap(logger);
		if(StringUtils.isEmpty(sysFile.get("sys_file_id").toString())){
			sysFile.put("sys_file_id", IDUtil.get32UUID());
			sysFile.put("sys_file_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			sysFile.put("sys_file_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			sysFileService.save(sysFile);
		}else{
			sysFile.put("sys_file_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    sysFile.put("sys_file_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			sysFileService.updateById(sysFile);
		}
		
		return ResponseUtil.resultMap(1, "成功");
	}
	/**
	 * 上传
	 */
	@RequestMapping("/upload") 
	@ResponseBody
	public String upload(@RequestParam(value="files[]", required=false) MultipartFile[] files,String sysFileId){
		try {
			for(MultipartFile mfile : files){
	            if (!mfile.isEmpty()) {
                	Map<String,Object> sysFileMap = new HashMap<String,Object>();
            	 	sysFileMap.put("sys_file_id", IDUtil.get32UUID());
					sysFileMap.put("sys_file_name", mfile.getOriginalFilename());
					sysFileMap.put("sys_file_addr", PathUtil.getWebPath("sysfiles/"+mfile.getOriginalFilename()));
					sysFileMap.put("sys_file_updatedate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
					sysFileMap.put("sys_file_createdate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
					sysFileMap.put("sys_file_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
					sysFileMap.put("sys_file_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
					sysFileService.save(sysFileMap);
					FileUtils.copyToFile(mfile.getInputStream(), new File(PathUtil.getWebPath("sysfiles/"+mfile.getOriginalFilename())));
	            }
	            
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "成功";
	}
	/**
	 * 下载
	 */
	@RequestMapping("/download") 
	public ResponseEntity<byte[]> download(){
		ResponseEntity<byte[]> down = null;
		Map<String,Object> sysFile = RequestUtil.getParameterMap(logger);
		try {
	        File file=new File(PathUtil.getWebPath("sysfiles/"+sysFile.get("sys_file_name").toString()));  
	        HttpHeaders headers = new HttpHeaders();  
	        String fileName= new String(sysFile.get("sys_file_name").toString().getBytes("UTF-8"),"iso-8859-1");//为了解决中文名称乱码问题  
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
		logger.info("start----------------删除sysFile");
		Map<String,Object> sysFile = RequestUtil.getParameterMap(logger);
		try{
			sysFileService.delete(sysFile);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "成功");
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(String paneltitle) throws Exception{
		logger.info("start----------------修改sysFile");
		Map<String,Object> sysFile = RequestUtil.getParameterMap(logger);
		sysFile.put("sys_file_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
	    sysFile.put("sys_file_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
		sysFileService.updateById(sysFile);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","成功");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("sys/file/sysfile_list");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表sysFile");
		Map<String,Object> sysFile = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				sysFile.put(conditionName,conditionValue);
			}
			List<Object> varList = sysFileService.pageList(sysFile);	//列出sysFile列表
			mv.addObject("varList", varList);
			mv.addObject("sysFile", sysFile);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/file/sysfile_list");
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
		logger.info("start----------------列表sysFile");
		Map<String,Object> sysFile = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				sysFile.put(conditionName,conditionValue);
			}
			List<Object> varList = sysFileService.pageList(sysFile);	//列出sysFile列表
			mv.addObject("varList", varList);
			mv.addObject("sysFile", sysFile);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/file/sysfile_list_tree");
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
		logger.info("start----------------列表sysFile");
		Map<String,Object> sysFile = RequestUtil.getParameterMap(logger);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				sysFile.put(conditionName,conditionValue);
			}
			List<Object> varList = sysFileService.pageList(sysFile);	//列出sysFile列表
			resultMap.put("varList", varList);
			resultMap.put("sysFile", sysFile);
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
		logger.info("start----------------去新增sysFile页面");
		Map<String,Object> sysFile = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("sysFile", sysFile);
		mv.addObject("dict", dictUtils.getDictByTable("sys_file"));
		mv.setViewName("sys/file/sysfile_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(String paneltitle){
		logger.info("start----------------去修改sysFile页面");
		Map<String,Object> sysFile = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("sysFile", sysFileService.find(sysFile));
			
			mv.addObject("dict", dictUtils.getDictByTable("sys_file"));
			mv.setViewName("sys/file/sysfile_edit_dialog");
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
		logger.info("start----------------批量删除sysFile");
		Map<String,Object> sysFile = RequestUtil.getParameterMap(logger);
		try {
			sysFileService.delete(sysFile);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除sysFile");
		}
		return ResponseUtil.resultMap(1, "成功");
	}
}
