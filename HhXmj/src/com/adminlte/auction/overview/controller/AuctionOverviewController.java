package com.adminlte.auction.overview.controller;

import com.adminlte.auction.assets.service.AuctionAssetsService;
import com.adminlte.auction.overview.service.AuctionOverviewService;
import com.adminlte.utils.*;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
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

import javax.annotation.Resource;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;


/** 
 * 类名称：auctionOverviewController
 * 创建人：Cheng
 * 创建时间：2017-09-15
 */
@Controller
@RequestMapping(value="auction/overview")
public class AuctionOverviewController {
	private Log logger = LogFactory.getLog(AuctionOverviewController.class);
	@Resource(name="auctionOverviewService")
	private AuctionOverviewService auctionOverviewService;
	@Resource(name="auctionAssetsService")
	private AuctionAssetsService auctionAssetsService;
	@Resource(name = "dictUtils")
	private DictUtils dictUtils;
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save() throws Exception{
		logger.info("start----------------新增auctionOverview");
		Map<String,Object> auctionOverview = RequestUtil.getParameterMap(logger);
		if(StringUtils.isEmpty(auctionOverview.get("auction_overview_id").toString())){
			auctionOverview.put("auction_overview_id", IDUtil.get32UUID());
			auctionOverview.put("auction_overview_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			auctionOverview.put("auction_overview_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			auctionOverviewService.save(auctionOverview);
		}else{
			auctionOverview.put("auction_overview_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    auctionOverview.put("auction_overview_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			auctionOverviewService.updateById(auctionOverview);
		}
		
		return ResponseUtil.resultMap(1, "成功");
	}
	/**
	 * 上传
	 */
	@RequestMapping("/upload") 
	@ResponseBody
	public String upload(@RequestParam(value="files[]", required=false) MultipartFile[] files,String auctionOverviewId){
		String path = PathUtil.getWebPath()+"upload/";
		try {
			for(MultipartFile mfile : files){
	            if (!mfile.isEmpty()) {
                	Map<String,Object> auctionOverviewMap = new HashMap<String,Object>();
	                	 	auctionOverviewMap.put("auction_overview_id", IDUtil.get32UUID());
							auctionOverviewMap.put("auction_ownership_amount", "");
							auctionOverviewMap.put("auction_assets_id", "");
							auctionOverviewMap.put("auction_transaction_type", "");
							auctionOverviewMap.put("auction_target_asset_name", "");
							auctionOverviewMap.put("auction_target_enterprise_nature", "");
							auctionOverviewMap.put("auction_industry", "");
							auctionOverviewMap.put("auction_law_firm", "");
	                auctionOverviewService.saveList(POIUtil.readExcelToMap(mfile.getInputStream(),mfile.getName(),auctionOverviewMap),auctionOverviewMap);
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
		logger.info("start----------------删除auctionOverview");
		Map<String,Object> auctionOverview = RequestUtil.getParameterMap(logger);
		try{
			auctionOverviewService.delete(auctionOverview);
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
		logger.info("start----------------修改auctionOverview");
		Map<String,Object> auctionOverview = RequestUtil.getParameterMap(logger);
		auctionOverview.put("auction_overview_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
	    auctionOverview.put("auction_overview_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
		auctionOverviewService.updateById(auctionOverview);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","成功");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("auction/overview/auctionoverview_list");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表auctionOverview");
		Map<String,Object> auctionOverview = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				auctionOverview.put(conditionName,conditionValue);
			}
			List<Object> varList = auctionOverviewService.pageList(auctionOverview);	//列出auctionOverview列表
			mv.addObject("varList", varList);
			mv.addObject("auctionOverview", auctionOverview);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("auction/overview/auctionoverview_list");
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
		logger.info("start----------------列表auctionOverview");
		Map<String,Object> auctionOverview = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				auctionOverview.put(conditionName,conditionValue);
			}
			List<Object> varList = auctionOverviewService.pageList(auctionOverview);	//列出auctionOverview列表
			mv.addObject("varList", varList);
			mv.addObject("auctionOverview", auctionOverview);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("auction/overview/auctionoverview_list_tree");
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
		logger.info("start----------------列表auctionOverview");
		Map<String,Object> auctionOverview = RequestUtil.getParameterMap(logger);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				auctionOverview.put(conditionName,conditionValue);
			}
			List<Object> varList = auctionOverviewService.pageList(auctionOverview);	//列出auctionOverview列表
			resultMap.put("varList", varList);
			resultMap.put("auctionOverview", auctionOverview);
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
		logger.info("start----------------去新增auctionOverview页面");
		Map<String,Object> auctionOverview = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("auctionOverview", auctionOverview);
		mv.addObject("dict", dictUtils.getDictByTable("auction_overview"));
		mv.setViewName("auction/overview/auctionoverview_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(String paneltitle){
		logger.info("start----------------去修改auctionOverview页面");
		Map<String,Object> auctionOverview = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("auctionOverview", auctionOverviewService.find(auctionOverview));

			mv.addObject("dict", dictUtils.getDictByTable("auction_overview"));
			mv.setViewName("auction/overview/auctionoverview_edit_dialog");
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
		logger.info("start----------------批量删除auctionOverview");
		Map<String,Object> auctionOverview = RequestUtil.getParameterMap(logger);
		try {
			auctionOverviewService.delete(auctionOverview);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除auctionOverview");
		}
		return ResponseUtil.resultMap(1, "成功");
	}
}
