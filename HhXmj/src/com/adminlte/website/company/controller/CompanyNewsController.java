package com.adminlte.website.company.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
import com.adminlte.website.company.service.CompanyNewsService;
import com.adminlte.utils.DictUtils;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.POIUtil;
import com.adminlte.utils.PathUtil;
import com.adminlte.utils.RequestUtil;
import com.adminlte.utils.ResponseUtil;
import com.adminlte.utils.ShiroUtils;


/** 
 * 类名称：companyNewsController
 * 创建人：Cheng
 * 创建时间：2017-10-18
 */
@Controller
@RequestMapping(value="company/news")
public class CompanyNewsController{
	private Log logger = LogFactory.getLog(CompanyNewsController.class);
	@Resource(name="companyNewsService")
	private CompanyNewsService companyNewsService;
	@Resource(name = "dictUtils")
	private DictUtils dictUtils;
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save() throws Exception{
		logger.info("start----------------新增companyNews");
		Map<String,Object> companyNews = RequestUtil.getParameterMap(logger);
		if(StringUtils.isEmpty(companyNews.get("company_news_id").toString())){
			companyNews.put("company_news_id", IDUtil.get32UUID());
			companyNews.put("company_news_createtime", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			companyNews.put("company_news_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			companyNewsService.save(companyNews);
		}else{
			companyNews.put("company_news_updatetime", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    companyNews.put("company_news_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			companyNewsService.updateById(companyNews);
		}
		
		return ResponseUtil.resultMap(1, "success");
	}
	/**
	 * 上传
	 */
	@RequestMapping("/upload") 
	@ResponseBody
	public String upload(@RequestParam(value="files[]", required=false) MultipartFile[] files,String companyNewsId){
		String path = PathUtil.getWebPath()+"upload/";
		try {
			for(MultipartFile mfile : files){
	            if (!mfile.isEmpty()) {
                	Map<String,Object> companyNewsMap = new HashMap<String,Object>();
	                	 	companyNewsMap.put("company_news_id", IDUtil.get32UUID());
							companyNewsMap.put("title", "");
							companyNewsMap.put("text", "");
							companyNewsMap.put("company_news_createuid", "");
							companyNewsMap.put("company_news_createtime", "");
							companyNewsMap.put("company_news_updatetime", "");
	                companyNewsService.saveList(POIUtil.readExcelToMap(mfile.getInputStream(),mfile.getName(),companyNewsMap),companyNewsMap);
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
		logger.info("start----------------删除companyNews");
		Map<String,Object> companyNews = RequestUtil.getParameterMap(logger);
		try{
			companyNewsService.delete(companyNews);
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
		logger.info("start----------------修改companyNews");
		Map<String,Object> companyNews = RequestUtil.getParameterMap(logger);
		companyNews.put("company_news_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
	    companyNews.put("company_news_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
		companyNewsService.updateById(companyNews);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","success");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("company/news/companynews_list");
		return mv;
	}
	
	/**
	 * 后台列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表companyNews");
		Map<String,Object> companyNews = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				companyNews.put(conditionName,conditionValue);
			}
			List<Object> varList = companyNewsService.pageList(companyNews);	//列出companyNews列表
			mv.addObject("varList", varList);
			mv.addObject("companyNews", companyNews);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("company/news/companynews_list");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 前端列表
	 */
	@RequestMapping(value="/frontList")
	public ModelAndView frontList(String orderByClause, String paneltitle){
		logger.info("start----------------列表companyNews");
		Map<String,Object> companyNews = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			List<Object> varList = companyNewsService.pageList(companyNews);	//列出companyNews列表
			mv.addObject("varList", varList);
			mv.addObject("companyNews", companyNews);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("company/news/catalog");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 列表
	 */
	@RequestMapping(value="/companynews")
	public ModelAndView companynews(String paneltitle){
		logger.info("start----------------列表companyNews");
		Map<String,Object> companyNews = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			List<Object> varList = companyNewsService.pageList(companyNews);	//列出companyNews列表
			mv.addObject("varList", varList);
			mv.addObject("companyNews", companyNews);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("company/news/companynews_index");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 详情
	 */
	@RequestMapping(value="/details")
	public ModelAndView details(String company_news_id) throws Exception{
		logger.info("start----------------修改companyNews");
		Map<String,Object> companyNews = RequestUtil.getParameterMap(logger);
		companyNews.put("company_news_id", company_news_id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("companyNewsInfo",companyNewsService.find(companyNews));
		mv.addObject("varList",companyNewsService.list(null));
		mv.setViewName("company/news/contents");
		return mv;
	}
	/**
	 * 列表
	 */
	@RequestMapping(value="/listtree")
	public ModelAndView listTree(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表companyNews");
		Map<String,Object> companyNews = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				companyNews.put(conditionName,conditionValue);
			}
			List<Object> varList = companyNewsService.pageList(companyNews);	//列出companyNews列表
			mv.addObject("varList", varList);
			mv.addObject("companyNews", companyNews);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("company/news/companynews_list_tree");
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
		logger.info("start----------------列表companyNews");
		Map<String,Object> companyNews = RequestUtil.getParameterMap(logger);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				companyNews.put(conditionName,conditionValue);
			}
			List<Object> varList = companyNewsService.pageList(companyNews);	//列出companyNews列表
			resultMap.put("varList", varList);
			resultMap.put("companyNews", companyNews);
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
		logger.info("start----------------去新增companyNews页面");
		Map<String,Object> companyNews = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("companyNews", companyNews);
		mv.addObject("dict", dictUtils.getDictByTable("company_news"));
		mv.setViewName("company/news/companynews_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(String paneltitle){
		logger.info("start----------------去修改companyNews页面");
		Map<String,Object> companyNews = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("companyNews", companyNewsService.find(companyNews));
			
			mv.addObject("dict", dictUtils.getDictByTable("company_news"));
			mv.setViewName("company/news/companynews_edit_dialog");
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
		logger.info("start----------------批量删除companyNews");
		Map<String,Object> companyNews = RequestUtil.getParameterMap(logger);
		try {
			companyNewsService.delete(companyNews);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除companyNews");
		}
		return ResponseUtil.resultMap(1, "success");
	}
}
