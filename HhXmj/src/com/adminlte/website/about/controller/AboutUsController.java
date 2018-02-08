package com.adminlte.website.about.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.adminlte.website.about.service.AboutUsService;
import com.adminlte.utils.DictUtils;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.POIUtil;
import com.adminlte.utils.PathUtil;
import com.adminlte.utils.RequestUtil;
import com.adminlte.utils.ResponseUtil;
import com.adminlte.utils.ShiroUtils;


/** 
 * 类名称：aboutUsController
 * 创建人：Cheng
 * 创建时间：2017-10-20
 */
@Controller
@RequestMapping(value="about/us")
public class AboutUsController{
	private Log logger = LogFactory.getLog(AboutUsController.class);
	@Resource(name="aboutUsService")
	private AboutUsService aboutUsService;
	@Resource(name = "dictUtils")
	private DictUtils dictUtils;
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save() throws Exception{
		logger.info("start----------------新增aboutUs");
		Map<String,Object> aboutUs = RequestUtil.getParameterMap(logger);
		if(StringUtils.isEmpty(aboutUs.get("about_us_id").toString())){
			aboutUs.put("about_us_id", IDUtil.get32UUID());
			aboutUs.put("about_us_createtime", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			aboutUs.put("about_us_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			aboutUsService.save(aboutUs);
		}else{
			aboutUs.put("about_us_updatetime", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    aboutUs.put("about_us_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			aboutUsService.updateById(aboutUs);
		}
		
		return ResponseUtil.resultMap(1, "success");
	}
	/**
	 * 上传
	 */
	@RequestMapping("/upload") 
	@ResponseBody
	public String upload(@RequestParam(value="files[]", required=false) MultipartFile[] files,String aboutUsId){
		String path = PathUtil.getWebPath()+"upload/";
		try {
			for(MultipartFile mfile : files){
	            if (!mfile.isEmpty()) {
                	Map<String,Object> aboutUsMap = new HashMap<String,Object>();
	                	 	aboutUsMap.put("about_us_id", IDUtil.get32UUID());
							aboutUsMap.put("title", "");
							aboutUsMap.put("text", "");
							aboutUsMap.put("about_us_createuid", "");
							aboutUsMap.put("about_us_createtime", "");
							aboutUsMap.put("about_us_updatetime", "");
	                aboutUsService.saveList(POIUtil.readExcelToMap(mfile.getInputStream(),mfile.getName(),aboutUsMap),aboutUsMap);
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
		logger.info("start----------------删除aboutUs");
		Map<String,Object> aboutUs = RequestUtil.getParameterMap(logger);
		try{
			aboutUsService.delete(aboutUs);
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
		logger.info("start----------------修改aboutUs");
		Map<String,Object> aboutUs = RequestUtil.getParameterMap(logger);
		aboutUs.put("about_us_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
	    aboutUs.put("about_us_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
		aboutUsService.updateById(aboutUs);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","success");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("about/us/aboutus_list");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表aboutUs");
		Map<String,Object> aboutUs = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				aboutUs.put(conditionName,conditionValue);
			}
			List<Object> varList = aboutUsService.pageList(aboutUs);	//列出aboutUs列表
			mv.addObject("varList", varList);
			mv.addObject("aboutUs", aboutUs);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("about/us/aboutus_list");
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
		logger.info("start----------------列表aboutUs");
		Map<String,Object> aboutUs = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				aboutUs.put(conditionName,conditionValue);
			}
			List<Object> varList = aboutUsService.pageList(aboutUs);	//列出aboutUs列表
			mv.addObject("varList", varList);
			mv.addObject("aboutUs", aboutUs);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("about/us/aboutus_list_tree");
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
	public Object listjson(){
		logger.info("start----------------列表aboutUs");
		Map<String,Object> aboutUs = RequestUtil.getParameterMap(logger);
		JSONObject jsonObject = new JSONObject();
		try{
			List<Object> varList = aboutUsService.pageList(aboutUs);	//列出aboutUs列表
			for (Object obj : varList){
				jsonObject.put(((Map<String, String>)obj).get("about_us_id"), ((Map<String, String>)obj).get("title"));
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "成功", jsonObject);
	}
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goadd")
	public ModelAndView goAdd(String paneltitle){
		logger.info("start----------------去新增aboutUs页面");
		Map<String,Object> aboutUs = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("aboutUs", aboutUs);
		mv.addObject("dict", dictUtils.getDictByTable("about_us"));
		mv.setViewName("about/us/aboutus_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(String paneltitle){
		logger.info("start----------------去修改aboutUs页面");
		Map<String,Object> aboutUs = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("aboutUs", aboutUsService.find(aboutUs));
			
			mv.addObject("dict", dictUtils.getDictByTable("about_us"));
			mv.setViewName("about/us/aboutus_edit_dialog");
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
		logger.info("start----------------批量删除aboutUs");
		Map<String,Object> aboutUs = RequestUtil.getParameterMap(logger);
		try {
			aboutUsService.delete(aboutUs);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除aboutUs");
		}
		return ResponseUtil.resultMap(1, "success");
	}

	/**
	 * 详情
	 */
	@RequestMapping(value="/details")
	@ResponseBody
	public Object details(String title) throws Exception{
		logger.info("start----------------修改companyNews");
		Map<String,Object> aboutUs = RequestUtil.getParameterMap(logger);
		aboutUs.put("title", title);
		aboutUs.put("aboutUsInfo",aboutUsService.find(aboutUs));
		return ResponseUtil.resultMap(1, "成功", aboutUs);
	}
}
