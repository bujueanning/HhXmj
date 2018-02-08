package com.adminlte.sys.buy.controller;

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
import com.adminlte.sys.buy.service.SysBuyService;
import com.adminlte.utils.DictUtils;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.POIUtil;
import com.adminlte.utils.PathUtil;
import com.adminlte.utils.RequestUtil;
import com.adminlte.utils.ResponseUtil;
import com.adminlte.utils.ShiroUtils;


/** 
 * 类名称：sysBuyController
 * 创建人：Cheng
 * 创建时间：2017-08-21
 */
@Controller
@RequestMapping(value="sys/buy")
public class SysBuyController{
	private Log logger = LogFactory.getLog(SysBuyController.class);
	@Resource(name="sysBuyService")
	private SysBuyService sysBuyService;
	@Resource(name = "dictUtils")
	private DictUtils dictUtils;
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save() throws Exception{
		logger.info("start----------------新增sysBuy");
		Map<String,Object> sysBuy = RequestUtil.getParameterMap(logger);
		if(StringUtils.isEmpty(sysBuy.get("sys_buy_id").toString())){
			sysBuy.put("sys_buy_id", IDUtil.get32UUID());
			sysBuy.put("sys_buy_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			sysBuy.put("sys_buy_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			sysBuyService.save(sysBuy);
		}else{
			sysBuy.put("sys_buy_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    sysBuy.put("sys_buy_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			sysBuyService.updateById(sysBuy);
		}
		
		return ResponseUtil.resultMap(1, "成功");
	}
	/**
	 * 上传
	 */
	@RequestMapping("/upload") 
	@ResponseBody
	public String upload(@RequestParam(value="files[]", required=false) MultipartFile[] files,String sysBuyId){
		String path = PathUtil.getWebPath()+"upload/";
		try {
			for(MultipartFile mfile : files){
	            if (!mfile.isEmpty()) {
                	Map<String,Object> sysBuyMap = new HashMap<String,Object>();
	                	 	sysBuyMap.put("sys_buy_id", IDUtil.get32UUID());
							sysBuyMap.put("sys_user_id", "");
							sysBuyMap.put("sys_goods_id", "");
							sysBuyMap.put("sys_buy_price", "");
							sysBuyMap.put("sys_buy_count", "");
							sysBuyMap.put("sys_buy_time", "");
							sysBuyMap.put("sys_buy_succ_d", "");
							sysBuyMap.put("sys_buy_createdate", "");
							sysBuyMap.put("sys_buy_updatedate", "");
							sysBuyMap.put("sys_buy_createuid", "");
							sysBuyMap.put("sys_buy_updateuid", "");
	                sysBuyService.saveList(POIUtil.readExcelToMap(mfile.getInputStream(),mfile.getName(),sysBuyMap),sysBuyMap);
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
		logger.info("start----------------删除sysBuy");
		Map<String,Object> sysBuy = RequestUtil.getParameterMap(logger);
		try{
			sysBuyService.delete(sysBuy);
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
		logger.info("start----------------修改sysBuy");
		Map<String,Object> sysBuy = RequestUtil.getParameterMap(logger);
		sysBuy.put("sys_buy_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
	    sysBuy.put("sys_buy_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
		sysBuyService.updateById(sysBuy);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","成功");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("sys/buy/sysbuy_list");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表sysBuy");
		Map<String,Object> sysBuy = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				sysBuy.put(conditionName,conditionValue);
			}
			List<Object> varList = sysBuyService.pageList(sysBuy);	//列出sysBuy列表
			mv.addObject("varList", varList);
			mv.addObject("sysBuy", sysBuy);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/buy/sysbuy_list");
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
		logger.info("start----------------列表sysBuy");
		Map<String,Object> sysBuy = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				sysBuy.put(conditionName,conditionValue);
			}
			List<Object> varList = sysBuyService.pageList(sysBuy);	//列出sysBuy列表
			mv.addObject("varList", varList);
			mv.addObject("sysBuy", sysBuy);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/buy/sysbuy_list_tree");
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
		logger.info("start----------------列表sysBuy");
		Map<String,Object> sysBuy = RequestUtil.getParameterMap(logger);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				sysBuy.put(conditionName,conditionValue);
			}
			List<Object> varList = sysBuyService.pageList(sysBuy);	//列出sysBuy列表
			resultMap.put("varList", varList);
			resultMap.put("sysBuy", sysBuy);
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
		logger.info("start----------------去新增sysBuy页面");
		Map<String,Object> sysBuy = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("sysBuy", sysBuy);
		mv.addObject("dict", dictUtils.getDictByTable("sys_buy"));
		mv.setViewName("sys/buy/sysbuy_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(String paneltitle){
		logger.info("start----------------去修改sysBuy页面");
		Map<String,Object> sysBuy = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("sysBuy", sysBuyService.find(sysBuy));
			
			mv.addObject("dict", dictUtils.getDictByTable("sys_buy"));
			mv.setViewName("sys/buy/sysbuy_edit_dialog");
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
		logger.info("start----------------批量删除sysBuy");
		Map<String,Object> sysBuy = RequestUtil.getParameterMap(logger);
		try {
			sysBuyService.delete(sysBuy);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除sysBuy");
		}
		return ResponseUtil.resultMap(1, "成功");
	}
}
