package com.adminlte.sys.bond.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.adminlte.auction.accept.service.BondAcceptService;
import com.adminlte.auction.bond.service.BondDisposalService;
import com.adminlte.auction.dict.service.DictAssetsService;
import com.adminlte.auction.listing.service.AuctionListingService;
import com.adminlte.auction.overview.service.AuctionOverviewService;
import com.adminlte.auction.price.service.AuctionPriceService;
import com.adminlte.auction.sheet.service.BondSheetService;
import com.adminlte.auction.site.service.BondSiteService;
import com.adminlte.utils.*;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.adminlte.sys.goods.service.SysGoodsService;
import com.adminlte.sys.user.service.SysUserService;


/** 
 * 类名称：sysBondController
 * 创建人：Jiao
 * 创建时间：2017-10-31
 */
@Controller
@RequestMapping(value="sys/bond")
public class SysBondController{
	private Log logger = LogFactory.getLog(SysBondController.class);
	@Resource(name="sysGoodsService")
	private SysGoodsService sysGoodsService;
	@Resource(name = "dictUtils")
	private DictUtils dictUtils;
	@Resource(name="bondSheetService")
	private BondSheetService bondSheetService;
	@Resource(name="bondAcceptService")
	private BondAcceptService bondAcceptService;

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
	@Resource(name="bondDisposalService")
	private BondDisposalService bondDisposalService;
	@Resource(name="bondSiteService")
	private BondSiteService bondSiteService;
	@Resource(name="sysUserService")
	private SysUserService sysUserService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public ModelAndView save(HttpServletRequest request) throws Exception{
		logger.info("start----------------新增bondDisposal");
		
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		/*
		 * 上传附件
		 */
		MultipartFile mr = multipartRequest.getFile("bond_disposal_accessory");
		String filePathDir = null;
		String accFileName =null;
		String fileNames =null;
		String path =null;
		 // 判断文件是否为空  
        if (!mr.isEmpty()) {  
        	 fileNames=mr.getOriginalFilename();
        	System.out.println("他们说是文件名："+fileNames);
        	//获取文件存放路径
             path = request.getSession().getServletContext().getRealPath("").concat("/uploadFile");
           // String path = getUploadPath(fileName,request);
            //上传文件
            File targetFile = new File(path, fileNames);
            if(!targetFile.exists()){
                targetFile.mkdirs();
            }
            //保存
            try {
                mr.transferTo(targetFile);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }  
		String logoPathDir = null;
		String logImageName =null;
		/*
		 * 上传图片的创建
		 * */
		
		MultipartFile multipartFile = multipartRequest.getFile("bond_disposal_img");
		if(!multipartFile.isEmpty()){
			SimpleDateFormat dateformat = new SimpleDateFormat("yyyy/MM/dd/HH");
		    logoPathDir = "files/"+ dateformat.format(new Date());
			String logoRealPathDir = request.getSession().getServletContext().getRealPath(logoPathDir);
			File logoSaveFile = new File(logoRealPathDir);
			if(!logoSaveFile.exists()) logoSaveFile.mkdirs();
			String suffix = multipartFile.getOriginalFilename().substring (multipartFile.getOriginalFilename().lastIndexOf("."));
			logImageName = UUID.randomUUID().toString()+ suffix;
			String fileName = logoRealPathDir + File.separator + logImageName;
			File file = new File(fileName);
			try {
				multipartFile.transferTo(file);
			}catch (IOException e){
				e.printStackTrace();
			}
			
		}
		
		
		System.out.println("程序走到了这里但是没有获得值");
		
		
		
		bondDisposal.put("bond_disposal_id", multipartRequest.getParameter("bond_disposal_id"));
		bondDisposal.put("bond_company_name", multipartRequest.getParameter("bond_company_name"));//企业名称
		bondDisposal.put("bond_asset_number", multipartRequest.getParameter("bond_asset_number"));//资产编号
		bondDisposal.put("bond_disposal_arrears", multipartRequest.getParameter("bond_disposal_arrears"));//欠款
		String bond_transfer_ratio = new String(multipartRequest.getParameter("bond_transfer_ratio"));
		System.out.println("追踪拼接字符串");
		if(bond_transfer_ratio.indexOf("%")<0){
			StringBuilder sb = new StringBuilder(bond_transfer_ratio);
			System.out.println("存在%是进不来的:"+sb);
			sb.append("%");
			bond_transfer_ratio=sb.toString();
		}else{
			System.out.println("存在多个%:"+bond_transfer_ratio);
			String ratio = bond_transfer_ratio.replace("%", "").trim();
			StringBuilder sb = new StringBuilder(ratio);
			sb.append("%");
			bond_transfer_ratio=sb.toString();
		}
		bondDisposal.put("bond_transfer_ratio", bond_transfer_ratio);//转让比例
		//bondDisposal.put("bond_disposal_state", "1");//状态:1_待签约,2_已发布
		bondDisposal.put("bond_release_time", multipartRequest.getParameter("bond_release_time"));//发布时间
		bondDisposal.put("bond_product_solutions", multipartRequest.getParameter("bond_product_solutions"));//产品类:1_金融国资,2_不良资产,3_非国有资产,4_招商
		bondDisposal.put("bond_ownership_amount", multipartRequest.getParameter("bond_ownership_amount"));//权属金额
		bondDisposal.put("bond_classify", multipartRequest.getParameter("bond_classify"));//状态:1_处置方接单,2_处置方竞单
		bondDisposal.put("bond_location", multipartRequest.getParameter("bond_location"));//债权人的地址
		bondDisposal.put("bond_debt_location", multipartRequest.getParameter("bond_debt_location"));//债务人的地址
		bondDisposal.put("bond_contacts", multipartRequest.getParameter("bond_contacts"));//联系人
		bondDisposal.put("bond_contact_number", multipartRequest.getParameter("bond_contact_number"));//联系人电话
		bondDisposal.put("bond_overdue",  multipartRequest.getParameter("bond_overdue"));//逾期时间
		bondDisposal.put("bond_case", multipartRequest.getParameter("bond_case"));//案件数量
		bondDisposal.put("bond_deadline", multipartRequest.getParameter("bond_deadline"));//委外期限
		bondDisposal.put("bond_deal", multipartRequest.getParameter("bond_deal"));//交易类型：单笔或委外包
		if(multipartRequest.getParameter("bond_auditor") != null){
			bondDisposal.put("bond_show", multipartRequest.getParameter("bond_show"));//加盟方审核后，是否要优先接单
			bondDisposal.put("bond_auditor", multipartRequest.getParameter("bond_auditor"));//加盟商的id
		}
		if(!multipartFile.isEmpty()){
			bondDisposal.put("bond_disposal_img", logoPathDir + File.separator + logImageName);//图片
		}
		System.out.println("看看bondDisposal中的数据是什么:"+bondDisposal);
		if(StringUtils.isEmpty(bondDisposal.get("bond_disposal_id").toString())){
			bondDisposal.put("bond_disposal_id", IDUtil.get32UUID());
			bondDisposal.put("bond_verify", "1");
			bondDisposal.put("bond_release_time", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			bondDisposal.put("bond_disposal_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			bondDisposal.put("bond_unable", "0");//操作状态
			System.out.println("看看在插入前bondDisposal中的数据是什么:"+bondDisposal);
			bondDisposalService.save(bondDisposal);
			System.out.println("最后在bondDisposal中的数据是什么:"+bondDisposal);
		}else{
			if(bondDisposal.get("bond_show") !=null && "1".equals(bondDisposal.get("bond_show").toString())){
				bondDisposal.put("bond_unable", "1");
			}
			bondDisposal.put("bond_disposal_updatetime", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			bondDisposal.put("bond_verify", multipartRequest.getParameter("bond_verify"));
			bondDisposal.put("bond_disposal_updateid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			System.out.println("在修改之前，bondDisposal中的数据是什么:"+bondDisposal);
			bondDisposalService.updateById(bondDisposal);
			
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","成功");
		mv.setViewName("sys/bond/sysdisposal_list");
		
		return mv;
	}
	
	
	/**
	 * 给加盟方新增和修改订单
	 */
	@RequestMapping(value="/sheet/joinsave")
	@ResponseBody
	public ModelAndView sheetJoinSave(HttpServletRequest request) throws Exception{
		logger.info("start----------------新增bondSheet");
		Map<String,Object> bondSheet = RequestUtil.getParameterMap(logger);
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		String logoPathDir =null;
		String logImageName =null;
		/*
		 * 上传图片的创建
		 * */
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("bond_deal_img");
		if(!multipartFile.isEmpty()){
			SimpleDateFormat dateformat = new SimpleDateFormat("yyyy/MM/dd/HH");
			logoPathDir = "files/"+ dateformat.format(new Date());
			String logoRealPathDir = request.getSession().getServletContext().getRealPath(logoPathDir);
			File logoSaveFile = new File(logoRealPathDir);
			if(!logoSaveFile.exists()) logoSaveFile.mkdirs();
			String suffix = multipartFile.getOriginalFilename().substring (multipartFile.getOriginalFilename().lastIndexOf("."));
			logImageName = UUID.randomUUID().toString()+ suffix;
			String fileName = logoRealPathDir + File.separator + logImageName;
			File file = new File(fileName);
			try {
				multipartFile.transferTo(file);
			}catch (IOException e){
				e.printStackTrace();
			}
		}
		bondSheet.put("bond_sheet_id",multipartRequest.getParameter("bond_sheet_id"));//订单表
		bondSheet.put("bond_company_name", multipartRequest.getParameter("bond_company_name"));//发布方公司名
		bondSheet.put("bond_asset_number", multipartRequest.getParameter("bond_asset_number"));//发布方资产编号
		bondSheet.put("bond_accept_name", multipartRequest.getParameter("bond_accept_name"));//处置方公司名
		bondSheet.put("bond_accept_property", multipartRequest.getParameter("bond_accept_property"));//处置方企业性质
		bondSheet.put("bond_deal_name", multipartRequest.getParameter("bond_deal_name"));//处置人
		bondSheet.put("bond_deal_phone", multipartRequest.getParameter("bond_deal_phone"));//处置人电话
		//bondSheet.put("bond_deal_type", multipartRequest.getParameter("bond_deal_type"));//处置方式
		bondSheet.put("bond_deal_img",logoPathDir + File.separator + logImageName);//图片
		bondSheet.put("bond_disposal_id", multipartRequest.getParameter("bond_disposal_id"));//得到委外表的资产的id
		bondDisposal.put("bond_disposal_id", multipartRequest.getParameter("bond_disposal_id"));
		Map<String,Object> disposal = bondDisposalService.find(bondDisposal);
		
		bondSheet.put("bond_disposal_createuid", disposal.get("bond_disposal_createuid"));//发布人id
		bondSheet.put("bond_recipientid",disposal.get("bond_auditor"));//接单人
		bondSheet.put("bond_sheet_state", "1");//订单的状态：1_未过期,2_已过期
		bondSheet.put("bond_deal", disposal.get("bond_deal"));//交易类型
		String bond_deadline = (String) disposal.get("bond_deadline");
	    Pattern pattern = Pattern.compile("[^0-9]");
        Matcher matcher = pattern.matcher(bond_deadline);
        String num = matcher.replaceAll("");//得到月份
        System.out.println("数字是:" + num);
		System.out.println("在这个时候，id应该是空的"+bondSheet);
		
		
		if(StringUtils.isEmpty(bondSheet.get("bond_sheet_id").toString())){
			
			System.out.println("看到这，那就是已经走了这一判断");
			bondSheet.put("bond_sheet_id", IDUtil.get32UUID());
			bondSheet.put("bond_sheet_time", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			
			Date d=new Date();   
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");  
			int moth = Integer.parseInt(num);
			bondSheet.put("bond_lose_efficacy_time", df.format(new Date(d.getTime() + moth*30L * 24L * 60L * 60L * 1000L)));//过期的时间点
			System.out.println("在这获得了全部的参数"+bondSheet);
			bondSheetService.save(bondSheet);
			bondDisposal.put("bond_show", "0");
			bondDisposalService.updateById(bondDisposal);
			
		}else{
			bondSheet.put("bond_sheet_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    bondSheet.put("bond_sheet_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			bondSheetService.updateById(bondSheet);
		}
		
		
		return new ModelAndView("sys/bond/sysdisposal_list");
	}
	
	
	/**
	 * 新增和修改订单
	 */
	@RequestMapping(value="/sheet/save")
	@ResponseBody
	public ModelAndView sheetSave(HttpServletRequest request) throws Exception{
		logger.info("start----------------新增bondSheet");
		Map<String,Object> bondSheet = RequestUtil.getParameterMap(logger);
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		String logoPathDir =null;
		String logImageName =null;
		/*
		 * 上传图片的创建
		 * */
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("bond_deal_img");
		if(!multipartFile.isEmpty()){
			SimpleDateFormat dateformat = new SimpleDateFormat("yyyy/MM/dd/HH");
			logoPathDir = "files/"+ dateformat.format(new Date());
			String logoRealPathDir = request.getSession().getServletContext().getRealPath(logoPathDir);
			File logoSaveFile = new File(logoRealPathDir);
			if(!logoSaveFile.exists()) logoSaveFile.mkdirs();
			String suffix = multipartFile.getOriginalFilename().substring (multipartFile.getOriginalFilename().lastIndexOf("."));
			logImageName = UUID.randomUUID().toString()+ suffix;
			String fileName = logoRealPathDir + File.separator + logImageName;
			File file = new File(fileName);
			try {
				multipartFile.transferTo(file);
			}catch (IOException e){
				e.printStackTrace();
			}
		}
		bondSheet.put("bond_sheet_id",multipartRequest.getParameter("bond_sheet_id"));//订单表
		bondSheet.put("bond_company_name", multipartRequest.getParameter("bond_company_name"));//发布方公司名
		bondSheet.put("bond_asset_number", multipartRequest.getParameter("bond_asset_number"));//发布方资产编号
		bondSheet.put("bond_accept_name", multipartRequest.getParameter("bond_accept_name"));//处置方公司名
		bondSheet.put("bond_accept_property", multipartRequest.getParameter("bond_accept_property"));//处置方企业性质
		bondSheet.put("bond_deal_name", multipartRequest.getParameter("bond_deal_name"));//处置人
		bondSheet.put("bond_deal_phone", multipartRequest.getParameter("bond_deal_phone"));//处置人电话
		//bondSheet.put("bond_deal_type", multipartRequest.getParameter("bond_deal_type"));//处置方式
		bondSheet.put("bond_deal_img",logoPathDir + File.separator + logImageName);//图片
		System.out.println("在这个时候，id应该是空的"+bondSheet);
		//解决在选择完处置方后的显示问题
		Map<String,Object> bondAccept =RequestUtil.getParameterMap(logger);
		bondAccept.put("bond_accept_id", multipartRequest.getParameter("bond_accept_id"));
		if(StringUtils.isEmpty(bondSheet.get("bond_sheet_id").toString())){
			System.out.println("看到这，那就是已经走了这一判断");
			bondSheet.put("bond_sheet_id", IDUtil.get32UUID());
			bondSheet.put("bond_sheet_time", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			bondSheet.put("bond_sheet_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			System.out.println("在这获得了全部的参数"+bondSheet);
			bondSheetService.save(bondSheet);
		}else{
			bondSheet.put("bond_sheet_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    bondSheet.put("bond_sheet_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
		    //在有订单信息时才可以修改
		    bondDisposal.put("bond_disposal_id", multipartRequest.getParameter("bond_disposal_id"));//发布方id
			bondDisposal.put("bond_contacts", multipartRequest.getParameter("bond_contacts"));//发布方联系人
			bondDisposal.put("bond_contact_number", multipartRequest.getParameter("bond_contact_number"));//发布方联系方式
			bondDisposal.put("bond_unable", multipartRequest.getParameter("bond_unable"));//发布方资产状态
		    bondDisposalService.updateById(bondDisposal);
			bondSheetService.updateById(bondSheet);
		}
		return new ModelAndView("sys/bond/sysdisposal_list");
	}
	
	
	/**
	 * 新增报名信息
	 */
	@RequestMapping(value="/accept/save")
	@ResponseBody
	public ModelAndView acceptSave(HttpServletRequest request) throws Exception{
		logger.info("start----------------新增bondAccept");
		Map<String,Object> bondAccept = RequestUtil.getParameterMap(logger);
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		String logoPathDir =null;
		String logImageName =null;
		/*
		 * 上传图片的创建
		 * */
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("bond_deal_img");
		if(!multipartFile.isEmpty()){
			SimpleDateFormat dateformat = new SimpleDateFormat("yyyy/MM/dd/HH");
			logoPathDir = "files/"+ dateformat.format(new Date());
			String logoRealPathDir = request.getSession().getServletContext().getRealPath(logoPathDir);
			File logoSaveFile = new File(logoRealPathDir);
			if(!logoSaveFile.exists()) logoSaveFile.mkdirs();
			String suffix = multipartFile.getOriginalFilename().substring (multipartFile.getOriginalFilename().lastIndexOf("."));
			logImageName= UUID.randomUUID().toString()+ suffix;
			String fileName = logoRealPathDir + File.separator + logImageName;
			File file = new File(fileName);
			try {
				multipartFile.transferTo(file);
			}catch (IOException e){
				e.printStackTrace();
			}
		}	
		
		bondAccept.put("bond_accept_id",multipartRequest.getParameter("bond_accept_id"));
		bondAccept.put("bond_company_name", multipartRequest.getParameter("bond_company_name"));//发布方公司名
		bondAccept.put("bond_asset_number", multipartRequest.getParameter("bond_asset_number"));//发布方资产编号
		bondAccept.put("bond_accept_name", multipartRequest.getParameter("bond_accept_name"));//处置方公司名
		bondAccept.put("bond_accept_property", multipartRequest.getParameter("bond_accept_property"));//处置方企业性质
		bondAccept.put("bond_deal_name", multipartRequest.getParameter("bond_deal_name"));//处置人
		bondAccept.put("bond_deal_phone", multipartRequest.getParameter("bond_deal_phone"));//处置人电话
		bondAccept.put("bond_deal_type", multipartRequest.getParameter("bond_deal_type"));//处置方式
		bondAccept.put("bond_deal_img",logoPathDir + File.separator + logImageName);//图片
		bondAccept.put("bond_choose", multipartRequest.getParameter("bond_choose"));//未选择处置方
		
		
		
		System.out.println("在这个时候，id应该是空的"+bondAccept);
		
		if(StringUtils.isEmpty(bondAccept.get("bond_accept_id").toString())){
			System.out.println("看到这，那就是已经走了这一判断");
			bondAccept.put("bond_accept_id", IDUtil.get32UUID());
			bondAccept.put("bond_accept_time", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss ").format(new Date()));
			bondAccept.put("bond_accept_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			System.out.println("在这获得了全部的参数"+bondAccept);
			bondAcceptService.save(bondAccept);
		}else{
			
			
			bondAccept.put("bond_accept_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    bondAccept.put("bond_accept_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			bondAcceptService.updateById(bondAccept);
		}
		
		return new ModelAndView("sys/kj/user/identityLead");
	}
	
	
	/**
	 * 报名信息删除
	 */
	@RequestMapping(value="/accdel")
	@ResponseBody
	public Object acceptDelete(){
		logger.info("start----------------删除bondAccept");
		Map<String,Object> bondAccept = RequestUtil.getParameterMap(logger);
		try{
			bondAcceptService.delete(bondAccept);
			
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "成功");
	}
	
	/**
	 * 订单删除
	 */
	@RequestMapping(value="/godel")
	@ResponseBody
	public Object sheetDelete(){
		logger.info("start----------------删除bondSheet");
		Map<String,Object> bondSheet = RequestUtil.getParameterMap(logger);
		try{
			bondSheetService.delete(bondSheet);
			
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "成功");
	}
	
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/del")
	@ResponseBody
	public Object delete(){
		logger.info("start----------------删除bondDisposal");
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		try{
			bondDisposalService.delete(bondDisposal);
			
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
		logger.info("start----------------修改bondDisposal");
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		bondDisposal.put("auction_assets_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		bondDisposal.put("auction_assets_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
		bondDisposalService.updateById(bondDisposal);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","成功");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("sys/goods/sysgoods_list");
		return mv;
	}
	/**
	 * 订单列表
	 */
	@RequestMapping(value="/acceptList")
	public ModelAndView acceptList(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表bondAccept");
		Map<String,Object> bondAccept = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				bondAccept.put(conditionName,conditionValue);
			}
			List<Object> varList = bondAcceptService.pageList(bondAccept);	//列出bondSheet列表
			List<Object> dictList = null;
			Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
			dictAssets.put("dict_assets_state", "0");
			try {
				dictList = dictAssetsService.list(dictAssets);
			} catch (Exception e) {
				logger.error(e.toString(), e);
			}
			mv.addObject("dictList", dictList);
			mv.addObject("varList", varList);
			mv.addObject("bondAccept", bondAccept);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/bond/sysaccept_list");
			System.out.println("传递的bondAccept:"+bondAccept);
			System.out.println("显示在查找的参数,mv:"+mv);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 订单列表
	 */
	@RequestMapping(value="/sheetList")
	public ModelAndView sheetList(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表bondSheet");
		Map<String,Object> bondSheet = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				bondSheet.put(conditionName,conditionValue);
			}
			List<Object> varList = bondSheetService.pageListAll(bondSheet);	//列出bondSheet列表
			mv.addObject("varList", varList);
			mv.addObject("bondSheet", bondSheet);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/bond/syssheet_list");
			System.out.println("传递的bondSheet:"+bondSheet);
			System.out.println("显示在查找的参数,mv:"+mv);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Map<String,Object> bondDisposal,String conditionName,String conditionValue,String paneltitle){
		 bondDisposal = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				bondDisposal.put(conditionName,conditionValue);
			}
			
			bondDisposal.put("allSearch", bondDisposal.get("bond_company_name"));
			bondDisposal.remove("bond_company_name");
			List<Object> varList = bondDisposalService.pageList(bondDisposal);	//列出bondDisposal列表
			List<Object> dictList = null;
			Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
			Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
			dictAssets.put("dict_assets_state", "0");
			bondSite.put("bond_site_state", "0");
			List<Object> siteList=bondSiteService.list(bondSite);
			try {
				dictList = dictAssetsService.list(dictAssets);
			} catch (Exception e) {
				logger.error(e.toString(), e);
			}
			mv.addObject("dictList", dictList);
			mv.addObject("varList", varList);
			mv.addObject("siteList",siteList);
			mv.addObject("bondDisposal", bondDisposal);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/bond/sysdisposal_list");
			System.out.println("后台输出mv:"+mv);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 加盟方列表
	 */
	@RequestMapping(value="/joinlist")
	public ModelAndView joinList(Map<String,Object> bondDisposal,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------加盟方列表joinlist");
		
		bondDisposal = RequestUtil.getParameterMap(logger);
		System.out.println("这个方法出入的参数,bondDispsoal:"+bondDisposal);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				bondDisposal.put(conditionName,conditionValue);
			}
			if(ShiroUtils.getCurrentUser().get("sys_area_id") != null){
				if(bondDisposal.get("bond_verify")==null && bondDisposal.get("bond_verify")==""){
					bondDisposal.put("bond_verify", "1");
				}
				bondDisposal.put("bond_debt_location", ShiroUtils.getCurrentUser().get("sys_area_id"));
				bondDisposal.put("allSearch", bondDisposal.get("bond_company_name"));
				bondDisposal.remove("bond_company_name");
				List<Object> varList = bondDisposalService.pageList(bondDisposal);	//列出bondDisposal列表
				List<Object> dictList = null;
				Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
				Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
				dictAssets.put("dict_assets_state", "0");
				bondSite.put("bond_site_state", "0");
				List<Object> siteList=bondSiteService.list(bondSite);
				try {
					dictList = dictAssetsService.list(dictAssets);
				} catch (Exception e) {
					logger.error(e.toString(), e);
				}
				mv.addObject("dictList", dictList);
				mv.addObject("varList", varList);
				mv.addObject("siteList",siteList);
				mv.addObject("bondDisposal", bondDisposal);
				mv.addObject("conditionName", conditionName);
				mv.addObject("conditionValue", conditionValue);
				mv.addObject("paneltitle", paneltitle);
			}else{
				System.out.println("请完善用户信息！");
			}
			
			
			mv.setViewName("sys/bond/sysdisposal_join_list");
			System.out.println("后台输出mv:"+mv);
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
		logger.info("start----------------列表sysGoods");
		Map<String,Object> sysGoods = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				sysGoods.put(conditionName,conditionValue);
			}
			List<Object> varList = sysGoodsService.pageList(sysGoods);	//列出sysGoods列表
			mv.addObject("varList", varList);
			mv.addObject("sysGoods", sysGoods);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/goods/sysgoods_list_tree");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	/**
	 * 去新增报名页面
	 */
	@RequestMapping(value="/accept/goadd")
	public ModelAndView goAcceptAdd(String paneltitle){
		logger.info("start----------------去新增bondAccept报名页面");
		Map<String,Object> bondAccept = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		dictAssets.put("dict_assets_state", "0");
		List<Object> dictList = null;
		try {
			dictList = dictAssetsService.list(dictAssets);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		mv.addObject("dictList", dictList);
		mv.addObject("paneltitle", "资产委外报名添加");
		mv.addObject("bondAccept", bondAccept);
		mv.addObject("dict", dictUtils.getDictByTable("sys_goods"));
		mv.setViewName("sys/bond/sysdisposal_accept_dialog");
		return mv;
	}	
	/**
	 * 去新增订单页面
	 */
	@RequestMapping(value="/sheet/goadd")
	public ModelAndView goSheetAdd(String paneltitle){
		logger.info("start----------------去新增sysSheet订单页面");
		Map<String,Object> bondSheet = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		mv.addObject("paneltitle", "资产委外订单添加");
		mv.addObject("bondSheet", bondSheet);
		mv.addObject("dict", dictUtils.getDictByTable("sys_goods"));
		mv.setViewName("sys/bond/sysdisposal_sheet_dialog");
		return mv;
	}	
	
	/**
	 * 去新增加盟方的订单页面
	 */
	@RequestMapping(value="/sheet/gojoinadd")
	public ModelAndView goSheetJoinAdd(String bond_disposal_id){
		logger.info("start----------------去新增加盟方sysSheet订单页面");
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		Map<String,Object> sysUser = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		bondDisposal.put("bond_disposal_id", bond_disposal_id);
		Map<String,Object> disposal = null;
		Map<String,Object> user = null;
		try {
			disposal = bondDisposalService.find(bondDisposal);
			sysUser.put("sys_user_id", disposal.get("bond_auditor"));
			user = sysUserService.find(sysUser);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.addObject("paneltitle", "加盟方优先接单");
		mv.addObject("disposal",disposal);
		mv.addObject("user",user);
		mv.addObject("dict", dictUtils.getDictByTable("sys_goods"));
		mv.setViewName("sys/bond/sysdisposal_sheet_join");
		return mv;
	}	
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goadd")
	public ModelAndView goAdd(String paneltitle){
		logger.info("start----------------去新增sysBond页面");
		Map<String,Object> sysBond = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		dictAssets.put("dict_assets_state", "0");
		List<Object> dictList = null;
		//地址
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		bondSite.put("bond_site_state", "0");
		bondSite.put("bond_site_pid", "0");
		List<Object> siteList = null;
		try {
			siteList = bondSiteService.list(bondSite);
			dictList = dictAssetsService.list(dictAssets);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		mv.addObject("siteList",siteList);
		mv.addObject("dictList", dictList);
		mv.addObject("paneltitle", "资产委外添加");
		mv.addObject("sysBond", sysBond);
		mv.addObject("dict", dictUtils.getDictByTable("sys_goods"));
		mv.setViewName("sys/bond/sysdisposal_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去修改页面
	 * @throws Exception 
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(String bond_disposal_id) throws Exception{
		logger.info("start----------------去修改sysBond页面");
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		bondDisposal.put("bond_disposal_id", bond_disposal_id);
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		dictAssets.put("dict_assets_state", "0");
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		bondSite.put("bond_site_state", 0);
		bondSite.put("bond_site_pid","0");
		//省的集合
		List<Object> siteList = bondSiteService.list(bondSite);
		bondSite.clear();
		//得到咨询的地址
		bondSite.put("bond_site_id",bondDisposalService.find(bondDisposal).get("bond_location"));
		Map <String,Object> siteOne = bondSiteService.find(bondSite);
		//得到市的集合
		bondSite.clear();
		bondSite.put("bond_site_pid", siteOne.get("bond_site_pid"));
		try {
			List<Object> dictList = dictAssetsService.list(dictAssets);
			List<Object> city = bondSiteService.list(bondSite);
			
			//得到债务人地址信息
			bondSite.clear();
			bondSite.put("bond_site_id", bondDisposalService.find(bondDisposal).get("bond_debt_location"));
			Map<String,Object> debtSite = bondSiteService.find(bondSite);
			//得到省的集合
			bondSite.clear();
			bondSite.put("bond_site_state", 0);
			bondSite.put("bond_site_pid","0");
			List<Object> debtPro = bondSiteService.list(bondSite);
			//得到市的集合
			bondSite.clear();
			bondSite.put("bond_site_pid", debtSite.get("bond_site_pid"));
			List<Object> debtCity = bondSiteService.list(bondSite);
			mv.addObject("siteList",siteList);
			mv.addObject("dictList", dictList);
			mv.addObject("city",city);
			mv.addObject("siteOne",siteOne);
			//债务人的信息
			mv.addObject("debtSite",debtSite);
			mv.addObject("debtPro",debtPro);
			mv.addObject("debtCity",debtCity);
			mv.addObject("bond_disposal_id", bond_disposal_id);
			mv.addObject("bondDisposal", bondDisposalService.find(bondDisposal));
			mv.addObject("paneltitle","资产委外修改");
			mv.addObject("dict", dictUtils.getDictByTable("sys_goods"));
			mv.setViewName("sys/bond/sysdisposal_edit_dialog");
			System.out.println("转发到修改页面一些数据，mv:"+mv);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}

	/**
	 * 加盟商查看上传资料的页面
	 * @throws Exception 
	 */
	@RequestMapping(value="/gojoin")
	public ModelAndView goJoin(String bond_disposal_id) throws Exception{
		logger.info("start----------------去修改sysBond页面");
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		bondDisposal.put("bond_disposal_id", bond_disposal_id);
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		dictAssets.put("dict_assets_state", "0");
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		bondSite.put("bond_site_state", 0);
		bondSite.put("bond_site_pid","0");
		//省的集合
		List<Object> siteList = bondSiteService.list(bondSite);
		bondSite.clear();
		//得到咨询的地址
		bondSite.put("bond_site_id",bondDisposalService.find(bondDisposal).get("bond_location"));
		Map <String,Object> siteOne = bondSiteService.find(bondSite);
		//得到市的集合
		bondSite.clear();
		bondSite.put("bond_site_pid", siteOne.get("bond_site_pid"));
		try {
			List<Object> dictList = dictAssetsService.list(dictAssets);
			List<Object> city = bondSiteService.list(bondSite);
			
			//得到债务人地址信息
			bondSite.clear();
			bondSite.put("bond_site_id", bondDisposalService.find(bondDisposal).get("bond_debt_location"));
			Map<String,Object> debtSite = bondSiteService.find(bondSite);
			//得到省的集合
			bondSite.clear();
			bondSite.put("bond_site_state", 0);
			bondSite.put("bond_site_pid","0");
			List<Object> debtPro = bondSiteService.list(bondSite);
			//得到市的集合
			bondSite.clear();
			bondSite.put("bond_site_pid", debtSite.get("bond_site_pid"));
			List<Object> debtCity = bondSiteService.list(bondSite);
			mv.addObject("siteList",siteList);
			mv.addObject("dictList", dictList);
			mv.addObject("city",city);
			mv.addObject("siteOne",siteOne);
			//债务人的信息
			mv.addObject("debtSite",debtSite);
			mv.addObject("debtPro",debtPro);
			mv.addObject("debtCity",debtCity);
			mv.addObject("bond_disposal_id", bond_disposal_id);
			mv.addObject("bondDisposal", bondDisposalService.find(bondDisposal));
			mv.addObject("paneltitle","资产委外修改");
			mv.addObject("dict", dictUtils.getDictByTable("sys_goods"));
			mv.setViewName("sys/bond/sysjoin_edit");
			System.out.println("转发到修改页面一些数据，mv:"+mv);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	
	
	/**
	 * 去订单修改页面
	 */
	@RequestMapping(value="/gosheet")
	public ModelAndView goSheet(String bond_sheet_id){
		logger.info("start----------------去修改sysSheet页面");
		Map<String,Object> bondSheet = RequestUtil.getParameterMap(logger);
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		Map<String,Object> sysUser = RequestUtil.getParameterMap(logger);
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		dictAssets.put("dict_assets_state", "0");
		ModelAndView mv = new ModelAndView();
		bondSheet.put("bond_sheet_id", bond_sheet_id);
		Map<String,Object> sheet = null;
		Map<String,Object> disposal = null;
		Map<String,Object> user = null;
		List<Object> dictList =null;
		try {
			sheet = bondSheetService.find(bondSheet);
			bondDisposal.put("bond_disposal_id", sheet.get("bond_disposal_id"));
			disposal = bondDisposalService.find(bondDisposal);
			sysUser.put("sys_user_id", sheet.get("bond_recipientid"));
			user = sysUserService.find(sysUser);
			dictList = dictAssetsService.list(dictAssets);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			
			mv.addObject("dictList", dictList);
			mv.addObject("bond_sheet_id", bond_sheet_id);
			mv.addObject("bondSheet", bondSheetService.find(bondSheet));
			mv.addObject("paneltitle","资产委外订单修改");
			mv.addObject("dict", dictUtils.getDictByTable("sys_goods"));
			//11月30日 订单需要审核
			mv.addObject("sheet",sheet);
			mv.addObject("disposal", disposal);
			mv.addObject("user",user);
			mv.setViewName("sys/bond/sysdisposal_sheet_dialog");
			System.out.println("转发到修改页面一些数据，mv:"+mv);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	/**
	 * 去报名修改页面
	 */
	@RequestMapping(value="/goaccept")
	public ModelAndView goAccept(String bond_accept_id){
		logger.info("start----------------去修改bondAccept页面");
		Map<String,Object> bondAccept = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		bondAccept.put("bond_accept_id", bond_accept_id);
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		dictAssets.put("dict_assets_state", "0");
		try {
			List<Object> dictList = dictAssetsService.list(dictAssets);
			mv.addObject("dictList", dictList);
			
			mv.addObject("bond_accept_id", bond_accept_id);
			mv.addObject("bondAccept", bondAcceptService.find(bondAccept));
			mv.addObject("paneltitle","资产委外报名修改");
			mv.addObject("dict", dictUtils.getDictByTable("sys_goods"));
			mv.setViewName("sys/bond/sysdisposal_accept_dialog");
			System.out.println("转发到修改页面一些数据，mv:"+mv);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	/**
	 * 拍卖情况查看
	 * @param auction_assets_id
	 * @return
     */
	@RequestMapping(value="/auPrice")
	public ModelAndView auPrice(String auction_assets_id, String paneltitle){
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		bondDisposal.put("auction_assets_id", auction_assets_id);
		mv.addObject("auction_assets_id", auction_assets_id);
		mv.addObject("paneltitle", paneltitle);
		try {
			mv.addObject("varList", auctionPriceService.pageList(bondDisposal));
			mv.setViewName("sys/goods/auction_price_list");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 批量删除报名信息
	 */
	@RequestMapping(value="/accept/delall")
	@ResponseBody
	public Object acceptDeleteAll() {
		logger.info("start----------------批量删除bondAccept");
		Map<String,Object> bondAccept = RequestUtil.getParameterMap(logger);
		try {
			bondAcceptService.delete(bondAccept);
			
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除bondAccept");
		}
		return ResponseUtil.resultMap(1, "成功");
	}
	/**
	 * 批量删除订单条目
	 */
	@RequestMapping(value="/sheet/delall")
	@ResponseBody
	public Object sheetDeleteAll() {
		logger.info("start----------------批量删除bondSheet");
		Map<String,Object> bondSheet = RequestUtil.getParameterMap(logger);
		try {
			bondSheetService.delete(bondSheet);
			
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除bondSheet");
		}
		return ResponseUtil.resultMap(1, "成功");
	}
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/delall")
	@ResponseBody
	public Object deleteAll() {
		logger.info("start----------------批量删除bondDisposal");
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		try {
			bondDisposalService.delete(bondDisposal);
			
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除bondDisposal");
		}
		return ResponseUtil.resultMap(1, "成功");
	}
}
