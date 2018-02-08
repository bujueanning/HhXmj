package com.adminlte.auction.site.controller;

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

import com.adminlte.auction.site.service.BondSiteService;
import com.adminlte.utils.DictUtils;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.POIUtil;
import com.adminlte.utils.PathUtil;
import com.adminlte.utils.RequestUtil;
import com.adminlte.utils.ResponseUtil;
import com.adminlte.utils.ShiroUtils;


/** 
 * 类名称：bondSiteController
 * 创建人：Cheng
 * 创建时间：2017-11-13
 */
@Controller
@RequestMapping(value="bond/site")
public class BondSiteController{
	private Log logger = LogFactory.getLog(BondSiteController.class);
	@Resource(name="bondSiteService")
	private BondSiteService bondSiteService;
	@Resource(name = "dictUtils")
	private DictUtils dictUtils;
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save() throws Exception{
		logger.info("start----------------新增bondSite");
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		if(StringUtils.isEmpty(bondSite.get("bond_site_id").toString())){
			bondSite.put("bond_site_id", IDUtil.get32UUID());
			bondSite.put("bond_site_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			bondSite.put("bond_site_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			bondSiteService.save(bondSite);
		}else{
			bondSite.put("bond_site_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    bondSite.put("bond_site_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			bondSiteService.updateById(bondSite);
		}
		
		return ResponseUtil.resultMap(1, "success");
	}
	/**
	 * 上传
	 */
	@RequestMapping("/upload") 
	@ResponseBody
	public String upload(@RequestParam(value="files[]", required=false) MultipartFile[] files,String bondSiteId){
		String path = PathUtil.getWebPath()+"upload/";
		try {
			for(MultipartFile mfile : files){
	            if (!mfile.isEmpty()) {
                	Map<String,Object> bondSiteMap = new HashMap<String,Object>();
	                	 	bondSiteMap.put("bond_site_id", IDUtil.get32UUID());
							bondSiteMap.put("bond_site_pid", "");
							bondSiteMap.put("bond_location_name", "");
							bondSiteMap.put("bond_site_state", "");
	                bondSiteService.saveList(POIUtil.readExcelToMap(mfile.getInputStream(),mfile.getName(),bondSiteMap),bondSiteMap);
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
		logger.info("start----------------删除bondSite");
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		try{
			bondSiteService.delete(bondSite);
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
		logger.info("start----------------修改bondSite");
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		bondSite.put("bond_site_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
	    bondSite.put("bond_site_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
		bondSiteService.updateById(bondSite);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","success");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("bond/site/bondsite_list");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表bondSite");
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				bondSite.put(conditionName,conditionValue);
			}
			List<Object> varList = bondSiteService.pageList(bondSite);	//列出bondSite列表
			mv.addObject("varList", varList);
			mv.addObject("bondSite", bondSite);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("bond/site/bondsite_list");
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
		logger.info("start----------------列表bondSite");
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				bondSite.put(conditionName,conditionValue);
			}
			List<Object> varList = bondSiteService.pageList(bondSite);	//列出bondSite列表
			mv.addObject("varList", varList);
			mv.addObject("bondSite", bondSite);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("bond/site/bondsite_list_tree");
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
	public Object listjson(String bond_site,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表bondSite");
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		bondSite.clear();
		bondSite.put("bond_site_pid", bond_site);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				bondSite.put(conditionName,conditionValue);
			}
			List<Object> varList = bondSiteService.list(bondSite);	//列出bondSite列表
			resultMap.put("varList", varList);
			resultMap.put("bondSite", bondSite);
			resultMap.put("conditionName", conditionName);
			resultMap.put("conditionValue", conditionValue);
			resultMap.put("paneltitle", paneltitle);
			System.out.println("市级菜单："+resultMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "成功", resultMap);
	}
	/**
	 * 列表json显示修改页面
	 */
	@RequestMapping(value="/upjson")
	@ResponseBody
	public Object upjson(String bond_site,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------修改信息bondSite");
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		bondSite.put("bond_site_id", bond_site);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				bondSite.put(conditionName,conditionValue);
			}
			List<Object> varList = bondSiteService.list(bondSite);	//列出bondSite列表
			resultMap.put("varList", varList);
			resultMap.put("bondSite", bondSite);
			resultMap.put("conditionName", conditionName);
			resultMap.put("conditionValue", conditionValue);
			resultMap.put("paneltitle", paneltitle);
			System.out.println("市级菜单："+resultMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "成功", resultMap);
	}
	/**
	 * 去新增页面传数据
	 */
	@RequestMapping(value="/addjson")
	@ResponseBody
	public Object goAddJson(String paneltitle){
		logger.info("start----------------去新增bondSite页面,传递已经被确定的加盟商地址");
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		bondSite.put("join_site", "1");
		List<Object> join = null;
		try{
			join = bondSiteService.list(bondSite);
			resultMap.put("join", join);
			resultMap.put("bondSite", bondSite);
			
			
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		
		
		return ResponseUtil.resultMap(1, "成功", resultMap);
	}	
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goadd")
	public ModelAndView goAdd(String paneltitle){
		logger.info("start----------------去新增bondSite页面");
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("bondSite", bondSite);
		mv.addObject("dict", dictUtils.getDictByTable("bond_site"));
		mv.setViewName("bond/site/bondsite_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(String paneltitle){
		logger.info("start----------------去修改bondSite页面");
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("bondSite", bondSiteService.find(bondSite));
			
			mv.addObject("dict", dictUtils.getDictByTable("bond_site"));
			mv.setViewName("bond/site/bondsite_edit_dialog");
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
		logger.info("start----------------批量删除bondSite");
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		try {
			bondSiteService.delete(bondSite);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除bondSite");
		}
		return ResponseUtil.resultMap(1, "success");
	}
	/**
	 * 树列表
	 */
	@RequestMapping(value="/tree")
	public ModelAndView tree(String paneltitle){
		logger.info("start----------------列表bondSite");
		ModelAndView mv = new ModelAndView();
		try{
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("dict", dictUtils.getDictByTable("bond_site"));
			mv.setViewName("bond/site/bondsite_tree");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 新增
	 */
	@RequestMapping(value="/savetree")
	@ResponseBody
	public Object saveTree() throws Exception{
		logger.info("start----------------新增bondSiteTree");
		Map<String,Object> bondSiteTree = RequestUtil.getParameterMap(logger);
		if(StringUtils.isEmpty(bondSiteTree.get("bond_site_id").toString())){
			bondSiteTree.put("bond_site_id",IDUtil.get32UUID());
			bondSiteTree.put("bond_site_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			bondSiteTree.put("bond_site_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			bondSiteService.save(bondSiteTree);
		}else{
			bondSiteTree.put("bond_site_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    bondSiteTree.put("bond_site_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			bondSiteService.updateById(bondSiteTree);
		}
		bondSiteTree.put("key",bondSiteTree.get("bond_site_id").toString());
		bondSiteTree.put("title",bondSiteTree.get("bond_site_name").toString());
		bondSiteTree.put("lazy",false);
		return bondSiteTree;
	}
	/**
	 * 查询树
	 */
	@RequestMapping(value="/treenode")
	@ResponseBody
	public Object getTreeNode() {
		logger.info("start----------------查询树bondSite");
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		List<Object> bondSiteTreeList = new ArrayList<Object>();
		try {
			bondSiteTreeList = bondSiteService.findChildTreeNodes(bondSite);
			for (int i = 0; i < bondSiteTreeList.size(); i++) {
				Map<String,Object> treeMap = (Map<String,Object>)bondSiteTreeList.get(i);
				treeMap.put("key", treeMap.get("treekey"));
				treeMap.put("title", treeMap.get("treetitle"));
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------查询树bondSite");
		}
		return bondSiteTreeList;
	}
	/**
	 * 查询树所有子节点
	 */
	@RequestMapping(value="/treenodeall")
	@ResponseBody
	public Object getAllTreeNode() {
		logger.info("start----------------查询树bondSite");
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		List<Object> bondSiteTreeList = new ArrayList<Object>();
		try {
			bondSiteTreeList = bondSiteService.findAllTreeNodes(bondSite.get("bond_site_pid").toString());
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------查询树bondSite");
		}
		return bondSiteTreeList;
	}
	/**
	 * 删除树节点
	 */
	@RequestMapping(value="/deltree")
	@ResponseBody
	public Object deleteTree(){
		logger.info("start----------------删除sysMenu");
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		Map<String,Object> paramDel = new HashMap<String,Object>();
		try{
			List<String> ids = new ArrayList<String>();
			ids.add(bondSite.get("bond_site_id").toString());
			bondSiteService.findAllTreeNodeIds(bondSite.get("bond_site_id").toString(),ids);
			paramDel.put("ids", ids.toArray());
			bondSiteService.delete(paramDel);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "success");
	}
}
