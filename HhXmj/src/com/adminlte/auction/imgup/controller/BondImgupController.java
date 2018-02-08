package com.adminlte.auction.imgup.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.http.HttpRequest;
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

import com.adminlte.auction.imgup.service.BondImgupService;
import com.adminlte.utils.DictUtils;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.POIUtil;
import com.adminlte.utils.PathUtil;
import com.adminlte.utils.RequestUtil;
import com.adminlte.utils.ResponseUtil;
import com.adminlte.utils.ShiroUtils;


/** 
 * 类名称：bondImgupController
 * 创建人：Cheng
 * 创建时间：2017-12-22
 */
@Controller
@RequestMapping(value="bond/imgup")
public class BondImgupController{
	private Log logger = LogFactory.getLog(BondImgupController.class);
	@Resource(name="bondImgupService")
	private BondImgupService bondImgupService;
	@Resource(name = "dictUtils")
	private DictUtils dictUtils;
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save(HttpServletRequest request) throws Exception{
		logger.info("start----------------新增bondImgup");
		Map<String,Object> bondImgup = RequestUtil.getParameterMap(logger);
		String path = request.getParameter("imgBase");
		String imgFormat = request.getParameter("imgFormat");
		String lookIndex = request.getParameter("lookIndex");
		bondImgup.put("imgup_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
		List<Map<String, Object>> imgs = bondImgupService.listNum(bondImgup);
		boolean suc = true;
		bondImgup.clear();
		System.out.println("在数据库中的数据："+imgs+",发过了的数据:"+lookIndex);
		for(Map<String, Object> indexs : imgs){
			if(lookIndex.equals(indexs.get("imgup_index"))){
				suc = false;
				System.out.println("这张图片已经上传！");
			}else{
				suc = true ;
			}
		}
//		if(suc){
//			bondImgup.put("imgup_id", IDUtil.get32UUID());
//			bondImgup.put("imgup_path", path);
//			bondImgup.put("imgup_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
//			bondImgup.put("imgup_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
//			bondImgup.put("imgup_index", lookIndex);
//			bondImgupService.save(bondImgup);
//		}
//		System.out.println("上传图片");
		return ResponseUtil.resultMap(1, "success");
	}
	/**
	 * 上传
	 */
	@RequestMapping("/upload") 
	@ResponseBody
	public String upload(@RequestParam(value="files[]", required=false) MultipartFile[] files,String bondImgupId){
		String path = PathUtil.getWebPath()+"upload/";
		try {
			for(MultipartFile mfile : files){
	            if (!mfile.isEmpty()) {
                	Map<String,Object> bondImgupMap = new HashMap<String,Object>();
							bondImgupMap.put("imgup_id", "");
							bondImgupMap.put("imgup_path", "");
							bondImgupMap.put("imgup_createuid", "");
							bondImgupMap.put("imgup_createdate", "");
							bondImgupMap.put("imgup_updateuid", "");
							bondImgupMap.put("imgup_updatedate", "");
							bondImgupMap.put("imgup_pid", "");
	                bondImgupService.saveList(POIUtil.readExcelToMap(mfile.getInputStream(),mfile.getName(),bondImgupMap),bondImgupMap);
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
	public Object delete(Map<String,Object> bondImgup){
		logger.info("start----------------删除bondImgup");
		bondImgup = RequestUtil.getParameterMap(logger);
		try{
			bondImgupService.delete(bondImgup);
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
		logger.info("start----------------修改bondImgup");
		Map<String,Object> bondImgup = RequestUtil.getParameterMap(logger);
		bondImgup.put("bond_imgup_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
	    bondImgup.put("bond_imgup_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
		bondImgupService.updateById(bondImgup);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","success");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("bond/imgup/bondimgup_list");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Map<String,Object> bondImgup,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表bondImgup");
		bondImgup = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				bondImgup.put(conditionName,conditionValue);
			}
			List<Object> varList = bondImgupService.pageList(bondImgup);	//列出bondImgup列表
			mv.addObject("varList", varList);
			mv.addObject("bondImgup", bondImgup);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/bond/imgup");
			System.out.println("图片上传的数据："+mv);
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
		logger.info("start----------------列表bondImgup");
		Map<String,Object> bondImgup = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				bondImgup.put(conditionName,conditionValue);
			}
			List<Object> varList = bondImgupService.pageList(bondImgup);	//列出bondImgup列表
			mv.addObject("varList", varList);
			mv.addObject("bondImgup", bondImgup);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("bond/imgup/bondimgup_list_tree");
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
	public Object listjson(Map<String,Object> bondImgup,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表bondImgup");
		bondImgup = RequestUtil.getParameterMap(logger);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				bondImgup.put(conditionName,conditionValue);
			}
			List<Object> varList = bondImgupService.pageList(bondImgup);	//列出bondImgup列表
			resultMap.put("varList", varList);
			resultMap.put("bondImgup", bondImgup);
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
		logger.info("start----------------去新增bondImgup页面");
		Map<String,Object> bondImgup = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("bondImgup", bondImgup);
		mv.addObject("dict", dictUtils.getDictByTable("bond_imgup"));
		mv.setViewName("bond/imgup/bondimgup_edit_dialog");
		return mv;
	}	
	

	/**
	 * 批量删除
	 */
	@RequestMapping(value="/delall")
	@ResponseBody
	public Object deleteAll() {
		logger.info("start----------------批量删除bondImgup");
		Map<String,Object> bondImgup = RequestUtil.getParameterMap(logger);
		try {
			bondImgupService.delete(bondImgup);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除bondImgup");
		}
		return ResponseUtil.resultMap(1, "success");
	}
	/**
	 * 树列表
	 */
	@RequestMapping(value="/tree")
	public ModelAndView tree(String paneltitle){
		logger.info("start----------------列表bondImgup");
		ModelAndView mv = new ModelAndView();
		try{
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("dict", dictUtils.getDictByTable("bond_imgup"));
			mv.setViewName("bond/imgup/bondimgup_tree");
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
		logger.info("start----------------新增bondImgupTree");
		Map<String,Object> bondImgupTree = RequestUtil.getParameterMap(logger);
		if(StringUtils.isEmpty(bondImgupTree.get("bond_imgup_id").toString())){
			bondImgupTree.put("bond_imgup_id",IDUtil.get32UUID());
			bondImgupTree.put("bond_imgup_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			bondImgupTree.put("bond_imgup_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			bondImgupService.save(bondImgupTree);
		}else{
			bondImgupTree.put("bond_imgup_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    bondImgupTree.put("bond_imgup_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			bondImgupService.updateById(bondImgupTree);
		}
		bondImgupTree.put("key",bondImgupTree.get("bond_imgup_id").toString());
		bondImgupTree.put("title",bondImgupTree.get("bond_imgup_name").toString());
		bondImgupTree.put("lazy",false);
		return bondImgupTree;
	}
	/**
	 * 查询树
	 */
	@RequestMapping(value="/treenode")
	@ResponseBody
	public Object getTreeNode() {
		logger.info("start----------------查询树bondImgup");
		Map<String,Object> bondImgup = RequestUtil.getParameterMap(logger);
		List<Object> bondImgupTreeList = new ArrayList<Object>();
		try {
			bondImgupTreeList = bondImgupService.findChildTreeNodes(bondImgup);
			for (int i = 0; i < bondImgupTreeList.size(); i++) {
				Map<String,Object> treeMap = (Map<String,Object>)bondImgupTreeList.get(i);
				treeMap.put("key", treeMap.get("treekey"));
				treeMap.put("title", treeMap.get("treetitle"));
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------查询树bondImgup");
		}
		return bondImgupTreeList;
	}
	/**
	 * 查询树所有子节点
	 */
	@RequestMapping(value="/treenodeall")
	@ResponseBody
	public Object getAllTreeNode() {
		logger.info("start----------------查询树bondImgup");
		Map<String,Object> bondImgup = RequestUtil.getParameterMap(logger);
		List<Object> bondImgupTreeList = new ArrayList<Object>();
		try {
			bondImgupTreeList = bondImgupService.findAllTreeNodes(bondImgup.get("bond_imgup_pid").toString());
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------查询树bondImgup");
		}
		return bondImgupTreeList;
	}
	/**
	 * 删除树节点
	 */
	@RequestMapping(value="/deltree")
	@ResponseBody
	public Object deleteTree(){
		logger.info("start----------------删除sysMenu");
		Map<String,Object> bondImgup = RequestUtil.getParameterMap(logger);
		Map<String,Object> paramDel = new HashMap<String,Object>();
		try{
			List<String> ids = new ArrayList<String>();
			ids.add(bondImgup.get("bond_imgup_id").toString());
			bondImgupService.findAllTreeNodeIds(bondImgup.get("bond_imgup_id").toString(),ids);
			paramDel.put("ids", ids.toArray());
			bondImgupService.delete(paramDel);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "success");
	}
}
