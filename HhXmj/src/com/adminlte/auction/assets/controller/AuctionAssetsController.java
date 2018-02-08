package com.adminlte.auction.assets.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.xml.crypto.Data;

import com.adminlte.auction.dict.service.DictAssetsService;
import com.adminlte.auction.listing.service.AuctionListingService;
import com.adminlte.auction.overview.service.AuctionOverviewService;
import com.adminlte.auction.price.service.AuctionPriceService;
import com.adminlte.auction.site.service.BondSiteService;
import com.adminlte.sys.dict.service.SysDictService;
import com.adminlte.utils.*;

import org.apache.commons.collections4.map.HashedMap;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.adminlte.auction.assets.service.AuctionAssetsService;


/** 
 * 类名称：auctionAssetsController
 * 创建人：Cheng
 * 创建时间：2017-09-14
 */
@Controller
@RequestMapping(value="/auction/assets")
public class AuctionAssetsController{
	private Log logger = LogFactory.getLog(AuctionAssetsController.class);
	@Resource(name="auctionAssetsService")
	private AuctionAssetsService auctionAssetsService;
	//挂牌信息
	@Resource(name="auctionListingService")
	private AuctionListingService auctionListingService;
	//项目概况信息
	@Resource(name="auctionOverviewService")
	private AuctionOverviewService auctionOverviewService;
	@Resource(name="auctionPriceService")
	private AuctionPriceService auctionPriceService;
	@Resource(name="dictAssetsService")
	private DictAssetsService dictAssetsService;

	@Resource(name = "dictUtils")
	private DictUtils dictUtils;
	//换成全国的地址
	@Resource(name="bondSiteService")
	private BondSiteService bondSiteService;

	@RequestMapping(value="/index")
	public ModelAndView toindex()throws Exception{
		logger.info("start----------------跳转到发布页面");
		ModelAndView mv = new ModelAndView();
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		if (ShiroUtils.getCurrentUser() != null) {
			dictAssets.put("dict_assets_state", "0");
			bondSite.put("bond_site_pid", "0");
			bondSite.put("bond_site_state", "0");
			List<Object> dictList = dictAssetsService.list(dictAssets);
			List<Object> siteList = bondSiteService.list(bondSite);//列出bondDisposal列表
			mv.addObject("siteList",siteList);
			mv.addObject("dictList", dictList);
			mv.addObject("bondSite",bondSite);
			mv.setViewName("sys/kj/user/publish");
		}else {
			mv.setViewName("sys/kj/login/login");
		}

		return mv;
	}

	@RequestMapping(value="/disposal")
	public ModelAndView disposal(String id)throws Exception{
		logger.info("start----------------详情auctionAssets");
		Map<String,Object> auctionAssets = RequestUtil.getParameterMap(logger);
		auctionAssets.put("auction_assets_id", id);
		List<Object> priceMap = auctionPriceService.list(auctionAssets);
		Map<String, Object> resultMap;
		if (priceMap.size() > 0) {
			resultMap = auctionAssetsService.findByMap(auctionAssets);
		}else {
			resultMap = auctionAssetsService.find(auctionAssets);
		}
		Map<String,Object> sysUser = (Map<String, Object>) ShiroUtils.getAttr("currentUser");
		ModelAndView mv = new ModelAndView();
		if (sysUser != null)mv.addObject("sys_user_name", sysUser.get("sys_user_name"));
		mv.addObject("resultMap", resultMap);
		mv.setViewName("sys/kj/disposal");
		return mv;
	}

	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public ModelAndView save(HttpServletRequest request) throws Exception{
		logger.info("start----------------新增auctionAssets");
		Map<String,Object> auctionAssets = RequestUtil.getParameterMap(logger);

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("auction_assets_img");
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy/MM/dd/HH");
		String logoPathDir = "files/"+ dateformat.format(new Date());
		String logoRealPathDir = request.getSession().getServletContext().getRealPath(logoPathDir);
		File logoSaveFile = new File(logoRealPathDir);
		if(!logoSaveFile.exists()) logoSaveFile.mkdirs();
		String suffix = multipartFile.getOriginalFilename().substring (multipartFile.getOriginalFilename().lastIndexOf("."));
		String logImageName = UUID.randomUUID().toString()+ suffix;
		String fileName = logoRealPathDir + File.separator + logImageName;
		File file = new File(fileName);
		try {
			multipartFile.transferTo(file);
		}catch (IOException e){
			e.printStackTrace();
		}
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String auction_listing_start_time = multipartRequest.getParameter("auction_listing_start_time");
		String auction_listing_end_time = multipartRequest.getParameter("auction_listing_end_time");

		Date startDate = sdf.parse(auction_listing_start_time);
		Date endDate = sdf.parse(auction_listing_end_time);

		SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyyMMddHHmmss");
		String auction_project_number = "B0" + dateformat1.format(new Date());
		auctionAssets.put("auction_assets_id", multipartRequest.getParameter("auction_assets_id"));
		auctionAssets.put("auction_project_name", multipartRequest.getParameter("auction_project_name"));
		auctionAssets.put("auction_product_solutions", multipartRequest.getParameter("auction_product_solutions"));
		auctionAssets.put("auction_project_number", auction_project_number);
		auctionAssets.put("auction_classify", multipartRequest.getParameter("auction_classify"));
		auctionAssets.put("auction_bail", multipartRequest.getParameter("auction_bail"));
		auctionAssets.put("auction_location", multipartRequest.getParameter("auction_location"));

		auctionAssets.put("auction_starting_price", multipartRequest.getParameter("auction_starting_price"));
		auctionAssets.put("auction_fare_increase", multipartRequest.getParameter("auction_fare_increase"));
		auctionAssets.put("auction_listing_start_time", auction_listing_start_time);
		auctionAssets.put("auction_listing_end_time", auction_listing_end_time);
		auctionAssets.put("auction_bidding_cycle", DataUtils.daysBetween(startDate,endDate));

		auctionAssets.put("auction_project_announcement", multipartRequest.getParameter("auction_project_announcement"));
		auctionAssets.put("auction_contacts", multipartRequest.getParameter("auction_contacts"));
		auctionAssets.put("auction_contact_number", multipartRequest.getParameter("auction_contact_number"));
		auctionAssets.put("auction_verify", 1);
		auctionAssets.put("auction_assets_img", logoPathDir + File.separator + logImageName);

		/****以上为基础信息表***/

		auctionAssets.put("auction_overview_id", IDUtil.get32UUID());
		auctionAssets.put("auction_transaction_type", multipartRequest.getParameter("auction_transaction_type"));
		auctionAssets.put("auction_ownership_amount", multipartRequest.getParameter("auction_ownership_amount"));
		auctionAssets.put("auction_target_asset_name", multipartRequest.getParameter("auction_target_asset_name"));
		auctionAssets.put("auction_target_enterprise_nature", multipartRequest.getParameter("auction_target_enterprise_nature"));
		auctionAssets.put("auction_industry", multipartRequest.getParameter("auction_industry"));
		auctionAssets.put("auction_law_firm", multipartRequest.getParameter("auction_law_firm"));

		/****以上为概览信息表***/

		auctionAssets.put("auction_listing_id", IDUtil.get32UUID());
		auctionAssets.put("auction_creditor_capital", multipartRequest.getParameter("auction_creditor_capital"));
		auctionAssets.put("auction_pledge_capital", multipartRequest.getParameter("auction_pledge_capital"));
		auctionAssets.put("auction_mortgage_capital", multipartRequest.getParameter("auction_mortgage_capital"));
		auctionAssets.put("auction_impawn_capital", multipartRequest.getParameter("auction_impawn_capital"));

		auctionAssets.put("auction_creditor_interest", multipartRequest.getParameter("auction_creditor_interest"));
		auctionAssets.put("auction_creditor_yield", multipartRequest.getParameter("auction_creditor_yield"));
		auctionAssets.put("auction_real_right", multipartRequest.getParameter("auction_real_right"));
		auctionAssets.put("auction_stock_right", multipartRequest.getParameter("auction_stock_right"));
		auctionAssets.put("auction_major_issues", multipartRequest.getParameter("auction_major_issues"));

		/****以上为挂牌信息表***/
		if(StringUtils.isEmpty(auctionAssets.get("auction_assets_id").toString())){
			auctionAssets.put("auction_assets_id", IDUtil.get32UUID());
			auctionAssets.put("auction_assets_createtime", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			auctionAssets.put("auction_assets_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			auctionAssetsService.save(auctionAssets);
			auctionOverviewService.save(auctionAssets);
			auctionListingService.save(auctionAssets);
		}else{
			auctionAssets.put("auction_assets_updatetime", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		    auctionAssets.put("auction_assets_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			auctionAssetsService.updateById(auctionAssets);
			auctionOverviewService.updateById(auctionAssets);
			auctionListingService.updateById(auctionAssets);
		}
		
		return new ModelAndView("sys/kj/checking");
	}
	/**
	 * 上传
	 */
	@RequestMapping("/upload") 
	@ResponseBody
	public String upload(@RequestParam(value="files[]", required=false) MultipartFile[] files,String auctionAssetsId){
		String path = PathUtil.getWebPath()+"upload/";
		try {
			for(MultipartFile mfile : files){
	            if (!mfile.isEmpty()) {
                	Map<String,Object> auctionAssetsMap = new HashMap<String,Object>();
							auctionAssetsMap.put("auction_assets_id", "");
							auctionAssetsMap.put("auction_project_name", "");
							auctionAssetsMap.put("auction_project_number", "");
							auctionAssetsMap.put("auction_product solutions", "");
							auctionAssetsMap.put("auction_classify", "");
							auctionAssetsMap.put("auction_bail", "");
							auctionAssetsMap.put("auction_bidding_cycle", "");
							auctionAssetsMap.put("auction_location", "");
							auctionAssetsMap.put("auction_starting_price", "");
							auctionAssetsMap.put("auction_fare_increase", "");
							auctionAssetsMap.put("auction_listing_start_time", "");
							auctionAssetsMap.put("auction_listing_end_time", "");
							auctionAssetsMap.put("auction_project_announcement", "");
							auctionAssetsMap.put("auction_contacts", "");
							auctionAssetsMap.put("auction_contact_number", "");
							auctionAssetsMap.put("auction_verify", "");
							auctionAssetsMap.put("auction_assets_createuid", "");
							auctionAssetsMap.put("auction_assets_createtime", "");
							auctionAssetsMap.put("auction_assets_updatetime", "");
	                auctionAssetsService.saveList(POIUtil.readExcelToMap(mfile.getInputStream(),mfile.getName(),auctionAssetsMap),auctionAssetsMap);
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
		logger.info("start----------------删除auctionAssets");
		Map<String,Object> auctionAssets = RequestUtil.getParameterMap(logger);
		try{
			auctionAssetsService.delete(auctionAssets);
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
		logger.info("start----------------修改auctionAssets");
		Map<String,Object> auctionAssets = RequestUtil.getParameterMap(logger);
		auctionAssets.put("auction_assets_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
	    auctionAssets.put("auction_assets_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
		auctionAssetsService.updateById(auctionAssets);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","成功");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("auction/assets/auctionassets_list");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表auctionAssets");
		Map<String,Object> auctionAssets = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				auctionAssets.put(conditionName,conditionValue);
			}
			auctionAssets.put("auction_verify","2");
			List<Object> varList = auctionAssetsService.pageList(auctionAssets);	//列出auctionAssets列表
			mv.addObject("varList", varList);
			mv.addObject("auctionAssets", auctionAssets);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/kj/Asset_auction");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}


	@RequestMapping(value="/list1")
	public ModelAndView list1(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表auctionAssets");
		Map<String,Object> auctionAssets = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)&&!conditionName.equals("allSearch")){
				Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
				dictAssets.put("dict_assets_pid", conditionName);
				dictAssets.put("dict_assets_name", conditionValue);
				Map<String, Object> conditionMap = dictAssetsService.find(dictAssets);
				auctionAssets.put(conditionName,conditionMap.get("dict_assets_key").toString());
			}else{
				auctionAssets.put(conditionName,conditionValue);
			}
			auctionAssets.put("auction_verify","2");
			List<Object> varList = auctionAssetsService.pageList(auctionAssets);	//列出auctionAssets列表
			mv.addObject("varList", varList);
			mv.addObject("auctionAssets", auctionAssets);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("dict", dictUtils.getDictByTable("sys_goods"));
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/kj/asset_aution_list");
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
		logger.info("start----------------列表auctionAssets");
		Map<String,Object> auctionAssets = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				auctionAssets.put(conditionName,conditionValue);
			}
			List<Object> varList = auctionAssetsService.pageList(auctionAssets);	//列出auctionAssets列表
			mv.addObject("varList", varList);
			mv.addObject("auctionAssets", auctionAssets);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("auction/assets/auctionassets_list_tree");
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
		logger.info("start----------------列表auctionAssets");
		Map<String,Object> auctionAssets = RequestUtil.getParameterMap(logger);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				auctionAssets.put(conditionName,conditionValue);
			}
			List<Object> varList = auctionAssetsService.pageList(auctionAssets);	//列出auctionAssets列表
			resultMap.put("varList", varList);
			resultMap.put("auctionAssets", auctionAssets);
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
		logger.info("start----------------去新增auctionAssets页面");
		Map<String,Object> auctionAssets = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("auctionAssets", auctionAssets);
		mv.addObject("dict", dictUtils.getDictByTable("auction_assets"));
		mv.setViewName("auction/assets/auctionassets_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(String id){
		logger.info("start----------------去修改auctionAssets页面");
		Map<String,Object> auctionAssets = RequestUtil.getParameterMap(logger);
		auctionAssets.put("auction_assets_id", id);
		ModelAndView mv = new ModelAndView();
		try {
			Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
			dictAssets.put("dict_assets_state", "0");
			List<Object> dictList = dictAssetsService.list(dictAssets);
			mv.addObject("dictList", dictList);
			mv.addObject("auction_assets_id", id);
			mv.addObject("auctionAssets", auctionAssetsService.find(auctionAssets));
			mv.addObject("dict", dictUtils.getDictByTable("auction_assets"));
			mv.setViewName("sys/kj/user/publish_edit");
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
		logger.info("start----------------批量删除auctionAssets");
		Map<String,Object> auctionAssets = RequestUtil.getParameterMap(logger);
		try {
			auctionAssetsService.delete(auctionAssets);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除auctionAssets");
		}
		return ResponseUtil.resultMap(1, "成功");
	}
}
