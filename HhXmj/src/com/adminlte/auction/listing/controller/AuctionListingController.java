package com.adminlte.auction.listing.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.adminlte.auction.assets.service.AuctionAssetsService;
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
import com.adminlte.auction.listing.service.AuctionListingService;
import com.adminlte.utils.DictUtils;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.POIUtil;
import com.adminlte.utils.PathUtil;
import com.adminlte.utils.RequestUtil;
import com.adminlte.utils.ResponseUtil;
import com.adminlte.utils.ShiroUtils;


/** 
 * 类名称：auctionListingController
 * 创建人：Cheng
 * 创建时间：2017-09-14
 */
@Controller
@RequestMapping(value="auction/listing")
public class AuctionListingController{
	private Log logger = LogFactory.getLog(AuctionListingController.class);
	@Resource(name="auctionListingService")
	private AuctionListingService auctionListingService;
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
		logger.info("start----------------新增auctionListing");
		Map<String,Object> auctionListing = RequestUtil.getParameterMap(logger);
		if(StringUtils.isEmpty(auctionListing.get("auction_listing_id").toString())){
			auctionListing.put("auction_listing_id", IDUtil.get32UUID());
			auctionListing.put("auction_listing_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			auctionListing.put("auction_listing_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			auctionListingService.save(auctionListing);
		}else{
			auctionListing.put("auction_listing_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    auctionListing.put("auction_listing_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			auctionListingService.updateById(auctionListing);
		}
		
		return ResponseUtil.resultMap(1, "成功");
	}
	/**
	 * 上传
	 */
	@RequestMapping("/upload") 
	@ResponseBody
	public String upload(@RequestParam(value="files[]", required=false) MultipartFile[] files,String auctionListingId){
		String path = PathUtil.getWebPath()+"upload/";
		try {
			for(MultipartFile mfile : files){
	            if (!mfile.isEmpty()) {
                	Map<String,Object> auctionListingMap = new HashMap<String,Object>();
	                	 	auctionListingMap.put("auction_listing_id", IDUtil.get32UUID());
							auctionListingMap.put("auction_assets_id", "");
							auctionListingMap.put("auction_creditor_capital", "");
							auctionListingMap.put("auction_pledge_capital", "");
							auctionListingMap.put("auction_mortgage_capital", "");
							auctionListingMap.put("auction_impawn_capital", "");
							auctionListingMap.put("auction_creditor_interest", "");
							auctionListingMap.put("auction_creditor_yield", "");
							auctionListingMap.put("auction_real_right", "");
							auctionListingMap.put("auction_stock_right", "");
							auctionListingMap.put("auction_major_issues", "");
	                auctionListingService.saveList(POIUtil.readExcelToMap(mfile.getInputStream(),mfile.getName(),auctionListingMap),auctionListingMap);
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
		logger.info("start----------------删除auctionListing");
		Map<String,Object> auctionListing = RequestUtil.getParameterMap(logger);
		try{
			auctionListingService.delete(auctionListing);
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
		logger.info("start----------------修改auctionListing");
		Map<String,Object> auctionListing = RequestUtil.getParameterMap(logger);
		auctionListing.put("auction_listing_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
	    auctionListing.put("auction_listing_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
		auctionListingService.updateById(auctionListing);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","成功");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("auction/listing/auctionlisting_list");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表auctionListing");
		Map<String,Object> auctionListing = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				auctionListing.put(conditionName,conditionValue);
			}
			List<Object> varList = auctionListingService.pageList(auctionListing);	//列出auctionListing列表
			mv.addObject("varList", varList);
			mv.addObject("auctionListing", auctionListing);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("auction/listing/auctionlisting_list");
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
		logger.info("start----------------列表auctionListing");
		Map<String,Object> auctionListing = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				auctionListing.put(conditionName,conditionValue);
			}
			List<Object> varList = auctionListingService.pageList(auctionListing);	//列出auctionListing列表
			mv.addObject("varList", varList);
			mv.addObject("auctionListing", auctionListing);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("auction/listing/auctionlisting_list_tree");
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
		logger.info("start----------------列表auctionListing");
		Map<String,Object> auctionListing = RequestUtil.getParameterMap(logger);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				auctionListing.put(conditionName,conditionValue);
			}
			List<Object> varList = auctionListingService.pageList(auctionListing);	//列出auctionListing列表
			resultMap.put("varList", varList);
			resultMap.put("auctionListing", auctionListing);
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
		logger.info("start----------------去新增auctionListing页面");
		Map<String,Object> auctionListing = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("auctionListing", auctionListing);
		mv.addObject("dict", dictUtils.getDictByTable("auction_listing"));
		mv.setViewName("auction/listing/auctionlisting_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(String paneltitle){
		logger.info("start----------------去修改auctionListing页面");
		Map<String,Object> auctionListing = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("auctionListing", auctionListingService.find(auctionListing));

			mv.addObject("dict", dictUtils.getDictByTable("auction_listing"));
			mv.setViewName("auction/listing/auctionlisting_edit_dialog");
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
		logger.info("start----------------批量删除auctionListing");
		Map<String,Object> auctionListing = RequestUtil.getParameterMap(logger);
		try {
			auctionListingService.delete(auctionListing);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除auctionListing");
		}
		return ResponseUtil.resultMap(1, "成功");
	}
}
