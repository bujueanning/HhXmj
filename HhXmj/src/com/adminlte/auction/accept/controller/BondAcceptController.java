package com.adminlte.auction.accept.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.adminlte.auction.sheet.controller.TokenProccessor;
import com.adminlte.auction.sheet.service.BondSheetService;
import com.adminlte.utils.DictUtils;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.POIUtil;
import com.adminlte.utils.PathUtil;
import com.adminlte.utils.RequestUtil;
import com.adminlte.utils.ResponseUtil;
import com.adminlte.utils.ShiroUtils;


/** 
 * 类名称：bondAcceptController
 * 创建人：Cheng
 * 创建时间：2017-10-24
 */
@Controller
@RequestMapping(value="bond/accept")
public class BondAcceptController{
	private Log logger = LogFactory.getLog(BondAcceptController.class);
	@Resource(name="bondAcceptService")
	private BondAcceptService bondAcceptService;
	@Resource(name = "dictUtils")
	private DictUtils dictUtils;
	@Resource(name="bondDisposalService")
	private BondDisposalService bondDisposalService;
	@Resource(name="bondSheetService")
	private BondSheetService bondSheetService;
	@Resource(name="dictAssetsService")
	private DictAssetsService dictAssetsService;
	/**
	 * 跳转到报名页面
	 */
	@RequestMapping(value="/index")
	@ResponseBody
	public Object index(String bond_disposal_id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		logger.info("start----------------报名bondAccept");
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
			mv.setViewName("sys/kj/Registration_accept");
			System.out.println("报名时mv的数据："+mv);
		}else {
			System.out.println("报名数据没有传入进来");
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
   	 request.getSession().removeAttribute("error");
   	 request.getSession().removeAttribute("success");
   	 System.out.println("调用了");
    }
    
    
	/**
	 * 选择处置方时，查看处置方的信息
	 */
	@RequestMapping(value="/listAccept")
	@ResponseBody
	public Object toList(String bond_disposal_id,String bond_accept_id) throws Exception{
		logger.info("start----------------查看处置方bondSheet");
		ModelAndView mv = new ModelAndView();
		
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		Map<String,Object> bondAccept =RequestUtil.getParameterMap(logger);
		
			bondDisposal.put("bond_disposal_id", bond_disposal_id);
			bondAccept.put("bond_accept_id", bond_accept_id);
			List<Object> varList = bondDisposalService.list(bondDisposal);
			List<Object> accList = bondAcceptService.list(bondAccept);
			
			mv.addObject("varList", varList);
			mv.addObject("accList",accList);
			mv.setViewName("sys/kj/Disposal_confirm");
			System.out.println("报名时mv的数据："+mv);
		
		

		return mv;
	}
	/**
	 * 在单选页面提交订单
	 */
	@RequestMapping(value="/accSave")
	@ResponseBody
	public ModelAndView toSave(HttpServletRequest request) throws Exception{
		logger.info("start----------------插入订单bondSheet");
		Map<String,Object> bondAccept =RequestUtil.getParameterMap(logger);
		Map<String,Object> bondSheet =RequestUtil.getParameterMap(logger);
		Map<String,Object> bondDisposal =RequestUtil.getParameterMap(logger);
		bondAccept.put("bond_accept_id", request.getParameter("bond_accept_id"));
		bondDisposal.put("bond_unable", "1");
		Map<String,Object> accList =  bondAcceptService.find(bondAccept);
		System.out.println("能否在accept中，传递id:"+accList);
		
		bondSheet.put("bond_sheet_id",IDUtil.get32UUID());//订单表id
		bondSheet.put("bond_company_name", accList.get("bond_company_name"));//发布方公司名
		bondSheet.put("bond_asset_number", accList.get("bond_asset_number"));//发布方资产编号
		bondSheet.put("bond_accept_name", accList.get("bond_accept_name"));//处置方公司名
		bondSheet.put("bond_accept_property", accList.get("bond_accept_property"));//处置方企业性质
		bondSheet.put("bond_deal_name", accList.get("bond_deal_name"));//处置人
		bondSheet.put("bond_deal_phone", accList.get("bond_deal_phone"));//处置人电话
		//bondSheet.put("bond_deal_type",accList.get("bond_deal_type"));//处置方式
		bondSheet.put("bond_sheet_time", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		bondSheet.put("bond_disposal_createuid", accList.get("bond_disposal_createuid"));
		bondSheet.put("bond_deal_img",accList.get("bond_deal_img"));//图片
		
		bondSheet.put("bond_recipientid", accList.get("bond_accept_createuid"));//接单人
		bondSheet.put("bond_sheet_state", "1");//订单的状态：1_未过期,2_已过期
		bondSheet.put("bond_disposal_id",accList.get("bond_disposal_id"));//得到委外表的资产的id
		bondDisposal.put("bond_disposal_id",accList.get("bond_disposal_id"));
		Map<String,Object> disposal = bondDisposalService.find(bondDisposal);
		bondSheet.put("bond_deal", disposal.get("bond_deal"));//交易类别
		String bond_deadline = (String) disposal.get("bond_deadline");
	    Pattern pattern = Pattern.compile("[^0-9]");
        Matcher matcher = pattern.matcher(bond_deadline);
        String num = matcher.replaceAll("");//得到月份
        Date d=new Date();   
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");  
		int moth = Integer.parseInt(num);
		bondSheet.put("bond_lose_efficacy_time", df.format(new Date(d.getTime() + moth*30L * 24L * 60L * 60L * 1000L)));//过期的时间点
		
		
		
		System.out.println("在这获得了全部的参数"+bondSheet);
		bondSheetService.save(bondSheet);
		bondDisposal.put("bond_disposal_id",request.getParameter("bond_disposal_id"));//确定修改那一条发布信息
		System.out.println("操作修改，bondDisposal:"+bondDisposal);
		bondDisposalService.updateById(bondDisposal);
		bondAccept.clear();
		bondAccept.put("bond_asset_number", accList.get("bond_asset_number"));
		bondAccept.put("bond_choose", "2");
		bondAcceptService.update(bondAccept);
		
		return new ModelAndView("sys/kj/user/user_info");
		
	}
	
	
	
	
	
	
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public ModelAndView save(HttpServletRequest request) throws Exception{
		logger.info("start----------------新增bondAccept");
		Map<String,Object> bondAccept = RequestUtil.getParameterMap(logger);
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		bondAccept.put("bond_accept_id",multipartRequest.getParameter("bond_accept_id"));
		if(StringUtils.isEmpty(bondAccept.get("bond_accept_id").toString())){
			boolean b = isRepeatSubmit(request);//判断用户是否重复提交
			if(b==true){
				System.out.println("请不要重复提交表单");
				request.getSession().setAttribute("error", "请不要重复提交表单!");
				return new ModelAndView("redirect:/sys/kj/index");
			}
		}
		request.getSession().removeAttribute("token");
		
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
			logImageName= UUID.randomUUID().toString()+ suffix;
			String fileName = logoRealPathDir + File.separator + logImageName;
			File file = new File(fileName);
			try {
				multipartFile.transferTo(file);
			}catch (IOException e){
				e.printStackTrace();
			}
		}	
		
		
		bondAccept.put("bond_company_name", multipartRequest.getParameter("bond_company_name"));//发布方公司名
		bondAccept.put("bond_asset_number", multipartRequest.getParameter("bond_asset_number"));//发布方资产编号
		bondAccept.put("bond_accept_name", multipartRequest.getParameter("bond_accept_name"));//处置方公司名
		bondAccept.put("bond_accept_property", multipartRequest.getParameter("bond_accept_property"));//处置方企业性质
		bondAccept.put("bond_deal_name", multipartRequest.getParameter("bond_deal_name"));//处置人
		bondAccept.put("bond_deal_phone", multipartRequest.getParameter("bond_deal_phone"));//处置人电话
		//去掉处置方式
		//bondAccept.put("bond_deal_type", multipartRequest.getParameter("bond_deal_type"));//处置方式
		bondAccept.put("bond_deal_img",logoPathDir + File.separator + logImageName);//图片
		bondAccept.put("bond_disposal_createuid", multipartRequest.getParameter("bond_disposal_createuid"));//发布人id
		bondAccept.put("bond_choose", "1");//未选择处置方
		bondAccept.put("bond_disposal_id", multipartRequest.getParameter("bond_disposal_id"));//资产表id
		
		
		System.out.println("在这个时候，id应该是空的"+bondAccept);
		
		
		if(StringUtils.isEmpty(bondAccept.get("bond_accept_id").toString())){
			System.out.println("看到这，那就是已经走了这一判断");
			bondAccept.put("bond_accept_id", IDUtil.get32UUID());
			bondAccept.put("bond_accept_time", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			bondAccept.put("bond_accept_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			System.out.println("在这获得了全部的参数"+bondAccept);
			bondAcceptService.save(bondAccept);
			request.getSession().setAttribute("success","您填写的报名信息已在后台审核，请保持联系!");
		}else{
			bondAccept.put("bond_accept_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    bondAccept.put("bond_accept_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			bondAcceptService.updateById(bondAccept);
			request.getSession().setAttribute("success","您的信息已经修改成功!");
		}
		
		return new ModelAndView("redirect:/sys/kj/index");
	}
	/**
	 * 上传
	 */
	@RequestMapping("/upload") 
	@ResponseBody
	public String upload(@RequestParam(value="files[]", required=false) MultipartFile[] files,String bondAcceptId){
		String path = PathUtil.getWebPath()+"upload/";
		try {
			for(MultipartFile mfile : files){
	            if (!mfile.isEmpty()) {
                	Map<String,Object> bondAcceptMap = new HashMap<String,Object>();
	                	 	bondAcceptMap.put("bond_accept_id", IDUtil.get32UUID());
							bondAcceptMap.put("bond_company_name", "");
							bondAcceptMap.put("bond_asset_number", "");
							bondAcceptMap.put("bond_accept_time", "");
							bondAcceptMap.put("bond_accept_name", "");
							bondAcceptMap.put("bond_accept_property", "");
							bondAcceptMap.put("bond_deal_name", "");
							bondAcceptMap.put("bond_deal_phone", "");
	                bondAcceptService.saveList(POIUtil.readExcelToMap(mfile.getInputStream(),mfile.getName(),bondAcceptMap),bondAcceptMap);
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
		logger.info("start----------------删除bondAccept");
		Map<String,Object> bondAccept = RequestUtil.getParameterMap(logger);
		try{
			bondAcceptService.delete(bondAccept);
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
		logger.info("start----------------修改bondAccept");
		Map<String,Object> bondAccept = RequestUtil.getParameterMap(logger);
		bondAccept.put("bond_accept_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
	    bondAccept.put("bond_accept_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
		bondAcceptService.updateById(bondAccept);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","success");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("bond/accept/bondaccept_list");
		return mv;
	}
	
	/**
	 * 显示数据在选择处置方页面
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(String bond_disposal_id,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表bondAccept");
		Map<String,Object> bondAccept = RequestUtil.getParameterMap(logger);
		Map<String,Object> bondDisposal = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		bondAccept.put("bond_disposal_id", bond_disposal_id);
		bondDisposal.put("bond_disposal_id", bond_disposal_id);
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				bondAccept.put(conditionName,conditionValue);
			}
			
			List<Object> accList = bondAcceptService.list(bondAccept);	//列出bondAccept列表
			List<Object> disList = bondDisposalService.list(bondDisposal);	//列出bondDisposal列表
			mv.addObject("accList", accList);
			mv.addObject("disList", disList);
			mv.addObject("bondAccept", bondAccept);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/kj/xz_custom");
			System.out.println("accept里mv中的数据是："+mv);
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
		logger.info("start----------------列表bondAccept");
		Map<String,Object> bondAccept = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				bondAccept.put(conditionName,conditionValue);
			}
			bondAccept.put("bond_disposal_createuid",ShiroUtils.getCurrentUser().get("sys_user_id"));
			bondAccept.put("bond_choose", "1");//选择还没有确定处置方的显示
			List<Object> accList = bondAcceptService.list(bondAccept);	//列出bondAccept列表
			mv.addObject("accList", accList);
			mv.addObject("bondAccept", bondAccept);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/kj/bond_sheet_list");
			System.out.println("查看资产委外信息，mv："+mv);
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
		logger.info("start----------------列表bondAccept");
		Map<String,Object> bondAccept = RequestUtil.getParameterMap(logger);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		bondAccept.put("pageIndex", pageIndex);
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				bondAccept.put(conditionName,conditionValue);
			}
			bondAccept.put("bond_disposal_createuid",ShiroUtils.getCurrentUser().get("sys_user_id"));
			bondAccept.put("bond_choose", "1");//选择还没有确定处置方的显示
			List<Object> varList = bondAcceptService.pageList(bondAccept);	//列出bondAccept列表
			resultMap.put("varList", varList);
			resultMap.put("bondAccept", bondAccept);
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
		logger.info("start----------------去新增bondAccept页面");
		Map<String,Object> bondAccept = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("bondAccept", bondAccept);
		mv.addObject("dict", dictUtils.getDictByTable("bond_accept"));
		mv.setViewName("bond/accept/bondaccept_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(String paneltitle){
		logger.info("start----------------去修改bondAccept页面");
		Map<String,Object> bondAccept = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("bondAccept", bondAcceptService.find(bondAccept));
			
			mv.addObject("dict", dictUtils.getDictByTable("bond_accept"));
			mv.setViewName("bond/accept/bondaccept_edit_dialog");
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
		logger.info("start----------------批量删除bondAccept");
		Map<String,Object> bondAccept = RequestUtil.getParameterMap(logger);
		try {
			bondAcceptService.delete(bondAccept);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除bondAccept");
		}
		return ResponseUtil.resultMap(1, "success");
	}
}
