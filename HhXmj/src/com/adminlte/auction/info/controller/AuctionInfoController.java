package com.adminlte.auction.info.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.adminlte.auction.info.service.AuctionInfoService;
import com.adminlte.utils.DictUtils;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.POIUtil;
import com.adminlte.utils.PathUtil;
import com.adminlte.utils.RequestUtil;
import com.adminlte.utils.ResponseUtil;
import com.adminlte.utils.ShiroUtils;


/** 
 * 类名称：auctionInfoController
 * 创建人：Cheng
 * 创建时间：2017-09-11
 */
@Controller
@RequestMapping(value="auction/info")
public class AuctionInfoController{
	private Log logger = LogFactory.getLog(AuctionInfoController.class);
	@Resource(name="auctionInfoService")
	private AuctionInfoService auctionInfoService;
	@Resource(name = "dictUtils")
	private DictUtils dictUtils;

	@RequestMapping(value="/index")
	public ModelAndView toindex()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sys/kj/user/publish");
		return mv;
	}
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save(HttpServletRequest request, ModelMap model) throws Exception{
		logger.info("start----------------新增auctionInfo");
		Map<String,Object> auctionInfo = RequestUtil.getParameterMap(logger);
		auctionInfo.put("auction_info_id", IDUtil.get32UUID());
		auctionInfo.put("auction_info_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		auctionInfo.put("auction_info_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		/**页面控件的文件流**/
		MultipartFile multipartFile = multipartRequest.getFile("idCardFrontImg");
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy/MM/dd/HH");
		/**构建图片保存的目录**/ String logoPathDir = "/files/"+ dateformat.format(new Date());
		/**得到图片保存目录的真实路径**/
		String logoRealPathDir = request.getSession().getServletContext().getRealPath(logoPathDir);
		/**根据真实路径创建目录**/
		File logoSaveFile = new File(logoRealPathDir); if(!logoSaveFile.exists()) logoSaveFile.mkdirs();
		/**页面控件的文件流**/ /**获取文件的后缀**/
		String suffix = multipartFile.getOriginalFilename().substring (multipartFile.getOriginalFilename().lastIndexOf("."));
		// /**使用UUID生成文件名称**/ //
		String logImageName = UUID.randomUUID().toString()+ suffix;
		//构建文件名称
//		logImageName = multipartFile.getOriginalFilename();
		/**拼成完整的文件保存路径加文件**/
		String fileName = logoRealPathDir + File.separator + logImageName;
		File file = new File(fileName);
		try {
			multipartFile.transferTo(file);
		}
		catch (IllegalStateException e)
		{ e.printStackTrace(); }
		catch (IOException e)
		{ e.printStackTrace(); }
		auctionInfo.put("projectName", multipartRequest.getParameter("projectName"));
		auctionInfo.put("projectNO", multipartRequest.getParameter("projectNO"));
		auctionInfo.put("industryOwned", multipartRequest.getParameter("industryOwned"));
		auctionInfo.put("projectLocation", multipartRequest.getParameter("projectLocation"));
		auctionInfo.put("underlyingAssetName", multipartRequest.getParameter("underlyingAssetName"));

		auctionInfo.put("businessNature", multipartRequest.getParameter("businessNature"));
		auctionInfo.put("projectAmount", multipartRequest.getParameter("projectAmount"));
		auctionInfo.put("operation", multipartRequest.getParameter("operation"));
		auctionInfo.put("listingQuantity", multipartRequest.getParameter("listingQuantity"));
		auctionInfo.put("unitPrice", multipartRequest.getParameter("unitPrice"));

		auctionInfo.put("bond", multipartRequest.getParameter("bond"));
		auctionInfo.put("stockRight", multipartRequest.getParameter("stockRight"));
		auctionInfo.put("biddingCycle", multipartRequest.getParameter("biddingCycle"));
		auctionInfo.put("floorPrice", multipartRequest.getParameter("floorPrice"));
		auctionInfo.put("creditorPrincipal", multipartRequest.getParameter("creditorPrincipal"));

		auctionInfo.put("ensurePrincipal", multipartRequest.getParameter("ensurePrincipal"));
		auctionInfo.put("mortgagePrincipal", multipartRequest.getParameter("mortgagePrincipal"));
		auctionInfo.put("pledgePrincipal", multipartRequest.getParameter("pledgePrincipal"));
		auctionInfo.put("creditorInterest", multipartRequest.getParameter("creditorInterest"));
		auctionInfo.put("creditorInterest2", multipartRequest.getParameter("creditorInterest2"));

		auctionInfo.put("importantInfo", multipartRequest.getParameter("importantInfo"));
		auctionInfo.put("listingStart", multipartRequest.getParameter("listingStart"));
		auctionInfo.put("listingEnd", multipartRequest.getParameter("listingEnd"));
		auctionInfo.put("contacts", multipartRequest.getParameter("contacts"));
		auctionInfo.put("contactInformation", multipartRequest.getParameter("contactInformation"));

		auctionInfo.put("notice", multipartRequest.getParameter("notice"));
		auctionInfo.put("idCardFrontImg", logoPathDir + File.separator + logImageName);
		auctionInfo.put("status", "0");
		auctionInfoService.save(auctionInfo);
		return ResponseUtil.resultMap(1, "成功");
	}
	/**
	 * 上传
	 */
	@RequestMapping("/upload") 
	@ResponseBody
	public String upload(@RequestParam(value="files[]", required=false) MultipartFile[] files,String auctionInfoId){
		String path = PathUtil.getWebPath()+"upload/";
		try {
			for(MultipartFile mfile : files){
	            if (!mfile.isEmpty()) {
                	Map<String,Object> auctionInfoMap = new HashMap<String,Object>();
	                	 	auctionInfoMap.put("auction_info_id", IDUtil.get32UUID());
							auctionInfoMap.put("projectName", "");
							auctionInfoMap.put("projectNO", "");
							auctionInfoMap.put("industryOwned", "");
							auctionInfoMap.put("projectLocation", "");
							auctionInfoMap.put("underlyingAssetName", "");
							auctionInfoMap.put("businessNature", "");
							auctionInfoMap.put("projectAmount", "");
							auctionInfoMap.put("operation", "");
							auctionInfoMap.put("listingQuantity", "");
							auctionInfoMap.put("unitPrice", "");
							auctionInfoMap.put("bond", "");
							auctionInfoMap.put("stockRight", "");
							auctionInfoMap.put("biddingCycle", "");
							auctionInfoMap.put("floorPrice", "");
							auctionInfoMap.put("creditorPrincipal", "");
							auctionInfoMap.put("ensurePrincipal", "");
							auctionInfoMap.put("mortgagePrincipal", "");
							auctionInfoMap.put("pledgePrincipal", "");
							auctionInfoMap.put("creditorInterest", "");
							auctionInfoMap.put("creditorInterest2", "");
							auctionInfoMap.put("importantInfo", "");
							auctionInfoMap.put("listingStart", "");
							auctionInfoMap.put("listingEnd", "");
							auctionInfoMap.put("contacts", "");
							auctionInfoMap.put("contactInformation", "");
							auctionInfoMap.put("notice", "");
							auctionInfoMap.put("idCardFrontImg", "");
							auctionInfoMap.put("status", "");
	                auctionInfoService.saveList(POIUtil.readExcelToMap(mfile.getInputStream(),mfile.getName(),auctionInfoMap),auctionInfoMap);
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
		logger.info("start----------------删除auctionInfo");
		Map<String,Object> auctionInfo = RequestUtil.getParameterMap(logger);
		try{
			auctionInfoService.delete(auctionInfo);
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
		logger.info("start----------------修改auctionInfo");
		Map<String,Object> auctionInfo = RequestUtil.getParameterMap(logger);
		auctionInfo.put("auction_info_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
	    auctionInfo.put("auction_info_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
		auctionInfoService.updateById(auctionInfo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","成功");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("auction/info/auctioninfo_list");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表auctionInfo");
		Map<String,Object> auctionInfo = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				auctionInfo.put(conditionName,conditionValue);
			}
			List<Object> varList = auctionInfoService.pageList(auctionInfo);	//列出auctionInfo列表
			mv.addObject("varList", varList);
			mv.addObject("auctionInfo", auctionInfo);
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
		logger.info("start----------------列表auctionInfo");
		Map<String,Object> auctionInfo = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				auctionInfo.put(conditionName,conditionValue);
			}
			List<Object> varList = auctionInfoService.pageList(auctionInfo);	//列出auctionInfo列表
			mv.addObject("varList", varList);
			mv.addObject("auctionInfo", auctionInfo);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
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
		logger.info("start----------------列表auctionInfo");
		Map<String,Object> auctionInfo = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				auctionInfo.put(conditionName,conditionValue);
			}
			List<Object> varList = auctionInfoService.pageList(auctionInfo);	//列出auctionInfo列表
			mv.addObject("varList", varList);
			mv.addObject("auctionInfo", auctionInfo);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("auction/info/auctioninfo_list_tree");
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
		logger.info("start----------------列表auctionInfo");
		Map<String,Object> auctionInfo = RequestUtil.getParameterMap(logger);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				auctionInfo.put(conditionName,conditionValue);
			}
			List<Object> varList = auctionInfoService.pageList(auctionInfo);	//列出auctionInfo列表
			resultMap.put("varList", varList);
			resultMap.put("auctionInfo", auctionInfo);
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
		logger.info("start----------------去新增auctionInfo页面");
		Map<String,Object> auctionInfo = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("auctionInfo", auctionInfo);
		mv.addObject("dict", dictUtils.getDictByTable("auction_info"));
		mv.setViewName("auction/info/auctioninfo_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(String paneltitle){
		logger.info("start----------------去修改auctionInfo页面");
		Map<String,Object> auctionInfo = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("auctionInfo", auctionInfoService.find(auctionInfo));
			
			mv.addObject("dict", dictUtils.getDictByTable("auction_info"));
			mv.setViewName("auction/info/auctioninfo_edit_dialog");
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
		logger.info("start----------------批量删除auctionInfo");
		Map<String,Object> auctionInfo = RequestUtil.getParameterMap(logger);
		try {
			auctionInfoService.delete(auctionInfo);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除auctionInfo");
		}
		return ResponseUtil.resultMap(1, "成功");
	}
}
