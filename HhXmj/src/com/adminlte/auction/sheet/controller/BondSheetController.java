package com.adminlte.auction.sheet.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.adminlte.auction.accept.service.BondAcceptService;
import com.adminlte.auction.bond.service.BondDisposalService;
import com.adminlte.auction.dict.service.DictAssetsService;
import com.adminlte.auction.sheet.service.BondSheetService;
import com.adminlte.utils.DictUtils;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.POIUtil;
import com.adminlte.utils.PathUtil;
import com.adminlte.utils.RequestUtil;
import com.adminlte.utils.ResponseUtil;
import com.adminlte.utils.ShiroUtils;


/** 
 * 类名称：bondSheetController
 * 创建人：Cheng
 * 创建时间：2017-10-24
 */
@Controller
@RequestMapping(value="bond/sheet")
public class BondSheetController{
	private Log logger = LogFactory.getLog(BondSheetController.class);
	@Resource(name="bondSheetService")
	private BondSheetService bondSheetService;
	@Resource(name = "dictUtils")
	private DictUtils dictUtils;
	@Resource(name="bondDisposalService")
	private BondDisposalService bondDisposalService;
	@Resource(name="bondAcceptService")
	private BondAcceptService bondAcceptService;
	@Resource(name="dictAssetsService")
	private DictAssetsService dictAssetsService;
	
	/**
	 * 跳转到接单页面
	 */
	@RequestMapping(value="/index")
	@ResponseBody
	public Object index(String bond_disposal_id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		logger.info("start----------------接单bondSheet");
		ModelAndView mv = new ModelAndView();
		
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		if (bond_disposal_id!=null) {
			bondDisposal.put("bond_disposal_id", bond_disposal_id);
			dictAssets.put("dict_assets_pid","bond_accept_property");
			List<Object> varList = bondDisposalService.pageList(bondDisposal);
			List<Object> dictList = dictAssetsService.list(dictAssets);
			//生成令牌
			String token = TokenProccessor.getInstance().makeToken();
			System.out.println("在生成订单时的令牌是："+token);
			request.getSession().setAttribute("token", token);
			mv.addObject("varList", varList);
			mv.addObject("dictList",dictList);
			mv.setViewName("sys/kj/Registration");
			System.out.println("接单时mv的数据："+mv);
		}else {
			System.out.println("接单数据没有传入进来");
		}

		return mv;
	}
	
	          /**
	          * 判断客户端提交上来的令牌和服务器端生成的令牌是否一致
	          * @param request
	          * @return 
	          *         true 用户重复提交了表单 
	          *         false 用户没有重复提交表单
	          */
	         private boolean isRepeatSubmit(HttpServletRequest request) {
	             String client_token = request.getParameter("token");
	             //1、如果用户提交的表单数据中没有token，则用户是重复提交了表单
	             if(client_token==null){
	                 return true;
	             }
	             //取出存储在Session中的token
	             String server_token = (String) request.getSession().getAttribute("token");
	             //2、如果当前用户的Session中不存在Token(令牌)，则用户是重复提交了表单
	             if(server_token==null){
	                 return true;
	             }
	             //3、存储在Session中的Token(令牌)与表单提交的Token(令牌)不同，则用户是重复提交了表单
	             if(!client_token.equals(server_token)){
	                 return true;
	             }
	             
	             return false;
	         }
	         @RequestMapping(value="/remove")
	         public void sheetSession(HttpServletRequest request){
	        	 HttpSession session = request.getSession();
	        	 for ( Enumeration e = session.getAttributeNames(); e.hasMoreElements(); )
	             {
	                 System.out.println("session有："+e.nextElement());
	             }
	        	 request.getSession().removeAttribute("error");
	        	 request.getSession().removeAttribute("success");
	        	 System.out.println("调用了");
	         }
	
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public ModelAndView save(HttpServletRequest request) throws Exception{
		logger.info("start----------------新增bondSheet");
		Map<String,Object> bondSheet = RequestUtil.getParameterMap(logger);
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		bondSheet.put("bond_sheet_id",multipartRequest.getParameter("bond_sheet_id"));//订单表
		if(StringUtils.isEmpty(bondSheet.get("bond_sheet_id").toString())){
			boolean b = isRepeatSubmit(request);//判断用户是否重复提交
			if(b==true){
				System.out.println("请不要重复提交表单");
				request.getSession().setAttribute("error", "请不要重复提交表单!");
				return new ModelAndView("redirect:/sys/kj/index");
			}
		}
		
		request.getSession().removeAttribute("token");
		
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		
		String logoPathDir =null;
		String logImageName =null;
		/*
		 * 上传图片的创建
		 * */
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
		
		bondSheet.put("bond_company_name", multipartRequest.getParameter("bond_company_name"));//发布方公司名
		bondSheet.put("bond_asset_number", multipartRequest.getParameter("bond_asset_number"));//发布方资产编号
		bondSheet.put("bond_accept_name", multipartRequest.getParameter("bond_accept_name"));//处置方公司名
		bondSheet.put("bond_accept_property", multipartRequest.getParameter("bond_accept_property"));//处置方企业性质
		bondSheet.put("bond_deal_name", multipartRequest.getParameter("bond_deal_name"));//处置人
		bondSheet.put("bond_deal_phone", multipartRequest.getParameter("bond_deal_phone"));//处置人电话
		//bondSheet.put("bond_deal_type", multipartRequest.getParameter("bond_deal_type"));//处置方式
		bondSheet.put("bond_deal_img",logoPathDir + File.separator + logImageName);//图片
		bondSheet.put("bond_disposal_createuid", multipartRequest.getParameter("bond_disposal_createuid"));//发布人id
		//11月17日  添加字段
		bondSheet.put("bond_recipientid", ShiroUtils.getCurrentUser().get("sys_user_id"));//接单人
		bondSheet.put("bond_sheet_state", "1");//订单的状态：1_未过期,2_已过期
		bondSheet.put("bond_disposal_id", multipartRequest.getParameter("bond_disposal_id"));//得到委外表的资产的id
		bondDisposal.put("bond_disposal_id", multipartRequest.getParameter("bond_disposal_id"));
		Map<String,Object> disposal = bondDisposalService.find(bondDisposal);
		bondSheet.put("bond_deal", disposal.get("bond_deal"));
		String bond_deadline = (String) disposal.get("bond_deadline");
		
	    Pattern pattern = Pattern.compile("[^0-9]");
        Matcher matcher = pattern.matcher(bond_deadline);
        String num = matcher.replaceAll("");//得到月份
        System.out.println("数字是:" + num);
		
		System.out.println("在这个时候，id应该是空的"+bondSheet);
		//解决在选择完处置方后的显示问题
		Map<String,Object> bondAccept =RequestUtil.getParameterMap(logger);
		bondAccept.put("bond_accept_id", multipartRequest.getParameter("bond_accept_id"));
		
		
		if(StringUtils.isEmpty(bondSheet.get("bond_sheet_id").toString())){
			
			System.out.println("看到这，那就是已经走了这一判断");
			bondSheet.put("bond_sheet_id", IDUtil.get32UUID());
			bondSheet.put("bond_sheet_time", new SimpleDateFormat("yyyy/MM/dd").format(new Date()));
			
			Date d=new Date();   
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");  
			int moth = Integer.parseInt(num);
			bondSheet.put("bond_lose_efficacy_time", df.format(new Date(d.getTime() + moth*30L * 24L * 60L * 60L * 1000L)));//过期的时间点
			System.out.println("在这获得了全部的参数"+bondSheet);
			bondSheetService.save(bondSheet);
			request.getSession().setAttribute("success","您填写的信息已在后台审核，请保持联系!");
			bondDisposal.clear();
			bondDisposal.put("bond_unable", "1");
			bondDisposal.put("bond_disposal_id", multipartRequest.getParameter("bond_disposal_id"));//确定修改那一条发布信息
			System.out.println("让我看一下，bondDisposal的值："+bondDisposal);
			bondDisposalService.updateById(bondDisposal);//改为无法操作
			System.out.println("让我看一下，bondAccept的值："+bondAccept);
			if(bondAccept.get("bond_accept_id")!=null){
				bondAccept.clear();
				bondAccept.put("bond_asset_number", multipartRequest.getParameter("bond_asset_number"));//不能用id,需要修改多条
				bondAccept.put("bond_choose", "2");
				System.out.println("让我看一下，bondAccept的值："+bondAccept);
				bondAcceptService.update(bondAccept);
			}
			System.out.println("确定最终订单后，bondDisposal的参数："+bondDisposal);
		}else{
			bondSheet.put("bond_sheet_updatedate", new SimpleDateFormat("yyyy/MM/dd").format(new Date()));
			bondSheetService.updateById(bondSheet);
			request.getSession().setAttribute("success","您的信息已经修改成功!");
		}
		
		
		return new ModelAndView("redirect:/sys/kj/index");
	}

	
	private int parseInt(int moth) {
		// TODO Auto-generated method stub
		return 0;
	}
	/**
	 * 上传
	 */
	@RequestMapping("/upload") 
	@ResponseBody
	public String upload(@RequestParam(value="files[]", required=false) MultipartFile[] files,String bondSheetId){
		String path = PathUtil.getWebPath()+"upload/";
		try {
			for(MultipartFile mfile : files){
	            if (!mfile.isEmpty()) {
                	Map<String,Object> bondSheetMap = new HashMap<String,Object>();
	                	 	bondSheetMap.put("bond_sheet_id", IDUtil.get32UUID());
							bondSheetMap.put("bond_company_name", "");
							bondSheetMap.put("bond_asset_number", "");
							bondSheetMap.put("bond_sheet_time", "");
							bondSheetMap.put("bond_accept_name", "");
							bondSheetMap.put("bond_accept_property", "");
							bondSheetMap.put("bond_deal_name", "");
							bondSheetMap.put("bond_deal_phone", "");
							bondSheetMap.put("bond_deal_type", "");
	                bondSheetService.saveList(POIUtil.readExcelToMap(mfile.getInputStream(),mfile.getName(),bondSheetMap),bondSheetMap);
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
		logger.info("start----------------删除bondSheet");
		Map<String,Object> bondSheet = RequestUtil.getParameterMap(logger);
		try{
			bondSheetService.delete(bondSheet);
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
		logger.info("start----------------修改bondSheet");
		Map<String,Object> bondSheet = RequestUtil.getParameterMap(logger);
		bondSheet.put("bond_sheet_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
	    bondSheet.put("bond_sheet_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
		bondSheetService.updateById(bondSheet);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","success");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("bond/sheet/bondsheet_list");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表bondSheet");
		Map<String,Object> bondSheet = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				bondSheet.put(conditionName,conditionValue);
			}
			List<Object> varList = bondSheetService.list(bondSheet);	//列出bondSheet列表
			String fiction ="36844f4d5c1644e595b7fe4594e6a8e2";
			//mv.addObject("varList", varList);
			mv.addObject("bondSheet", bondSheet);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("fiction",fiction);
			//mv.setViewName("sys/kj/jp");
			System.out.println("在订单中的数据："+mv);
			
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
		logger.info("start----------------列表bondSheet");
		Map<String,Object> bondSheet = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				bondSheet.put(conditionName,conditionValue);
			}
			bondSheet.put("bond_disposal_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));//筛选发布人的发布
			List<Object> varList = bondSheetService.list(bondSheet);	//列出bondSheet列表
			mv.addObject("varList", varList);
			mv.addObject("bondSheet", bondSheet);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/kj/bond_sheet_list");
			System.out.println("bondSheet22中有数据："+bondSheet);
			System.out.println("mv的数据是"+mv);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 列表
	 */
	@RequestMapping(value="/listcoll")
	public ModelAndView listColl(Map<String,Object> bondDisposal,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表bondSheet");
		ModelAndView mv = new ModelAndView();
		Map<String,Object> bondSheet = RequestUtil.getParameterMap(logger);
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		bondDisposal = RequestUtil.getParameterMap(logger);
		List<Map<String, Object>> varList=null;
		dictAssets.put("dict_assets_state", "0");
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				bondSheet.put(conditionName,conditionValue);
			}
			varList = bondDisposalService.listMap(bondDisposal);//单笔或者是资产包
			List<Object> dictList = dictAssetsService.list(dictAssets);
			bondSheet.put("bond_deal", bondDisposal.get("bond_deal"));
			bondSheet.put("bond_recipientid", ShiroUtils.getCurrentUser().get("sys_user_id"));// 判断是否是本人接单
			bondSheet.put("bond_new_time", new SimpleDateFormat("yyyy/MM/dd").format(new Date()));
			
			List<Object> sheetList = bondSheetService.list(bondSheet);
			mv.addObject("varList",varList);
			mv.addObject("sheetList",sheetList);
			mv.addObject("dictList",dictList);
			mv.addObject("bondDisposal",bondDisposal);
			mv.addObject("bondSheet",bondSheet);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/kj/bond_sheet_list");
			
			System.out.println("个人中心，单笔mv的数据是"+mv);
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
	public Object listjson(String pageIndex,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表bondSheet");
		Map<String,Object> bondSheet = RequestUtil.getParameterMap(logger);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		bondSheet.put("pageIndex", pageIndex);
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				bondSheet.put(conditionName,conditionValue);
			}
			bondSheet.put("bond_disposal_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));//筛选发布人的发布
			List<Object> varList = bondSheetService.pageList(bondSheet);	//列出bondSheet列表
			resultMap.put("varList", varList);
			resultMap.put("bondSheet", bondSheet);
			resultMap.put("conditionName", conditionName);
			resultMap.put("conditionValue", conditionValue);
			resultMap.put("paneltitle", paneltitle);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "成功", resultMap);
	}
	
	/**
	 * 催收列表json方式
	 */
	@RequestMapping(value="/listcolljson")
	@ResponseBody
	public Object listColljson(Map<String,Object> bondSheet,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表bondSheet");
		bondSheet = RequestUtil.getParameterMap(logger);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		bondSheet.put("pageIndex", bondSheet.get("pageIndex"));
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				bondSheet.put(conditionName,conditionValue);
			}
			bondSheet.put("bond_deal", bondSheet.get("bond_deal"));
			bondSheet.put("bond_recipientid", ShiroUtils.getCurrentUser().get("sys_user_id"));// 判断是否是本人接单
			bondSheet.put("bond_new_time", new SimpleDateFormat("yyyy/MM/dd").format(new Date()));
			List<Object> varList = bondSheetService.pageList(bondSheet);	//列出bondSheet列表
			resultMap.put("varList", varList);
			resultMap.put("bondSheet", bondSheet);
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
		logger.info("start----------------去新增bondSheet页面");
		Map<String,Object> bondSheet = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("bondSheet", bondSheet);
		mv.addObject("dict", dictUtils.getDictByTable("bond_sheet"));
		mv.setViewName("bond/sheet/bondsheet_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去订单显示页面
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(String bond_disposal_id){
		logger.info("start----------------去显示bondSheet页面");
		Map<String,Object> bondSheet = RequestUtil.getParameterMap(logger);
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		
		bondSheet.put("bond_disposal_id", bond_disposal_id);
		bondDisposal.put("bond_disposal_id", bond_disposal_id);
		
		ModelAndView mv = new ModelAndView();
		
		try {
			
			
			mv.addObject("bond_disposal_id", bond_disposal_id);
			Map<String,Object> varSheet = bondSheetService.find(bondSheet);
			mv.addObject("varSheet", varSheet);
			Map<String,Object> varList = bondDisposalService.find(bondDisposal);
			mv.addObject("varList",varList);
			
			mv.addObject("dict", dictUtils.getDictByTable("bond_sheet"));
			mv.setViewName("sys/kj/custom");
			System.out.println("看看发布的信息，varList："+varList);
			System.out.println("看看处置方的信息，"+bondSheetService.find(bondSheet));
			System.out.println("mv中的数据"+mv);
			
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 处置方个人显示页面
	 */
	@RequestMapping(value="/goshow")
	public ModelAndView goShow(String bond_sheet_id){
		logger.info("start----------------去显示bondSheet页面");
		Map<String,Object> bondSheet = RequestUtil.getParameterMap(logger);
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		
		bondSheet.put("bond_sheet_id", bond_sheet_id);
		
		
		
		ModelAndView mv = new ModelAndView();
		
		try {
			Map<String,Object> sheet = bondSheetService.find(bondSheet);
			
			bondDisposal.put("bond_disposal_id", sheet.get("bond_disposal_id"));
			
			Map<String,Object> disposal = bondDisposalService.find(bondDisposal);
			mv.addObject("varSheet", sheet);
			
			mv.addObject("varList",disposal);
			
			mv.addObject("dict", dictUtils.getDictByTable("bond_sheet"));
			mv.setViewName("sys/kj/custom");
			System.out.println("看看发布的信息，dispsoal："+disposal);
			System.out.println("bondDisposal:"+bondDisposal);
			System.out.println("看看处置方的信息，"+bondSheetService.find(bondSheet));
			System.out.println("mv中的数据"+mv);
			
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
		logger.info("start----------------批量删除bondSheet");
		Map<String,Object> bondSheet = RequestUtil.getParameterMap(logger);
		try {
			bondSheetService.delete(bondSheet);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除bondSheet");
		}
		return ResponseUtil.resultMap(1, "success");
	}
}
