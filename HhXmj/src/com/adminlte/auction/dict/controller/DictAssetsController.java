package com.adminlte.auction.dict.controller;

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
import com.adminlte.auction.dict.service.DictAssetsService;
import com.adminlte.utils.DictUtils;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.POIUtil;
import com.adminlte.utils.PathUtil;
import com.adminlte.utils.RequestUtil;
import com.adminlte.utils.ResponseUtil;
import com.adminlte.utils.ShiroUtils;


/** 
 * 类名称：dictAssetsController
 * 创建人：Cheng
 * 创建时间：2017-09-16
 */
@Controller
@RequestMapping(value="dict/assets")
public class DictAssetsController{
	private Log logger = LogFactory.getLog(DictAssetsController.class);
	@Resource(name="dictAssetsService")
	private DictAssetsService dictAssetsService;
	@Resource(name = "dictUtils")
	private DictUtils dictUtils;
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save() throws Exception{
		logger.info("start----------------新增dictAssets");
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		if(StringUtils.isEmpty(dictAssets.get("dict_assets_id").toString())){
			dictAssets.put("dict_assets_id", IDUtil.get32UUID());
			dictAssetsService.save(dictAssets);
		}else{
			dictAssetsService.updateById(dictAssets);
		}
		
		return ResponseUtil.resultMap(1, "成功");
	}
	/**
	 * 上传
	 */
	@RequestMapping("/upload") 
	@ResponseBody
	public String upload(@RequestParam(value="files[]", required=false) MultipartFile[] files,String dictAssetsId){
		String path = PathUtil.getWebPath()+"upload/";
		try {
			for(MultipartFile mfile : files){
	            if (!mfile.isEmpty()) {
                	Map<String,Object> dictAssetsMap = new HashMap<String,Object>();
	                	 	dictAssetsMap.put("dict_assets_id", IDUtil.get32UUID());
							dictAssetsMap.put("dict_assets_pid", "");
							dictAssetsMap.put("dict_assets_key", "");
							dictAssetsMap.put("dict_assets_name", "");
							dictAssetsMap.put("dict_assets_state", "");
	                dictAssetsService.saveList(POIUtil.readExcelToMap(mfile.getInputStream(),mfile.getName(),dictAssetsMap),dictAssetsMap);
	            }
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "成功";
	}
	/**
	 * 删除
	 */
	@RequestMapping(value="/del")
	@ResponseBody
	public Object delete(){
		logger.info("start----------------删除dictAssets");
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		try{
			dictAssetsService.delete(dictAssets);
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
		logger.info("start----------------修改dictAssets");
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		dictAssets.put("dict_assets_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
	    dictAssets.put("dict_assets_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
		dictAssetsService.updateById(dictAssets);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","成功");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("dict/assets/dictassets_list");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表dictAssets");
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				dictAssets.put(conditionName,conditionValue);
			}
			List<Object> varList = dictAssetsService.pageList(dictAssets);	//列出dictAssets列表
			mv.addObject("varList", varList);
			mv.addObject("dictAssets", dictAssets);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("dict/assets/dictassets_list");
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
		logger.info("start----------------列表dictAssets");
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				dictAssets.put(conditionName,conditionValue);
			}
			List<Object> varList = dictAssetsService.pageList(dictAssets);	//列出dictAssets列表
			mv.addObject("varList", varList);
			mv.addObject("dictAssets", dictAssets);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("dict/assets/dictassets_list_tree");
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
		logger.info("start----------------列表dictAssets");
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				dictAssets.put(conditionName,conditionValue);
			}
			List<Object> varList = dictAssetsService.pageList(dictAssets);	//列出dictAssets列表
			resultMap.put("varList", varList);
			resultMap.put("dictAssets", dictAssets);
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
		logger.info("start----------------去新增dictAssets页面");
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("dictAssets", dictAssets);
		mv.addObject("dict", dictUtils.getDictByTable("dict_assets"));
		mv.setViewName("dict/assets/dictassets_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(String paneltitle){
		logger.info("start----------------去修改dictAssets页面");
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("dictAssets", dictAssetsService.find(dictAssets));
			
			mv.addObject("dict", dictUtils.getDictByTable("dict_assets"));
			mv.setViewName("dict/assets/dictassets_edit_dialog");
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
		logger.info("start----------------批量删除dictAssets");
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		try {
			dictAssetsService.delete(dictAssets);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除dictAssets");
		}
		return ResponseUtil.resultMap(1, "成功");
	}
	/**
	 * 树列表
	 */
	@RequestMapping(value="/tree")
	public ModelAndView tree(String paneltitle){
		logger.info("start----------------列表dictAssets");
		ModelAndView mv = new ModelAndView();
		try{
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("dict", dictUtils.getDictByTable("dict_assets"));
			mv.setViewName("dict/assets/dictassets_tree");
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
		logger.info("start----------------新增dictAssetsTree");
		Map<String,Object> dictAssetsTree = RequestUtil.getParameterMap(logger);
		if(StringUtils.isEmpty(dictAssetsTree.get("dict_assets_id").toString())){
			dictAssetsTree.put("dict_assets_id",IDUtil.get32UUID());
			dictAssetsTree.put("dict_assets_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			dictAssetsTree.put("dict_assets_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			dictAssetsService.save(dictAssetsTree);
		}else{
			dictAssetsTree.put("dict_assets_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    dictAssetsTree.put("dict_assets_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			dictAssetsService.updateById(dictAssetsTree);
		}
		dictAssetsTree.put("key",dictAssetsTree.get("dict_assets_id").toString());
		dictAssetsTree.put("title",dictAssetsTree.get("dict_assets_name").toString());
		dictAssetsTree.put("lazy",false);
		return dictAssetsTree;
	}
	/**
	 * 查询树
	 */
	@RequestMapping(value="/treenode")
	@ResponseBody
	public Object getTreeNode() {
		logger.info("start----------------查询树dictAssets");
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		List<Object> dictAssetsTreeList = new ArrayList<Object>();
		try {
			dictAssetsTreeList = dictAssetsService.findChildTreeNodes(dictAssets);
			for (int i = 0; i < dictAssetsTreeList.size(); i++) {
				Map<String,Object> treeMap = (Map<String,Object>)dictAssetsTreeList.get(i);
				treeMap.put("key", treeMap.get("treekey"));
				treeMap.put("title", treeMap.get("treetitle"));
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------查询树dictAssets");
		}
		return dictAssetsTreeList;
	}
	/**
	 * 查询树所有子节点
	 */
	@RequestMapping(value="/treenodeall")
	@ResponseBody
	public Object getAllTreeNode() {
		logger.info("start----------------查询树dictAssets");
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		List<Object> dictAssetsTreeList = new ArrayList<Object>();
		try {
			dictAssetsTreeList = dictAssetsService.findAllTreeNodes(dictAssets.get("dict_assets_pid").toString());
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------查询树dictAssets");
		}
		return dictAssetsTreeList;
	}
	/**
	 * 删除树节点
	 */
	@RequestMapping(value="/deltree")
	@ResponseBody
	public Object deleteTree(){
		logger.info("start----------------删除sysMenu");
		Map<String,Object> dictAssets = RequestUtil.getParameterMap(logger);
		Map<String,Object> paramDel = new HashMap<String,Object>();
		try{
			List<String> ids = new ArrayList<String>();
			ids.add(dictAssets.get("dict_assets_id").toString());
			dictAssetsService.findAllTreeNodeIds(dictAssets.get("dict_assets_id").toString(),ids);
			paramDel.put("ids", ids.toArray());
			dictAssetsService.delete(paramDel);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "成功");
	}
}
