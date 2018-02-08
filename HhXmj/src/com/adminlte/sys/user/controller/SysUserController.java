package com.adminlte.sys.user.controller;

import java.io.File;
import java.io.IOException;
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

import com.adminlte.auction.site.service.BondSiteService;
import com.adminlte.sys.file.service.SysFileService;
import com.adminlte.sys.user.role.service.SysUserRoleService;
import com.adminlte.sys.user.service.SysUserService;
import com.adminlte.utils.DictUtils;
import com.adminlte.utils.EndecryptUtils;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.POIUtil;
import com.adminlte.utils.PathUtil;
import com.adminlte.utils.RequestUtil;
import com.adminlte.utils.ResponseUtil;
import com.adminlte.utils.ShiroUtils;


/** 
 * 类名称：sysUserController
 * 创建人：Cheng
 * 创建时间：2017-04-18
 */
@Controller
@RequestMapping(value="sys/user")
public class SysUserController{
	private Log logger = LogFactory.getLog(SysUserController.class);
	@Resource(name="sysUserService")
	private SysUserService sysUserService;
	@Resource(name="sysUserRoleService")
	private SysUserRoleService sysUserRoleService;
	@Resource(name = "dictUtils")
	private DictUtils dictUtils;
	@Resource(name="bondSiteService")
	private BondSiteService bondSiteService;
	@Resource(name="sysFileService")
	private SysFileService sysFileService;
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save(@RequestParam(value = "sys_file_1", required = false) MultipartFile sys_file_1,
			@RequestParam(value = "sys_file_2", required = false) MultipartFile sys_file_2, HttpServletRequest request) throws Exception{
		logger.info("start----------------新增sysUser");
		Map<String, Object> sysUser = new HashMap<String, Object>();
		Map<String, String[]> sysUsers = request.getParameterMap();
		for (String key : sysUsers.keySet()) {
			System.out.println("key= " + key + " and value= " + sysUsers.get(key));
			sysUser.put(key, sysUsers.get(key)[0]);
		}
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		Map<String, Object> sysUserOld = new HashMap<String, Object>();
		Map<String, Object> sysFile = new HashMap<String, Object>();
		sysUserOld.put("sys_user_account", sysUser.get("sys_user_account"));
		sysUserOld = sysUserService.find(sysUserOld);
		if(StringUtils.isEmpty(sysUser.get("sys_user_id").toString())){
			if(sysUserOld != null){
				return ResponseUtil.resultMap(2, "帐号已存在");
			}else{
				sysUser.put("sys_user_id", IDUtil.get32UUID());
				sysUser.put("sys_user_password", EndecryptUtils.passwordMd5(sysUser.get("sys_user_password").toString(), sysUser.get("sys_user_account").toString()));
				sysUser.put("sys_user_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
				sysUser.put("sys_user_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
				bondSite.put("bond_site_id", sysUser.get("sys_area_id"));
				if(sysUser.get("sys_user_reg_type_d").equals("a55c6e261e774082bbd5521130c5c1e6")){
					bondSite.put("join_site", "1");
				}
				sysUserService.save(sysUser);
				bondSiteService.updateById(bondSite);
				//修改上传图片的路径
				String sys_user_id = (String) sysUser.get("sys_user_id");
				String filePath = PathUtil.getWebPath("dist/sysfiles/" + sysUser.get("sys_user_id").toString() + "/");
				sysFile.put("sys_user_id", sys_user_id);
				Map<String,Object> testFile = sysFileService.find(sysFile);
				if (sys_file_1 != null) {
					FileUtils.copyToFile(sys_file_1.getInputStream(),
							new File(filePath + "1" + sys_file_1.getOriginalFilename()));
					//sysUser.put("sys_file_1", "dist/sysfiles/" + sysUser.get("sys_user_id").toString() + "/" + "1"
						//	+ sys_file_1.getOriginalFilename());
					sysFile.put("sys_file1_name", sys_file_1.getOriginalFilename());
					sysFile.put("sys_file1_addr", "dist/sysfiles/" + sysUser.get("sys_user_id").toString() + "/" + "1"
							+ sys_file_1.getOriginalFilename());
				}
				if (sys_file_2 != null) {
					FileUtils.copyToFile(sys_file_2.getInputStream(),
							new File(filePath + "2" + sys_file_2.getOriginalFilename()));
					//sysUser.put("sys_file_2", "dist/sysfiles/" + sysUser.get("sys_user_id").toString() + "/" + "2"
						//	+ sys_file_2.getOriginalFilename());
					
					sysFile.put("sys_file2_name", sys_file_2.getOriginalFilename());
					sysFile.put("sys_file2_addr", "dist/sysfiles/" + sysUser.get("sys_user_id").toString() + "/" + "2"
							+ sys_file_2.getOriginalFilename());
					
				}
				if(testFile!=null){
					sysFile.put("sys_file_id", testFile.get("sys_file_id"));
					sysFile.put("sys_file_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
				    sysFile.put("sys_file_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
				    sysFileService.updateById(sysFile);
				}else{
					sysFile.put("sys_file_id", IDUtil.get32UUID());
					sysFile.put("sys_file_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
				    sysFile.put("sys_file_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
				    sysFileService.save(sysFile);
				}
				
			}
		}else{
			
			sysUser.put("sys_user_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    sysUser.put("sys_user_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
		    //得到修改加盟方前的地址
		    Map<String, Object> user = new HashMap<String, Object>();
		    user.put("sys_user_id", sysUser.get("sys_user_id"));
		    String before_site = sysUserService.find(user).get("sys_area_id").toString();
		    System.out.println("加盟方的之前地址："+before_site);
			sysUserService.updateById(sysUser);
			
			//在修改加盟方地址时，将修改后的地址变成已经占用
			
			if(sysUser.get("sys_user_reg_type_d").equals("a55c6e261e774082bbd5521130c5c1e6")){
				bondSite.put("bond_site_id", sysUser.get("sys_area_id"));
				bondSite.put("join_site", "1");
				bondSiteService.updateById(bondSite);
				bondSite.clear();
				bondSite.put("bond_site_id", before_site);
				bondSite.put("join_site", "0");
				bondSiteService.updateById(bondSite);
			}
			//修改上传图片的路径
			String sys_user_id = (String) sysUser.get("sys_user_id");
			String filePath = PathUtil.getWebPath("dist/sysfiles/" + sysUser.get("sys_user_id").toString() + "/");
			sysFile.put("sys_user_id", sys_user_id);
			Map<String,Object> testFile = sysFileService.find(sysFile);
			if (sys_file_1 != null) {
				FileUtils.copyToFile(sys_file_1.getInputStream(),
						new File(filePath + "1" + sys_file_1.getOriginalFilename()));
				//sysUser.put("sys_file_1", "dist/sysfiles/" + sysUser.get("sys_user_id").toString() + "/" + "1"
					//	+ sys_file_1.getOriginalFilename());
				sysFile.put("sys_file1_name", sys_file_1.getOriginalFilename());
				sysFile.put("sys_file1_addr", "dist/sysfiles/" + sysUser.get("sys_user_id").toString() + "/" + "1"
						+ sys_file_1.getOriginalFilename());
			}
			if (sys_file_2 != null) {
				FileUtils.copyToFile(sys_file_2.getInputStream(),
						new File(filePath + "2" + sys_file_2.getOriginalFilename()));
				//sysUser.put("sys_file_2", "dist/sysfiles/" + sysUser.get("sys_user_id").toString() + "/" + "2"
					//	+ sys_file_2.getOriginalFilename());
				
				sysFile.put("sys_file2_name", sys_file_2.getOriginalFilename());
				sysFile.put("sys_file2_addr", "dist/sysfiles/" + sysUser.get("sys_user_id").toString() + "/" + "2"
						+ sys_file_2.getOriginalFilename());
				
			}
			if(testFile!=null){
				sysFile.put("sys_file_id", testFile.get("sys_file_id"));
				sysFile.put("sys_file_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			    sysFile.put("sys_file_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			    sysFileService.updateById(sysFile);
			}else{
				sysFile.put("sys_file_id", IDUtil.get32UUID());
				sysFile.put("sys_file_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			    sysFile.put("sys_file_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			    sysFileService.save(sysFile);
			}
		}
		return ResponseUtil.resultMap(1, "成功");
	}
//	@RequestMapping(value="/filesave")
//	@ResponseBody
//	public Object fileSave(@RequestParam("sys_file_1") MultipartFile multipartFile,HttpServletRequest request) throws Exception{
//		logger.info("start----------------新增sysUser");
//		Map<String, Object> sysUser = new HashMap<String, Object>();
//		Map<String, String[]> sysUsers = request.getParameterMap();
//		for (String key : sysUsers.keySet()) {
//			System.out.println("key= " + key + " and value= " + sysUsers.get(key));
//			sysUser.put(key, sysUsers.get(key)[0]);
//		}
//		sysUser.put("sys_user_id", request.getParameter("sys_user_id"));
//		Map<String, Object> sysFile = new HashMap<String, Object>();
//		if(StringUtils.isEmpty(sysUser.get("sys_user_id").toString())){
//			
//		}else{
//			String logoPathDir = null;
//			String logImageName =null;
//			/*
//			 * 上传图片的创建
//			 * */
//			if(!multipartFile.isEmpty()){
//				SimpleDateFormat dateformat = new SimpleDateFormat("yyyy/MM/dd/HH");
//				logoPathDir = "files/"+ dateformat.format(new Date());
//				String logoRealPathDir = request.getSession().getServletContext().getRealPath(logoPathDir);
//				File logoSaveFile = new File(logoRealPathDir);
//				if(!logoSaveFile.exists()) logoSaveFile.mkdirs();
//				String suffix = multipartFile.getOriginalFilename().substring (multipartFile.getOriginalFilename().lastIndexOf("."));
//				logImageName = UUID.randomUUID().toString()+ suffix;
//				String fileName = logoRealPathDir + File.separator + logImageName;
//				File file = new File(fileName);
//				try {
//					multipartFile.transferTo(file);
//				}catch (IOException e){
//					e.printStackTrace();
//				}
//				sysFile.put("sys_user_id", sysUser.get("sys_user_id"));
//				sysFile.put("sys_file_id", sysFileService.find(sysFile).get("sys_file_id"));
//				sysFile.put("sys_file1_name", multipartFile.getOriginalFilename());
//				sysFile.put("sys_file1_addr", logoPathDir + File.separator + logImageName);
//				sysFileService.updateById(sysFile);
//			}
//		}
//		return ResponseUtil.resultMap(1, "成功");
//	}
	@RequestMapping("/upload") 
	@ResponseBody
	public String upload(@RequestParam(value="files[]", required=false) MultipartFile[] files,String sysUserId){
		String path = PathUtil.getWebPath()+"upload/";
		try {
			for(MultipartFile mfile : files){
	            if (!mfile.isEmpty()) {
                	Map<String,Object> sysUserMap = new HashMap<String,Object>();
	                	 	sysUserMap.put("sys_user_id", IDUtil.get32UUID());
							sysUserMap.put("sys_user_name", "");
							sysUserMap.put("sys_user_account", "");
							sysUserMap.put("sys_user_password", "");
							sysUserMap.put("sys_user_login_date", "");
							sysUserMap.put("sys_user_login_ip", "");
							sysUserMap.put("sys_user_status_d", "");
							sysUserMap.put("sys_user_card", "");
							sysUserMap.put("sys_user_flag_c", "");
							sysUserMap.put("sys_user_reg_date", "");
							sysUserMap.put("sys_user_reg_type_d", "");
							sysUserMap.put("sys_area_id", "");
							sysUserMap.put("sys_org_id", "");
							sysUserMap.put("sys_user_createdate", "");
							sysUserMap.put("sys_user_updatedate", "");
							sysUserMap.put("sys_user_createuid", "");
							sysUserMap.put("sys_user_updateuid", "");
	                sysUserService.saveList(POIUtil.readExcelToMap(mfile.getInputStream(),mfile.getName(),sysUserMap),sysUserMap);
	            }
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "成功";
	}
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
		logger.info("start----------------删除sysUser");
		Map<String,Object> sysUser = RequestUtil.getParameterMap(logger);
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		try{
			//在加盟方删除之后，将地址中的无法添加去掉
			Map<String,Object> use = sysUserService.find(sysUser);
			String sys_user_reg_type_d =  (String) use.get("sys_user_reg_type_d");
			//加盟方id
			String reg_type = "a55c6e261e774082bbd5521130c5c1e6";
			if(reg_type.equals(sys_user_reg_type_d)){
				bondSite.put("bond_site_id", use.get("sys_area_id"));
				bondSite.put("join_site", "0");
				bondSiteService.updateById(bondSite);
			}
			sysUserService.delete(sysUser);
			Map<String,Object> sysUserRole = new HashMap<String,Object>();
			sysUserRole.put("sys_user_id", sysUser.get("sys_user_id"));
			sysUserRoleService.delete(sysUserRole);
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
		logger.info("start----------------修改sysUser");
		Map<String,Object> sysUser = RequestUtil.getParameterMap(logger);
		sysUser.put("sys_user_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
	    sysUser.put("sys_user_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
		sysUserService.updateById(sysUser);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","成功");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("sys/user/sysuser_list");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Map<String,Object> sysUser,String paneltitle){
		logger.info("start----------------列表sysUser");
		sysUser = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			List<Object> varList = sysUserService.pageList(sysUser);	//列出sysUser列表
			mv.addObject("varList", varList);
			mv.addObject("sysUser", sysUser);
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("dict", dictUtils.getDictByTable("sys_user"));
			mv.setViewName("sys/user/sysuser_list");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 用户查询列表
	 */
	@RequestMapping(value="/query")
	public ModelAndView query(Map<String,Object> sysUser,String paneltitle){
		logger.info("start----------------列表sysUser");
		sysUser = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			List<Object> varList = sysUserService.pageList(sysUser);	//列出sysUser列表
			mv.addObject("varList", varList);
			mv.addObject("sysUser", sysUser);
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("dict", dictUtils.getDictByTable("sys_user"));
			mv.setViewName("sys/user/sysuser_query");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goeditquery")
	public ModelAndView goeditquery(String paneltitle){
		logger.info("start----------------去修改sysUser页面");
		Map<String,Object> sysUser = RequestUtil.getParameterMap(logger);
		Map<String,Object> sysFile = RequestUtil.getParameterMap(logger);
		String sys_user_id ="";
		try {
			sys_user_id = sysUserService.find(sysUser).get("sys_user_id").toString();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		sysFile.put("sys_user_id",sys_user_id);
		Map<String,Object> file = null;
		ModelAndView mv = new ModelAndView();
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		bondSite.put("bond_site_state", 0);
		bondSite.put("bond_site_pid","0");
		//省的集合
		List<Object> siteList =null; 
		List<Object> join = null;
		Map <String,Object> siteOne = null;
		List<Object> city = null;
		String location = null;
		try {
			siteList = bondSiteService.list(bondSite);
			if(!"-1".equals(sysUserService.find(sysUser).get("sys_area_id"))){
				bondSite.clear();
				//得到咨询的地址
				bondSite.put("bond_site_id",sysUserService.find(sysUser).get("sys_area_id"));
				siteOne = bondSiteService.find(bondSite);
				//得到市的集合
				bondSite.clear();
				bondSite.put("bond_site_pid", siteOne.get("bond_site_pid"));
				city = bondSiteService.list(bondSite);
				//获得已经被加盟的地址
				bondSite.clear();
				bondSite.put("join_site", "1");
				join = bondSiteService.list(bondSite);
			}else{
				location = "-1";
			}
			file = sysFileService.find(sysFile);
			mv.addObject("file",file);
			mv.addObject("join", join);
			mv.addObject("siteList",siteList);
			mv.addObject("city",city);
			mv.addObject("siteOne",siteOne);
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("sysUser", sysUserService.find(sysUser));
			mv.addObject("location", location);
			mv.addObject("dict", dictUtils.getDictByTable("sys_user"));
			mv.setViewName("sys/user/sysuser_edit_query_dialog");
			System.out.println("用户管理修改时的数据："+mv);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	/**
	 * 列表
	 */
	@RequestMapping(value="/listtree")
	public ModelAndView listTree(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表sysUser");
		Map<String,Object> sysUser = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				sysUser.put(conditionName,conditionValue);
			}
			List<Object> varList = sysUserService.pageList(sysUser);	//列出sysUser列表
			mv.addObject("varList", varList);
			mv.addObject("sysUser", sysUser);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/user/sysuser_list_tree");
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
		logger.info("start----------------列表sysUser");
		Map<String,Object> sysUser = RequestUtil.getParameterMap(logger);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				sysUser.put(conditionName,conditionValue);
			}
			List<Object> varList = sysUserService.pageList(sysUser);	//列出sysUser列表
			resultMap.put("varList", varList);
			resultMap.put("sysUser", sysUser);
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
	@RequestMapping(value="/gotype")
	public ModelAndView goType(String paneltitle){
		logger.info("start----------------去选择sysUser页面");
		Map<String,Object> sysUser = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("paneltitle",paneltitle);
		mv.addObject("sysUser", sysUser);
		mv.addObject("dict", dictUtils.getDictByTable("sys_user"));
		mv.setViewName("sys/user/sysuser_type");
		return mv;
	}	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goadd")
	public ModelAndView goAdd(String sys_user_reg_type_d){
		logger.info("start----------------去新增sysUser页面");
		Map<String,Object> sysUser = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		//地址
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		bondSite.put("bond_site_state", "0");
		bondSite.put("bond_site_pid", "0");
		List<Object> siteList = null;
		List<Object> join = null;
		try {
			siteList = bondSiteService.list(bondSite);
			
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		if("a55c6e261e774082bbd5521130c5c1e6".equals(sys_user_reg_type_d)){
			sysUser.put("sys_user_reg_type_d", "a55c6e261e774082bbd5521130c5c1e6");
			try {
				//获得已经被加盟的地址
				bondSite.clear();
				bondSite.put("join_site", "1");
				join = bondSiteService.list(bondSite);
			} catch (Exception e) {
				logger.error(e.toString(), e);
			}
		}
		mv.addObject("siteList",siteList);
		mv.addObject("paneltitle","添加");
		mv.addObject("join", join);
		mv.addObject("sysUser", sysUser);
		mv.addObject("dict", dictUtils.getDictByTable("sys_user"));
		mv.setViewName("sys/user/sysuser_edit_dialog");
		return mv;
	}	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goadd1")
	public ModelAndView goAdd1(String paneltitle){
		logger.info("start----------------去用户新增sysUser页面");
		Map<String,Object> sysUser = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		//地址
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		sysUser.put("sys_user_reg_type_d", "-1");
		bondSite.put("bond_site_state", "0");
		bondSite.put("bond_site_pid", "0");
		List<Object> siteList = null;
		try {
			siteList = bondSiteService.list(bondSite);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		mv.addObject("siteList", siteList);
		mv.addObject("paneltitle", "添加");
		mv.addObject("sysUser", sysUser);
		mv.addObject("dict", dictUtils.getDictByTable("sys_user"));
		mv.setViewName("sys/user/sysuser_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(String paneltitle){
		logger.info("start----------------去修改sysUser页面");
		Map<String,Object> sysUser = RequestUtil.getParameterMap(logger);
		Map<String,Object> sysFile = RequestUtil.getParameterMap(logger);
		String sys_user_id ="";
		try {
			sys_user_id = sysUserService.find(sysUser).get("sys_user_id").toString();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		sysFile.put("sys_user_id",sys_user_id);
		Map<String,Object> file = null;
		ModelAndView mv = new ModelAndView();
		//地址
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		bondSite.put("bond_site_state", "0");
		bondSite.put("bond_site_pid", "0");
		List<Object> siteList = null;
		Map<String,Object>siteOne = null;
		List<Object> city = null;
		try {
			siteList = bondSiteService.list(bondSite);
			if(!"-1".equals(sysUserService.find(sysUser).get("sys_area_id"))){
				bondSite.clear();
				//得到咨询的地址
				bondSite.put("bond_site_id",sysUserService.find(sysUser).get("sys_area_id"));
				siteOne = bondSiteService.find(bondSite);
				//得到市的集合
				bondSite.clear();
				bondSite.put("bond_site_pid", siteOne.get("bond_site_pid"));
				city = bondSiteService.list(bondSite);
			}
			file = sysFileService.find(sysFile);
			mv.addObject("file",file);
			mv.addObject("siteList", siteList);
			mv.addObject("siteOne", siteOne);
			mv.addObject("city", city);
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("sysUser", sysUserService.find(sysUser));
			mv.addObject("dict", dictUtils.getDictByTable("sys_user"));
			mv.setViewName("sys/user/sysuser_edit_dialog");
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
		logger.info("start----------------批量删除sysUser");
		Map<String,Object> sysUser = RequestUtil.getParameterMap(logger);
		try {
			sysUserService.delete(sysUser);
			Map<String,Object> sysUserRole = new HashMap<String,Object>();
			sysUserRole.put("userids", sysUser.get("ids"));
			sysUserRoleService.delete(sysUserRole);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除sysUser");
		}
		return ResponseUtil.resultMap(1, "成功");
	}
	/**
	 * 去角色配置页面
	 */
	@RequestMapping(value="/gouserroleconf")
	public ModelAndView goUserRoleConf(String sys_user_id,String paneltitle){
		logger.info("start----------------去修改sysUser页面");
		ModelAndView mv = new ModelAndView();
		try {
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("sys_user_id", sys_user_id);
			mv.setViewName("sys/user/sysuser_role_tree");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	/**
	 * 获取拥有的角色
	 */
	@RequestMapping(value="/getuserroleselect")
	@ResponseBody
	public List<Object> getUserRoleSelect(){
		logger.info("start----------------去修改sysUser页面");
		Map<String,Object> sysUser = RequestUtil.getParameterMap(logger);
		sysUser.put("sys_user_role_type", "selected");
		List<Object> sysUserRoleList = new ArrayList<Object>();
		try {
			sysUserRoleList = sysUserRoleService.list(sysUser);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return sysUserRoleList;
	}
	/**
	 * 保存用户角色表
	 */
	@RequestMapping(value="/saveuserrole")
	@ResponseBody
	public Object saveUserRole(@RequestBody List<Map<String,Object>> sysUserRoleList,String sys_user_id){
		logger.info("start----------------去修改sysUser页面");
		try {
			sysUserRoleService.saveUserRole(sysUserRoleList, sys_user_id);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return "成功";
	}
}
