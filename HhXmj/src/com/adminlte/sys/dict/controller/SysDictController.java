package com.adminlte.sys.dict.controller;

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
import com.adminlte.sys.dict.service.SysDictService;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.POIUtil;
import com.adminlte.utils.PathUtil;
import com.adminlte.utils.RequestUtil;
import com.adminlte.utils.ResponseUtil;
import com.adminlte.utils.ShiroUtils;


/** 
 * 类名称：sysDictController
 * 创建人：Cheng
 * 创建时间：2017-04-21
 */
@Controller
@RequestMapping(value="sys/dict")
public class SysDictController{
	private Log logger = LogFactory.getLog(SysDictController.class);
	@Resource(name="sysDictService")
	private SysDictService sysDictService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save() throws Exception{
		logger.info("start----------------新增sysDict");
		Map<String,Object> sysDict = RequestUtil.getParameterMap(logger);
		if(StringUtils.isEmpty(sysDict.get("sys_dict_id").toString())){
			sysDict.put("sys_dict_id", IDUtil.get32UUID());
			sysDict.put("sys_dict_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			sysDict.put("sys_dict_createuid", ShiroUtils.getCurrentUser().get("sys_dict_id"));
			sysDictService.save(sysDict);
		}else{
			sysDict.put("sys_dict_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    sysDict.put("sys_dict_updateuid", ShiroUtils.getCurrentUser().get("sys_dict_id"));
			sysDictService.updateById(sysDict);
		}
		
		return ResponseUtil.resultMap(1, "成功");
	}
	/**
	 * 上传
	 */
	@RequestMapping("/upload") 
	@ResponseBody
	public String upload(@RequestParam(value="files[]", required=false) MultipartFile[] files,String sysDictId){
		String path = PathUtil.getWebPath()+"upload/";
		try {
			for(MultipartFile mfile : files){
	            if (!mfile.isEmpty()) {
                	Map<String,Object> sysDictMap = new HashMap<String,Object>();
                	 	sysDictMap.put("sys_dict_id", IDUtil.get32UUID());
						sysDictMap.put("sys_dict_pid", "");
						sysDictMap.put("sys_dict_name", "");
						sysDictMap.put("sys_dict_value", "");
						sysDictMap.put("sys_dict_seq", "");
						sysDictMap.put("sys_dict_active", "");
						sysDictMap.put("sys_dict_createdate", "");
						sysDictMap.put("sys_dict_updatedate", "");
						sysDictMap.put("sys_dict_createuid", "");
						sysDictMap.put("sys_dict_updateuid", "");
	                sysDictService.saveList(POIUtil.readExcelToMap(mfile.getInputStream(),mfile.getName(),sysDictMap),sysDictMap);
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
		logger.info("start----------------删除sysDict");
		Map<String,Object> sysDict = RequestUtil.getParameterMap(logger);
		try{
			sysDictService.delete(sysDict);
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
		logger.info("start----------------修改sysDict");
		Map<String,Object> sysDict = RequestUtil.getParameterMap(logger);
		sysDict.put("sys_dict_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
	    sysDict.put("sys_dict_updateuid", ShiroUtils.getCurrentUser().get("sys_dict_id"));
		sysDictService.updateById(sysDict);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","成功");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("sys/dict/sysdict_list");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表sysDict");
		Map<String,Object> sysDict = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				sysDict.put(conditionName,conditionValue);
			}
			List<Object> varList = sysDictService.pageList(sysDict);	//列出sysDict列表
			mv.addObject("varList", varList);
			mv.addObject("sysDict", sysDict);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/dict/sysdict_list");
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
		logger.info("start----------------列表sysDict");
		Map<String,Object> sysDict = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				sysDict.put(conditionName,conditionValue);
			}
			List<Object> varList = sysDictService.pageList(sysDict);	//列出sysDict列表
			mv.addObject("varList", varList);
			mv.addObject("sysDict", sysDict);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/dict/sysdict_list_tree");
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
		logger.info("start----------------列表sysDict");
		Map<String,Object> sysDict = RequestUtil.getParameterMap(logger);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				sysDict.put(conditionName,conditionValue);
			}
			List<Object> varList = sysDictService.pageList(sysDict);	//列出sysDict列表
			resultMap.put("varList", varList);
			resultMap.put("sysDict", sysDict);
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
		logger.info("start----------------去新增sysDict页面");
		Map<String,Object> sysDict = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("sysDict", sysDict);
		mv.setViewName("sys/dict/sysdict_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(String paneltitle){
		logger.info("start----------------去修改sysDict页面");
		Map<String,Object> sysDict = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try {
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("sysDict", sysDictService.find(sysDict));
			mv.setViewName("sys/dict/sysdict_edit_dialog");
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
		logger.info("start----------------批量删除sysDict");
		Map<String,Object> sysDict = RequestUtil.getParameterMap(logger);
		try {
			sysDictService.delete(sysDict);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除sysDict");
		}
		return ResponseUtil.resultMap(1, "成功");
	}
	/**
	 * 树列表
	 */
	@RequestMapping(value="/tree")
	public ModelAndView tree(String paneltitle){
		logger.info("start----------------列表sysDict");
		ModelAndView mv = new ModelAndView();
		try{
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/dict/sysdict_tree");
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
		logger.info("start----------------新增sysDictTree");
		Map<String,Object> sysDictTree = RequestUtil.getParameterMap(logger);
		if(StringUtils.isEmpty(sysDictTree.get("sys_dict_id").toString())){
			sysDictTree.put("sys_dict_id",IDUtil.get32UUID());
			sysDictTree.put("sys_dict_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			sysDictTree.put("sys_dict_createuid", ShiroUtils.getCurrentUser().get("sys_dict_id"));
			sysDictService.save(sysDictTree);
		}else{
			sysDictTree.put("sys_dict_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    sysDictTree.put("sys_dict_updateuid", ShiroUtils.getCurrentUser().get("sys_dict_id"));
			sysDictService.updateById(sysDictTree);
		}
		sysDictTree.put("key",sysDictTree.get("sys_dict_id").toString());
		sysDictTree.put("title",sysDictTree.get("sys_dict_name").toString());
		sysDictTree.put("lazy",false);
		return sysDictTree;
	}
	/**
	 * 查询树
	 */
	@RequestMapping(value="/treenode")
	@ResponseBody
	public Object getTreeNode() {
		logger.info("start----------------查询树sysDict");
		Map<String,Object> sysDict = RequestUtil.getParameterMap(logger);
		List<Object> sysDictTreeList = new ArrayList<Object>();
		try {
			sysDictTreeList = sysDictService.findChildTreeNodes(sysDict);
			for (int i = 0; i < sysDictTreeList.size(); i++) {
				Map<String,Object> treeMap = (Map<String,Object>)sysDictTreeList.get(i);
				treeMap.put("key", treeMap.get("treekey"));
				treeMap.put("title", treeMap.get("treetitle"));
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------查询树sysDict");
		}
		return sysDictTreeList;
	}
	/**
	 * 查询树所有子节点
	 */
	@RequestMapping(value="/treenodeall")
	@ResponseBody
	public Object getAllTreeNode() {
		logger.info("start----------------查询树sysDict");
		Map<String,Object> sysDict = RequestUtil.getParameterMap(logger);
		List<Object> sysDictTreeList = new ArrayList<Object>();
		try {
			sysDictTreeList = sysDictService.findAllTreeNodes(sysDict.get("sys_dict_pid").toString());
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------查询树sysDict");
		}
		return sysDictTreeList;
	}
	/**
	 * 删除树节点
	 */
	@RequestMapping(value="/deltree")
	@ResponseBody
	public Object deleteTree(){
		logger.info("start----------------删除sysMenu");
		Map<String,Object> sysDict = RequestUtil.getParameterMap(logger);
		Map<String,Object> paramDel = new HashMap<String,Object>();
		try{
			List<String> ids = new ArrayList<String>();
			ids.add(sysDict.get("sys_dict_id").toString());
			sysDictService.findAllTreeNodeIds(sysDict.get("sys_dict_id").toString(),ids);
			paramDel.put("ids", ids.toArray());
			sysDictService.delete(paramDel);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "成功");
	}
}
