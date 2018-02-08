package com.adminlte.auction.bond.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
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
















import com.adminlte.auction.bond.service.BondDisposalService;
import com.adminlte.auction.dict.service.DictAssetsService;
import com.adminlte.auction.kill.service.KillProcessService;
import com.adminlte.auction.sheet.controller.TokenProccessor;
import com.adminlte.auction.site.service.BondSiteService;
import com.adminlte.base.test.killPid;
import com.adminlte.utils.DataUtils;
import com.adminlte.utils.DictUtils;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.POIUtil;
import com.adminlte.utils.PathUtil;
import com.adminlte.utils.PropertiesUtil;
import com.adminlte.utils.RequestUtil;
import com.adminlte.utils.ResponseUtil;
import com.adminlte.utils.ShiroUtils;


/** 
 * 类名称：bondDisposalController
 * 创建人：Cheng
 * 创建时间：2017-10-13
 */
@Controller
@RequestMapping(value="bond/disposal")
public class BondDisposalController extends killPid{
	private Log logger = LogFactory.getLog(BondDisposalController.class);
	@Resource(name="bondDisposalService")
	private BondDisposalService bondDisposalService;
	@Resource(name = "dictUtils")
	private DictUtils dictUtils;
	@Resource(name="dictAssetsService")
	private DictAssetsService dictAssetsService;
	@Resource(name="bondSiteService")
	private BondSiteService bondSiteService;
	@Resource(name="killProcessService")
	private KillProcessService killProcessService;
	
	/**
	 * 跳转到发布页面
	 */
	
	@RequestMapping(value="/index")
	public ModelAndView toindex(HttpServletRequest request, HttpServletResponse response)throws Exception{
		logger.info("start----------------跳转到发布页面");
		ModelAndView mv = new ModelAndView();
		
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		
		if (ShiroUtils.getCurrentUser() != null) {
			bondSite.put("bond_site_pid", "0");
			bondSite.put("bond_site_state", "0");
			dictAssets.put("dict_assets_state", "0");
			List<Object> dictList = dictAssetsService.list(dictAssets);
			List<Object> siteList = bondSiteService.list(bondSite);//列出bondDisposal列表
			//生成令牌
			String token = TokenProccessor.getInstance().makeToken();
			System.out.println("在生成订单时的令牌是："+token);
			request.getSession().setAttribute("token", token);
			mv.addObject("siteList",siteList);
			mv.addObject("dictList", dictList);
			mv.addObject("bondSite",bondSite);
			mv.setViewName("sys/kj/user/bond_publish");
		}else {
			mv.setViewName("sys/kj/login/login");
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
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public ModelAndView save(HttpServletRequest request) throws Exception{
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		bondDisposal.put("bond_disposal_id", multipartRequest.getParameter("bond_disposal_id"));
		if(StringUtils.isEmpty(bondDisposal.get("bond_disposal_id").toString())){
			logger.info("start----------------新增bondDisposal");
			boolean b = isRepeatSubmit(request);//判断用户是否重复提交
			if(b==true){
				System.out.println("请不要重复提交表单");
				request.getSession().setAttribute("error", "请不要重复提交表单!");
				return new ModelAndView("redirect:/bond/disposal/list");
			}
		}
		request.getSession().removeAttribute("token");
		
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
		bondDisposal.put("bond_company_name", multipartRequest.getParameter("bond_company_name"));//企业名称
		//bondDisposal.put("bond_asset_number", multipartRequest.getParameter("bond_asset_number"));//资产编号
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
		bondDisposal.put("bond_disposal_state", "1");//状态:1_待签约,2_已发布
		bondDisposal.put("bond_release_time", multipartRequest.getParameter("bond_release_time"));//发布时间
		//产品类:1_金融国资,2_不良资产,3_非国有资产,4_招商    不用了
		//债权分类：5_信誉贷,6_抵押贷,7_担保贷
		bondDisposal.put("bond_product_solutions", multipartRequest.getParameter("bond_product_solutions"));
		bondDisposal.put("bond_ownership_amount", multipartRequest.getParameter("bond_ownership_amount"));//权属金额
		bondDisposal.put("bond_classify", multipartRequest.getParameter("bond_classify"));//状态:1_处置方接单,2_处置方竞单
		bondDisposal.put("bond_location", multipartRequest.getParameter("bond_location"));//债权人地址
		bondDisposal.put("bond_debt_location", multipartRequest.getParameter("bond_debt_location"));//债务人地址
		bondDisposal.put("bond_contacts", multipartRequest.getParameter("bond_contacts"));//联系人
		bondDisposal.put("bond_contact_number", multipartRequest.getParameter("bond_contact_number"));//联系人电话
		String bond_overdue = multipartRequest.getParameter("bond_overdue");
 		String overdue_time =multipartRequest.getParameter("overdue_time");
		bond_overdue = bond_overdue+overdue_time;
		bondDisposal.put("bond_overdue",  bond_overdue);//逾期时间
		bondDisposal.put("bond_case", multipartRequest.getParameter("bond_case"));//案件数量
		String bond_deadline = multipartRequest.getParameter("bond_deadline");
		String deadline_time = multipartRequest.getParameter("deadline_time");
		bond_deadline = bond_deadline+deadline_time;
		bondDisposal.put("bond_deadline", bond_deadline);//委外期限
		bondDisposal.put("bond_deal", multipartRequest.getParameter("bond_deal"));//交易类型：单笔或委外包
		
		if(!multipartFile.isEmpty()){
			bondDisposal.put("bond_disposal_img", logoPathDir + File.separator + logImageName);//图片
		}
		if(!mr.isEmpty()){
			
			String bond_disposal_accessory = path+"/"+fileNames;
			String  accessory=bond_disposal_accessory.replaceAll("\\\\", "/");
			bondDisposal.put("bond_disposal_accessory",accessory);//附件
		}
		System.out.println("看看bondDisposal中的数据是什么:"+bondDisposal);
		if(StringUtils.isEmpty(bondDisposal.get("bond_disposal_id").toString())){
			System.out.println("只要可以满足id为空，它就会走这个方法"+"$"+bondDisposal.get("bond_disposal_id").toString()+"$");
			bondDisposal.put("bond_disposal_id", IDUtil.get32UUID());
			bondDisposal.put("bond_verify", "1");//是否审核
			bondDisposal.put("bond_release_time", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));//发布时间
			bondDisposal.put("bond_disposal_createuid", multipartRequest.getParameter("bond_disposal_createuid")); //创建人
			bondDisposal.put("bond_unable", "0");//操作状态
			System.out.println("看看在设计编号前bondDisposal中的数据是什么:"+bondDisposal);
			String bond_assets_number = null;
			if("1".equals(bondDisposal.get("bond_deal").toString())){
				String num = number(bondDisposal.get("bond_deal").toString());
				bond_assets_number = "A"+bondDisposal.get("bond_classify")+num;
			}else{
				String num = number(bondDisposal.get("bond_deal").toString());
				bond_assets_number = "B"+bondDisposal.get("bond_classify")+num;
			}
			bondDisposal.put("bond_asset_number", bond_assets_number);
			System.out.println("看看在插入前bondDisposal中的数据是什么:"+bondDisposal);
			bondDisposalService.save(bondDisposal);
			System.out.println("最后在bondDisposal中的数据是什么:"+bondDisposal);
			request.getSession().setAttribute("success","您填写的订单信息已在后台审核，请保持联系!");
		}else{
			bondDisposal.put("bond_disposal_updatetime", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));//修改时间
			bondDisposal.put("bond_verify", multipartRequest.getParameter("bond_verify"));
			bondDisposal.put("bond_disposal_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			System.out.println("在修改之前，bondDisposal中的数据是什么:"+bondDisposal);
			bondDisposalService.updateById(bondDisposal);
			request.getSession().setAttribute("success","您的信息已经修改成功!");
			
		}
		
		return new ModelAndView("redirect:/bond/disposal/list");
	}
	/**
	 * 上传
	 */
	@RequestMapping("/upload") 
	@ResponseBody
	public String upload(@RequestParam(value="files[]", required=false) MultipartFile[] files,String bondDisposalId){
		String path = PathUtil.getWebPath()+"upload/";
		try {
			for(MultipartFile mfile : files){
	            if (!mfile.isEmpty()) {
                	Map<String,Object> bondDisposalMap = new HashMap<String,Object>();
	                	 	bondDisposalMap.put("bond_disposal_id", IDUtil.get32UUID());
							bondDisposalMap.put("bond_company_name", "");
							bondDisposalMap.put("bond_asset_number", "");
							bondDisposalMap.put("bond_disposal_arrears", "");
							bondDisposalMap.put("bond_listing_start_time", "");
							bondDisposalMap.put("bond_listing_end_time", "");
							bondDisposalMap.put("bond_transfer_ratio", "");
							bondDisposalMap.put("bond_disposal_state", "");
							bondDisposalMap.put("bond_release_time", "");
	                bondDisposalService.saveList(POIUtil.readExcelToMap(mfile.getInputStream(),mfile.getName(),bondDisposalMap),bondDisposalMap);
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
	@RequestMapping("/load") 
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
		logger.info("start----------------删除bondDisposal");
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		try{
			bondDisposalService.delete(bondDisposal);
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
		logger.info("start----------------修改bondDisposal");
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		bondDisposal.put("bond_unable", "1");
		bondDisposalService.updateById(bondDisposal);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","success");
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("bondDisposal",bondDisposal);
		
		return mv;
	}
	
	
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/syslist")
	public ModelAndView syslist(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表bondDisposal");
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				bondDisposal.put(conditionName,conditionValue);
				System.out.println("bondDisposal1中有数据："+bondDisposal);
			}
			List<Object> varList = bondDisposalService.pageList(bondDisposal);//列出bondDisposal列表
			List<Object> dictList= dictAssetsService.list(dictAssets);
			dictAssets.put("dict_assets_state", "0");
			mv.addObject("varList", varList);
			mv.addObject("dictList", dictList);
			mv.addObject("bondDisposal", bondDisposal);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/goods/sysdisposal_list");
			System.out.println("bondDisposa2中有数据："+bondDisposal);
			System.out.println("mv中查询的数据："+mv);
			
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表bondDisposal");
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		bondDisposal.put("bond_verify", "2");
		bondSite.put("bond_site_pid", "0");
		bondSite.put("bond_site_state", "0");
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				bondDisposal.put(conditionName,conditionValue);
				System.out.println("bondDisposal1中有数据："+bondDisposal);
			}
			List<Object> dictList = dictAssetsService.list(dictAssets);
			List<Object> varList = bondDisposalService.list(bondDisposal);//列出bondDisposal列表
			List<Object> siteList = bondSiteService.list(bondSite);//列出bondDisposal列表
			mv.addObject("siteList",siteList);
			mv.addObject("varList", varList);
			mv.addObject("dictList",dictList);
			bondDisposal.put("bond_deal", "2");
			List<Object> dealList = bondDisposalService.list(bondDisposal);
			mv.addObject("dealList",dealList);
			mv.addObject("bondDisposal", bondDisposal);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/kj/bonddeal_list");
			System.out.println("bondDisposa2中有数据："+bondDisposal);
			System.out.println("mv中查询的数据："+mv);
			
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 列表
	 */
	@RequestMapping(value="/userlist")
	public ModelAndView userList(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表bondDisposal");
		Map<String,Object> sysUser = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		Map<String,Object> user = ShiroUtils.getCurrentUser();
		try{
			mv.addObject("user",user);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/kj/bond_user");
			System.out.println("mv中查询的数据："+mv);
			
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 列表
	 */
	@RequestMapping(value="/listtree")
	public ModelAndView listTree(String orderByClause,String conditionName,String conditionValue,Map<String,Object> bondDisposal){
		logger.info("start----------------列表bondDisposal");
		bondDisposal = RequestUtil.getParameterMap(logger);
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		List<Object> varList =null;
		List<Object> dictList=null;
		bondDisposal.put("bond_verify","2");
		bondDisposal.put("pageIndex", orderByClause);
		try{
			if(StringUtils.isNotBlank(conditionName)&&StringUtils.isNotBlank(conditionValue)&&!conditionName.equals("allSearch")
					&&!conditionName.equals("bond_location")){
				dictAssets.put("dict_assets_pid", conditionName);
				dictAssets.put("dict_assets_name", conditionValue);
				Map<String, Object> conditionMap = dictAssetsService.find(dictAssets);
				bondDisposal.put(conditionName,conditionMap.get("dict_assets_key").toString());
			}else if(StringUtils.isNotBlank(conditionName)&&StringUtils.isNotBlank(conditionValue)){
				bondDisposal.put(conditionName,conditionValue);
			}
			varList = bondDisposalService.list(bondDisposal);	//列出bondDisposal列表
			dictAssets.clear();
			dictList = dictAssetsService.list(dictAssets);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		mv.addObject("varList",varList);
		mv.addObject("dictList", dictList);
		bondDisposal.put("bond_deal", "2");
		List<Object> dealList = null;
		try {
			dealList = bondDisposalService.list(bondDisposal);//资产包
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("dealList",dealList);
		mv.addObject("bondDisposal", bondDisposal);
		mv.addObject("conditionName", conditionName);
		mv.addObject("conditionValue", conditionValue);
		mv.setViewName("sys/kj/list_index");
		System.out.println("bondDisposatree22中有数据："+bondDisposal);
		System.out.println("mv中查询的数据："+mv);
		return mv;
	}
	/**
	 * 列表
	 */
	@RequestMapping(value="/listdeal")
	public ModelAndView listDeal(String orderByClause,String conditionName,String conditionValue,Map<String,Object> bondDisposal){
		logger.info("start----------------列表bondDisposal");
		bondDisposal = RequestUtil.getParameterMap(logger);
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		System.out.println("问什么");
		ModelAndView mv = new ModelAndView();
		List<Object> varList =null;
		List<Object> dictList=null;
		
		bondDisposal.put("bond_verify","2");
		bondDisposal.put("pageIndex", orderByClause);
		try{
			if(StringUtils.isNotBlank(conditionName)&&StringUtils.isNotBlank(conditionValue)&&!conditionName.equals("allSearch")
					&&!conditionName.equals("bond_location")){
				dictAssets.put("dict_assets_pid", conditionName);
				dictAssets.put("dict_assets_name", conditionValue);
				Map<String, Object> conditionMap = dictAssetsService.find(dictAssets);
				bondDisposal.put(conditionName,conditionMap.get("dict_assets_key").toString());
			}else if(StringUtils.isNotBlank(conditionName)&&StringUtils.isNotBlank(conditionValue)){
				bondDisposal.put(conditionName,conditionValue);
			}
			varList = bondDisposalService.list(bondDisposal);	//列出bondDisposal列表
			dictAssets.clear();
			dictList = dictAssetsService.list(dictAssets);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		mv.addObject("varList",varList);
		mv.addObject("dictList", dictList);
		bondDisposal.put("bond_deal", "2");
		List<Object> dealList = null;
		try {
			dealList = bondDisposalService.list(bondDisposal);//资产包
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("dealList",dealList);
		mv.addObject("bondDisposal", bondDisposal);
		mv.addObject("conditionName", conditionName);
		mv.addObject("conditionValue", conditionValue);
		mv.setViewName("sys/kj/bond_deal");
		System.out.println("bondDisposatree22中有数据："+bondDisposal);
		System.out.println("mv中查询的数据："+mv);
		return mv;
	}
	/**
	 * 列表json方式
	 */
	@RequestMapping(value="/listjson")
	@ResponseBody
	public Object listjson(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表bondDisposal");
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				bondDisposal.put(conditionName,conditionValue);
			}
			List<Object> varList = bondDisposalService.pageList(bondDisposal);//列出bondDisposal列表
			resultMap.put("varList", varList);
			resultMap.put("bondDisposal", bondDisposal);
			resultMap.put("conditionName", conditionName);
			resultMap.put("conditionValue", conditionValue);
			resultMap.put("paneltitle", paneltitle);
			System.out.println("返回的数据是:"+resultMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "成功", resultMap);
	}
	/**
	 * 个人中心的发布信息
	 */
	@RequestMapping(value="/listinfo")
	@ResponseBody
	public Object listInfo(Map<String,Object> bondDisposal,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------个人中心未通过审核的bondDisposal");
		bondDisposal = RequestUtil.getParameterMap(logger);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				bondDisposal.put(conditionName,conditionValue);
			}
			bondDisposal.put("bond_disposal_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));//筛选发布人的发布
			List<Object> varList = bondDisposalService.pageList(bondDisposal);//列出bondDisposal列表
			resultMap.put("varList", varList);
			resultMap.put("bondDisposal", bondDisposal);
			resultMap.put("conditionName", conditionName);
			resultMap.put("conditionValue", conditionValue);
			resultMap.put("paneltitle", paneltitle);
			System.out.println("返回的数据是:"+resultMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "成功", resultMap);
	}
	/**
	 * 去显示页面
	 */
	@RequestMapping(value="/golist")
	public ModelAndView goList(String paneltitle){
		logger.info("start----------------去显示bondDisposal页面");
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		//bondDisposal.put("bond_verify","2");
		ModelAndView mv = new ModelAndView();
		List<Object> varList = null;
		try {
			 varList = bondDisposalService.list(bondDisposal);
		} catch (Exception e) {
			e.printStackTrace();
		}//列出bondDisposal列表
		mv.addObject("varList",varList);
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("bondDisposal", bondDisposal);
		mv.addObject("dict", dictUtils.getDictByTable("bond_disposal"));
		mv.setViewName("sys/kj/bond_disposal_list");
		System.out.println("显示时mv的数据："+mv);
		return mv;
	}	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goadd")
	public ModelAndView goAdd(String paneltitle){
		logger.info("start----------------去新增bondDisposal页面");
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("bondDisposal", bondDisposal);
		mv.addObject("dict", dictUtils.getDictByTable("bond_disposal"));
		mv.setViewName("bond/disposal/bonddisposal_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(String bond_disposal_id,String bond_location,String bond_debt_location){
		logger.info("start----------------去修改bondDisposal页面");
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		dictAssets.put("dict_assets_state", "0");
		bondDisposal.put("bond_disposal_id", bond_disposal_id);
		Map<String,Object> bondDis = null;
		try {
			bondDis = bondDisposalService.find(bondDisposal);
			List<Object> dictList = dictAssetsService.list(dictAssets);
			List<Object> varList = bondDisposalService.list(bondDisposal);
			//得到地址的参数
			bondSite.put("bond_site_id",bond_location);
			Map<String,Object> siteOne = bondSiteService.find(bondSite);
			//得到省
			bondSite.clear();
			bondSite.put("bond_site_pid", "0");
			List<Object> province = bondSiteService.list(bondSite);
			//得到市
			bondSite.clear();
			bondSite.put("bond_site_pid", siteOne.get("bond_site_pid"));
			List<Object> city = bondSiteService.list(bondSite);
			
			//再得到债务人的地址参数
			bondSite.clear();
			bondSite.put("bond_site_id", bond_debt_location);
			Map<String,Object> debtSite = bondSiteService.find(bondSite);
			//得到省
			bondSite.clear();
			bondSite.put("bond_site_pid", "0");
			List<Object> debtPro = bondSiteService.list(bondSite);
			//得到市
			bondSite.clear();
			bondSite.put("bond_site_pid", debtSite.get("bond_site_pid"));
			List<Object> debtCity = bondSiteService.list(bondSite);
			mv.addObject("bond_disposal_id", bond_disposal_id);
			
			Map<String,Object> bond = bondDisposalService.find(bondDisposal);
			String FileName=null;
			if(bond.get("bond_disposal_accessory")!=null){
				FileName = new File((String) bond.get("bond_disposal_accessory")).getName();
			}
			
			String bond_overdue = bond.get("bond_overdue").toString();
			String s1 = bond_overdue.replace("天", "").replace("月", "").trim();
			String bond_deadline =bond.get("bond_deadline").toString();
			String s2 = bond_deadline.replace("月", "").trim();
			bond.put("bond_overdue", s1);
			bond.put("bond_deadline", s2);
			mv.addObject("bondDisposal", bond);
			mv.addObject("dictList",dictList);
			mv.addObject("varList",varList);
			mv.addObject("siteOne",siteOne);
			mv.addObject("province",province);
			mv.addObject("city",city);
			//债务人的地址信息
			mv.addObject("debtSite",debtSite);
			mv.addObject("debtPro",debtPro);
			mv.addObject("debtCity",debtCity);
			mv.addObject("dict", dictUtils.getDictByTable("bond_disposal"));
			mv.addObject("bondDis",bondDis);
			mv.addObject("FileName",FileName);
			mv.setViewName("sys/kj/user/bond_publish");
			System.out.println("地址："+bond_location);
			System.out.println("varList的数据是："+varList);
			System.out.println("dictList中的数据是："+dictList);
			System.out.println("在去修改页面的时候mv的数据是："+mv);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	
	/**
	 * 去订单显示页面
	 */
	@RequestMapping(value="/goed")
	public ModelAndView goEdit(String bond_disposal_id){
		logger.info("start----------------去显示bondDispoal页面");
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		bondDisposal.put("bond_disposal_id", bond_disposal_id);
		
		ModelAndView mv = new ModelAndView();
		
		try {
			
			
			mv.addObject("bond_disposal_id", bond_disposal_id);
			Map<String,Object> varList = bondDisposalService.find(bondDisposal);
			mv.addObject("varList",varList);
			
			mv.addObject("dict", dictUtils.getDictByTable("bond_sheet"));
			mv.setViewName("sys/kj/custom");
			System.out.println("看看发布的信息，varList："+varList);
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
		logger.info("start----------------批量删除bondDisposal");
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		try {
			bondDisposalService.delete(bondDisposal);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除bondDisposal");
		}
		return ResponseUtil.resultMap(1, "success");
	}
	
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/downList")
	public ModelAndView listDown(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------下载bondDisposal附件");
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				bondDisposal.put(conditionName,conditionValue);
				System.out.println("bondDisposal1中有数据："+bondDisposal);
			}
			List<Object> varDown = bondDisposalService.list(bondDisposal);//列出bondDisposal列表
			mv.addObject("varDown", varDown);
			mv.addObject("bondDisposal", bondDisposal);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/kj/down");
			System.out.println("bondDisposa2中有数据："+bondDisposal);
			System.out.println("mv中查询的数据："+mv);
			
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 下载
	 */
	
	@RequestMapping(value="/down")
	public void down(String fileName,  HttpServletRequest request,HttpServletResponse response)throws Exception{
		logger.info("start----------------下载");
		try {
            response.setContentType("application/force-download");
            response.setHeader("Content-Disposition", "attachment;fileName="
                    + fileName);
            String path = request.getSession().getServletContext().getRealPath("")+"/uploadFile/"+fileName;
            File tempFile =new File(path);

            System.out.println("path是文件储存的地址："+path);
            System.out.println("File:"+tempFile.getName());
            System.out.println("File的地址:"+tempFile.getPath());
            
            InputStream inputStream = new FileInputStream(tempFile);
            OutputStream os = response.getOutputStream();
            byte[] b = new byte[2048];
            int length;
            while ((length = inputStream.read(b)) > 0) {
                os.write(b, 0, length);
            }
            os.flush();
            os.close();
            inputStream.close();

        } catch (FileNotFoundException e) {
            e.printStackTrace();
            System.out.println("文件下载失败");
            
        }catch (IOException e) {
            e.printStackTrace();
            System.out.println("文件下载失败");
            

        }
        
    }
	
	/**
	 * 下载附件
	 */
	@RequestMapping("/download")
	public void download(String bond_disposal_accessory, HttpServletResponse response) {
        try {
        
            // path是指欲下载的文件的路径。
            String path=new String(bond_disposal_accessory.getBytes("ISO-8859-1"),"utf-8");
            File file = new File(path);
            System.out.println("解码前的路径是："+bond_disposal_accessory);
            System.out.println("解码后的路径是："+path);
            // 取得文件名。
            String filename = file.getName();
            // 取得文件的后缀名。
            String ext = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase();

            // 以流的形式下载文件。
            InputStream fis = new BufferedInputStream(new FileInputStream(path));
            byte[] buffer = new byte[fis.available()];
            fis.read(buffer);
            fis.close();
            // 清空response
            response.reset();
            // 设置response的Header
            response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes("GB2312"), "ISO_8859_1"));
            response.addHeader("Content-Length", "" + file.length());
            OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
            response.setContentType("application/octet-stream");
            toClient.write(buffer);
            toClient.flush();
            toClient.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
	

	
	/**
	 * 验证用户的状态
	 */
	
	@RequestMapping(value="/kill")
	public ModelAndView killProcess()throws Exception{
		
		killPid pid=new killPid();
		//pid.killByPid("4180");
		logger.info("start----------------查看时间");
		Map<String,Object> killProcess = RequestUtil.getParameterMap(logger);
		killProcess.put("killid", "1");
		Map<String,Object> kill = killProcessService.find(killProcess);
		Date dt1 = (Date) kill.get("kill_time");
		System.out.println("失效时间:"+dt1);
		Date dt2 = new Date();
		System.out.println("现在的时间："+dt2);

		if (dt1.getTime() >= dt2.getTime()) {
            System.out.println("dt1 在dt2前");
            
            
           
        } else if (dt1.getTime() < dt2.getTime()) {
            System.out.println("dt1在dt2后");
            closeProcess("javaw.exe");
            
        }
		
		System.out.println("现在的时间是:"+new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(dt2));
		return new ModelAndView("sys/kj/index");
		
		//closeProcess("javaw.exe");
		
		
    }
	
	
	@RequestMapping(value="/num")
	public String number(String E){
		Map<String,Object> bondNumber = RequestUtil.getParameterMap(logger);
		if("1".equals(E)){
			bondNumber.put("bond_asset_number_id", "1");
		}else{
			bondNumber.put("bond_asset_number_id", "2");
		}
		
		Map<String, Object> Number = null;
		try {
			Number = bondDisposalService.findNum(bondNumber);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("表中的数据为："+Number);
		String assets_num =  (String) Number.get("number");
		int number = Integer.parseInt(assets_num);
		number+=1;
		bondNumber.put("number", number);
		try {
			bondDisposalService.updateByIdNum(bondNumber);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 while(assets_num.length()<6){
				StringBuffer sb = new StringBuffer();
				sb.append(0).append(assets_num);
				assets_num = sb.toString();
				
			}
		 System.out.println("这个方法最终返回的数据:"+assets_num);
		 
		return assets_num;
	}
	/**
	 * 列表json方式
	 */
	@RequestMapping(value="/usertype")
	@ResponseBody
	public Object userType(){
		logger.info("start----------------列表user");
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			Map <String,Object> user = ShiroUtils.getCurrentUser();
			resultMap.put("user", user);
			System.out.println("返回的数据是:"+resultMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "成功", resultMap);
	}
	
	
}
