package com.adminlte.sys.perm.controller;

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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.adminlte.shiro.AuthService;
import com.adminlte.sys.perm.service.SysPermService;
import com.adminlte.sys.role.perm.service.SysRolePermService;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.POIUtil;
import com.adminlte.utils.PathUtil;
import com.adminlte.utils.RequestUtil;
import com.adminlte.utils.ResponseUtil;
import com.adminlte.utils.ShiroUtils;


/** 
 * 类名称：sysPermController
 * 创建人：Cheng
 * 创建时间：2017-04-19
 */
@Controller
@RequestMapping(value="sys/perm")
public class SysPermController{
	private Log logger = LogFactory.getLog(SysPermController.class);
	@Resource(name="sysPermService")
	private SysPermService sysPermService;
	@Resource(name="sysRolePermService")
	private SysRolePermService sysRolePermService;
	@Resource(name="authService")
	private AuthService authService;
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save() throws Exception{
		logger.info("start----------------新增sysPerm");
		Map<String,Object> sysPerm = RequestUtil.getParameterMap(logger);
		if(StringUtils.isEmpty(sysPerm.get("sys_perm_id").toString())){
			sysPerm.put("sys_perm_id", IDUtil.get32UUID());
			sysPerm.put("sys_perm_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			sysPerm.put("sys_perm_createuid", ShiroUtils.getCurrentUser().get("sys_perm_id"));
			sysPermService.save(sysPerm);
		}else{
			sysPerm.put("sys_perm_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    sysPerm.put("sys_perm_updateuid", ShiroUtils.getCurrentUser().get("sys_perm_id"));
			sysPermService.updateById(sysPerm);
		}
		
		return ResponseUtil.resultMap(1, "成功");
	}
	@RequestMapping("/upload") 
	@ResponseBody
	public String upload(@RequestParam(value="files[]", required=false) MultipartFile[] files,String sysPermId){
		String path = PathUtil.getWebPath()+"upload/";
		try {
			for(MultipartFile mfile : files){
	            if (!mfile.isEmpty()) {
                	Map<String,Object> sysPermMap = new HashMap<String,Object>();
                	 	sysPermMap.put("sys_perm_id", IDUtil.get32UUID());
						sysPermMap.put("sys_perm_pid", "");
						sysPermMap.put("sys_perm_name", "");
						sysPermMap.put("sys_perm_flag", "");
						sysPermMap.put("sys_perm_url", "");
						sysPermMap.put("sys_perm_createdate", "");
						sysPermMap.put("sys_perm_updatedate", "");
						sysPermMap.put("sys_perm_createuid", "");
						sysPermMap.put("sys_perm_updateuid", "");
	                sysPermService.saveList(POIUtil.readExcelToMap(mfile.getInputStream(),mfile.getName(),sysPermMap),sysPermMap);
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
		logger.info("start----------------删除sysPerm");
		Map<String,Object> sysPerm = RequestUtil.getParameterMap(logger);
		try{
			sysPermService.delete(sysPerm);
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
		logger.info("start----------------修改sysPerm");
		Map<String,Object> sysPerm = RequestUtil.getParameterMap(logger);
		sysPerm.put("sys_perm_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
	    sysPerm.put("sys_perm_updateuid", ShiroUtils.getCurrentUser().get("sys_perm_id"));
		sysPermService.updateById(sysPerm);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","成功");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("sys/perm/sysperm_list");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表sysPerm");
		Map<String,Object> sysPerm = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				sysPerm.put(conditionName,conditionValue);
			}
			List<Object> varList = sysPermService.pageList(sysPerm);	//列出sysPerm列表
			mv.addObject("varList", varList);
			mv.addObject("sysPerm", sysPerm);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/perm/sysperm_list");
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
		logger.info("start----------------列表sysPerm");
		Map<String,Object> sysPerm = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				sysPerm.put(conditionName,conditionValue);
			}
			List<Object> varList = sysPermService.pageList(sysPerm);	//列出sysPerm列表
			mv.addObject("varList", varList);
			mv.addObject("sysPerm", sysPerm);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/perm/sysperm_list_tree");
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
		logger.info("start----------------列表sysPerm");
		Map<String,Object> sysPerm = RequestUtil.getParameterMap(logger);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				sysPerm.put(conditionName,conditionValue);
			}
			List<Object> varList = sysPermService.pageList(sysPerm);	//列出sysPerm列表
			resultMap.put("varList", varList);
			resultMap.put("sysPerm", sysPerm);
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
		logger.info("start----------------去新增sysPerm页面");
		Map<String,Object> sysPerm = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("sysPerm", sysPerm);
		mv.setViewName("sys/perm/sysperm_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(String paneltitle){
		logger.info("start----------------去修改sysPerm页面");
		Map<String,Object> sysPerm = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try {
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("sysPerm", sysPermService.find(sysPerm));
			mv.setViewName("sys/perm/sysperm_edit_dialog");
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
		logger.info("start----------------批量删除sysPerm");
		Map<String,Object> sysPerm = RequestUtil.getParameterMap(logger);
		try {
			sysPermService.delete(sysPerm);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除sysPerm");
		}
		return ResponseUtil.resultMap(1, "成功");
	}
	/**
	 * 树列表
	 */
	@RequestMapping(value="/tree")
	public ModelAndView tree(String paneltitle){
		logger.info("start----------------列表sysPerm");
		ModelAndView mv = new ModelAndView();
		try{
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/perm/sysperm_tree");
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
		logger.info("start----------------新增sysPermTree");
		Map<String,Object> sysPermTree = RequestUtil.getParameterMap(logger);
		if(StringUtils.isEmpty(sysPermTree.get("sys_perm_id").toString())){
			sysPermTree.put("sys_perm_id",IDUtil.get32UUID());
			sysPermService.save(sysPermTree);
		}else{
			sysPermService.updateById(sysPermTree);
		}
		sysPermTree.put("key",sysPermTree.get("sys_perm_id").toString());
		sysPermTree.put("title",sysPermTree.get("sys_perm_name").toString());
		sysPermTree.put("lazy",false);
		return sysPermTree;
	}
	/**
	 * 查询树
	 */
	@RequestMapping(value="/treenode")
	@ResponseBody
	public Object getTreeNode() {
		logger.info("start----------------查询树sysPerm");
		Map<String,Object> sysPerm = RequestUtil.getParameterMap(logger);
		List<Object> sysPermTreeList = new ArrayList<Object>();
		try {
			sysPermTreeList = sysPermService.findChildTreeNodes(sysPerm);
			for (int i = 0; i < sysPermTreeList.size(); i++) {
				Map<String,Object> treeMap = (Map<String,Object>)sysPermTreeList.get(i);
				treeMap.put("key", treeMap.get("treekey"));
				treeMap.put("title", treeMap.get("treetitle"));
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------查询树sysPerm");
		}
		return sysPermTreeList;
	}
	/**
	 * 查询树所有子节点
	 */
	@RequestMapping(value="/treenodeall")
	@ResponseBody
	public Object getAllTreeNode() {
		logger.info("start----------------查询树sysPerm");
		Map<String,Object> sysPerm = RequestUtil.getParameterMap(logger);
		List<Object> sysPermTreeList = new ArrayList<Object>();
		try {
			sysPermTreeList = sysPermService.findAllTreeNodes(sysPerm.get("sys_perm_pid").toString());
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------查询树sysPerm");
		}
		return sysPermTreeList;
	}
	/**
	 * 删除树节点
	 */
	@RequestMapping(value="/deltree")
	@ResponseBody
	public Object deleteTree(){
		logger.info("start----------------删除sysMenu");
		Map<String,Object> sysPerm = RequestUtil.getParameterMap(logger);
		Map<String,Object> paramDel = new HashMap<String,Object>();
		try{
			List<String> ids = new ArrayList<String>();
			ids.add(sysPerm.get("sys_perm_id").toString());
			sysPermService.findAllTreeNodeIds(sysPerm.get("sys_perm_id").toString(),ids);
			paramDel.put("ids", ids.toArray());
			sysPermService.delete(paramDel);
			paramDel.put("ids", null);
			paramDel.put("permids", ids.toArray());
			sysRolePermService.delete(paramDel);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "成功");
	}
	/**
	 * 更新系统权限信息
	 */
	@RequestMapping(value="/refilterchains")
	@ResponseBody
	public Object reFilterChains(){
		logger.info("start----------------删除sysMenu");
		try{
			authService.reCreateFilterChains();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return "成功";
	}
}
