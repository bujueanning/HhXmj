package com.adminlte.website.release.controller;

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
import com.adminlte.website.release.service.ReleaseNoticeService;
import com.adminlte.utils.DictUtils;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.POIUtil;
import com.adminlte.utils.PathUtil;
import com.adminlte.utils.RequestUtil;
import com.adminlte.utils.ResponseUtil;
import com.adminlte.utils.ShiroUtils;


/** 
 * 类名称：releaseNoticeController
 * 创建人：Cheng
 * 创建时间：2017-10-19
 */
@Controller
@RequestMapping(value="release/notice")
public class ReleaseNoticeController{
	private Log logger = LogFactory.getLog(ReleaseNoticeController.class);
	@Resource(name="releaseNoticeService")
	private ReleaseNoticeService releaseNoticeService;
	@Resource(name = "dictUtils")
	private DictUtils dictUtils;
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save() throws Exception{
		logger.info("start----------------新增releaseNotice");
		Map<String,Object> releaseNotice = RequestUtil.getParameterMap(logger);
		if(StringUtils.isEmpty(releaseNotice.get("release_notice_id").toString())){
			releaseNotice.put("release_notice_id", IDUtil.get32UUID());
			releaseNotice.put("release_notice_createtime", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			releaseNotice.put("release_notice_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			releaseNoticeService.save(releaseNotice);
		}else{
			releaseNotice.put("release_notice_updatetime", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    releaseNotice.put("release_notice_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			releaseNoticeService.updateById(releaseNotice);
		}
		
		return ResponseUtil.resultMap(1, "success");
	}
	/**
	 * 上传
	 */
	@RequestMapping("/upload") 
	@ResponseBody
	public String upload(@RequestParam(value="files[]", required=false) MultipartFile[] files,String releaseNoticeId){
		String path = PathUtil.getWebPath()+"upload/";
		try {
			for(MultipartFile mfile : files){
	            if (!mfile.isEmpty()) {
                	Map<String,Object> releaseNoticeMap = new HashMap<String,Object>();
	                	 	releaseNoticeMap.put("release_notice_id", IDUtil.get32UUID());
							releaseNoticeMap.put("title", "");
							releaseNoticeMap.put("text", "");
							releaseNoticeMap.put("release_notice_createuid", "");
							releaseNoticeMap.put("release_notice_createtime", "");
							releaseNoticeMap.put("release_notice_updatetime", "");
	                releaseNoticeService.saveList(POIUtil.readExcelToMap(mfile.getInputStream(),mfile.getName(),releaseNoticeMap),releaseNoticeMap);
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
		logger.info("start----------------删除releaseNotice");
		Map<String,Object> releaseNotice = RequestUtil.getParameterMap(logger);
		try{
			releaseNoticeService.delete(releaseNotice);
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
		logger.info("start----------------修改releaseNotice");
		Map<String,Object> releaseNotice = RequestUtil.getParameterMap(logger);
		releaseNotice.put("release_notice_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
	    releaseNotice.put("release_notice_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
		releaseNoticeService.updateById(releaseNotice);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","success");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("release/notice/releasenotice_list");
		return mv;
	}
	
	/**
	 *  后台列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表releaseNotice");
		Map<String,Object> releaseNotice = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				releaseNotice.put(conditionName,conditionValue);
			}
			List<Object> varList = releaseNoticeService.pageList(releaseNotice);	//列出releaseNotice列表
			mv.addObject("varList", varList);
			mv.addObject("releaseNotice", releaseNotice);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("release/notice/releasenotice_list");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 *  前端列表
	 */
	@RequestMapping(value="/frontList")
	public ModelAndView frontList(String orderByClause, String paneltitle){
		logger.info("start----------------列表releaseNotice");
		Map<String,Object> releaseNotice = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			List<Object> varList = releaseNoticeService.pageList(releaseNotice);	//列出releaseNotice列表
			mv.addObject("varList", varList);
			mv.addObject("releaseNotice", releaseNotice);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("release/notice/release_notice");
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
		logger.info("start----------------列表releaseNotice");
		Map<String,Object> releaseNotice = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				releaseNotice.put(conditionName,conditionValue);
			}
			List<Object> varList = releaseNoticeService.pageList(releaseNotice);	//列出releaseNotice列表
			mv.addObject("varList", varList);
			mv.addObject("releaseNotice", releaseNotice);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("release/notice/releasenotice_list_tree");
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
		logger.info("start----------------列表releaseNotice");
		Map<String,Object> releaseNotice = RequestUtil.getParameterMap(logger);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				releaseNotice.put(conditionName,conditionValue);
			}
			List<Object> varList = releaseNoticeService.pageList(releaseNotice);	//列出releaseNotice列表
			resultMap.put("varList", varList);
			resultMap.put("releaseNotice", releaseNotice);
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
		logger.info("start----------------去新增releaseNotice页面");
		Map<String,Object> releaseNotice = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("releaseNotice", releaseNotice);
		mv.addObject("dict", dictUtils.getDictByTable("release_notice"));
		mv.setViewName("release/notice/releasenotice_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(String paneltitle){
		logger.info("start----------------去修改releaseNotice页面");
		Map<String,Object> releaseNotice = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("releaseNotice", releaseNoticeService.find(releaseNotice));
			
			mv.addObject("dict", dictUtils.getDictByTable("release_notice"));
			mv.setViewName("release/notice/releasenotice_edit_dialog");
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
		logger.info("start----------------批量删除releaseNotice");
		Map<String,Object> releaseNotice = RequestUtil.getParameterMap(logger);
		try {
			releaseNoticeService.delete(releaseNotice);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除releaseNotice");
		}
		return ResponseUtil.resultMap(1, "success");
	}

	/**
	 * 首页列表
	 */
	@RequestMapping(value="/news")
	public ModelAndView news(String paneltitle){
		logger.info("start----------------列表companyNews");
		Map<String,Object> companyNews = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			List<Object> varList = releaseNoticeService.pageList(companyNews);	//列出companyNews列表
			mv.addObject("varList", varList);
			mv.addObject("companyNews", companyNews);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("release/notice/releasenotice_index");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 详情
	 */
	@RequestMapping(value="/details")
	public ModelAndView details(String release_notice_id) throws Exception{
		logger.info("start----------------修改companyNews");
		Map<String,Object> companyNews = RequestUtil.getParameterMap(logger);
		companyNews.put("release_notice_id", release_notice_id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("releaseNoticeInfo",releaseNoticeService.find(companyNews));
		mv.addObject("varList",releaseNoticeService.list(null));
		mv.setViewName("release/notice/release_contents");
		return mv;
	}
}
