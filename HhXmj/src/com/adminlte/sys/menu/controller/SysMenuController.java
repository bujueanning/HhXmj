package com.adminlte.sys.menu.controller;

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

import com.adminlte.sys.menu.service.SysMenuService;
import com.adminlte.sys.role.menu.service.SysRoleMenuService;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.POIUtil;
import com.adminlte.utils.PathUtil;
import com.adminlte.utils.RequestUtil;
import com.adminlte.utils.ResponseUtil;
import com.adminlte.utils.ShiroUtils;


/** 
 * 类名称：sysMenuController
 * 创建人：Cheng
 * 创建时间：2017-04-18
 */
@Controller
@RequestMapping(value="sys/menu")
public class SysMenuController{
	private Log logger = LogFactory.getLog(SysMenuController.class);
	@Resource(name="sysMenuService")
	private SysMenuService sysMenuService;
	@Resource(name="sysRoleMenuService")
	private SysRoleMenuService sysRoleMenuService;
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save() throws Exception{
		logger.info("start----------------新增sysMenu");
		Map<String,Object> sysMenu = RequestUtil.getParameterMap(logger);
		if(StringUtils.isEmpty(sysMenu.get("sys_menu_id").toString())){
			sysMenu.put("sys_menu_id", IDUtil.get32UUID());
			sysMenu.put("sys_menu_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			sysMenu.put("sys_menu_createuid", ShiroUtils.getCurrentUser().get("sys_menu_id"));
			sysMenuService.save(sysMenu);
		}else{
			sysMenu.put("sys_menu_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    sysMenu.put("sys_menu_updateuid", ShiroUtils.getCurrentUser().get("sys_menu_id"));
			sysMenuService.updateById(sysMenu);
		}
		
		return ResponseUtil.resultMap(1, "成功");
	}
	@RequestMapping("/upload") 
	@ResponseBody
	public String upload(@RequestParam(value="files[]", required=false) MultipartFile[] files,String sysMenuId){
		String path = PathUtil.getWebPath()+"upload/";
		try {
			for(MultipartFile mfile : files){
	            if (!mfile.isEmpty()) {
                	Map<String,Object> sysMenuMap = new HashMap<String,Object>();
                	 	sysMenuMap.put("sys_menu_id", IDUtil.get32UUID());
						sysMenuMap.put("sys_menu_pid", "");
						sysMenuMap.put("sys_menu_name", "");
						sysMenuMap.put("sys_menu_url", "");
						sysMenuMap.put("sys_menu_order", "");
						sysMenuMap.put("sys_menu_icon_url", "");
	                sysMenuService.saveList(POIUtil.readExcelToMap(mfile.getInputStream(),mfile.getName(),sysMenuMap),sysMenuMap);
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
		logger.info("start----------------删除sysMenu");
		Map<String,Object> sysMenu = RequestUtil.getParameterMap(logger);
		try{
			sysMenuService.delete(sysMenu);
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
		logger.info("start----------------修改sysMenu");
		Map<String,Object> sysMenu = RequestUtil.getParameterMap(logger);
		sysMenu.put("sys_menu_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
	    sysMenu.put("sys_menu_updateuid", ShiroUtils.getCurrentUser().get("sys_menu_id"));
		sysMenuService.updateById(sysMenu);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","成功");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("sys/menu/sysmenu_list");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表sysMenu");
		Map<String,Object> sysMenu = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				sysMenu.put(conditionName,conditionValue);
			}
			List<Object> varList = sysMenuService.pageList(sysMenu);	//列出sysMenu列表
			mv.addObject("varList", varList);
			mv.addObject("sysMenu", sysMenu);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/menu/sysmenu_list");
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
		logger.info("start----------------列表sysMenu");
		Map<String,Object> sysMenu = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				sysMenu.put(conditionName,conditionValue);
			}
			List<Object> varList = sysMenuService.pageList(sysMenu);	//列出sysMenu列表
			mv.addObject("varList", varList);
			mv.addObject("sysMenu", sysMenu);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/menu/sysmenu_list_tree");
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
		logger.info("start----------------列表sysMenu");
		Map<String,Object> sysMenu = RequestUtil.getParameterMap(logger);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				sysMenu.put(conditionName,conditionValue);
			}
			List<Object> varList = sysMenuService.pageList(sysMenu);	//列出sysMenu列表
			resultMap.put("varList", varList);
			resultMap.put("sysMenu", sysMenu);
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
		logger.info("start----------------去新增sysMenu页面");
		Map<String,Object> sysMenu = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("sysMenu", sysMenu);
		mv.setViewName("sys/menu/sysmenu_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(String paneltitle){
		logger.info("start----------------去修改sysMenu页面");
		Map<String,Object> sysMenu = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try {
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("sysMenu", sysMenuService.find(sysMenu));
			mv.setViewName("sys/menu/sysmenu_edit_dialog");
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
		logger.info("start----------------批量删除sysMenu");
		Map<String,Object> sysMenu = RequestUtil.getParameterMap(logger);
		try {
			sysMenuService.delete(sysMenu);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除sysMenu");
		}
		return ResponseUtil.resultMap(1, "成功");
	}
	/**
	 * 树列表
	 */
	@RequestMapping(value="/tree")
	public ModelAndView tree(String paneltitle){
		logger.info("start----------------列表sysMenu");
		ModelAndView mv = new ModelAndView();
		try{
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/menu/sysmenu_tree");
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
		logger.info("start----------------新增sysMenuTree");
		Map<String,Object> sysMenuTree = RequestUtil.getParameterMap(logger);
		if(StringUtils.isEmpty(sysMenuTree.get("sys_menu_id").toString())){
			sysMenuTree.put("sys_menu_id",IDUtil.get32UUID());
			sysMenuService.save(sysMenuTree);
		}else{
			sysMenuService.updateById(sysMenuTree);
		}
		sysMenuTree.put("key",sysMenuTree.get("sys_menu_id").toString());
		sysMenuTree.put("title",sysMenuTree.get("sys_menu_name").toString());
		sysMenuTree.put("lazy",false);
		return sysMenuTree;
	}
	/**
	 * 查询树
	 */
	@RequestMapping(value="/treenode")
	@ResponseBody
	public Object getTreeNode() {
		logger.info("start----------------查询树sysMenu");
		Map<String,Object> sysMenu = RequestUtil.getParameterMap(logger);
		List<Object> sysMenuTreeList = new ArrayList<Object>();
		try {
			sysMenuTreeList = sysMenuService.findChildTreeNodes(sysMenu);
			for (int i = 0; i < sysMenuTreeList.size(); i++) {
				Map<String,Object> treeMap = (Map<String,Object>)sysMenuTreeList.get(i);
				treeMap.put("key", treeMap.get("treekey"));
				treeMap.put("title", treeMap.get("treetitle"));
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------查询树sysMenu");
		}
		return sysMenuTreeList;
	}
	/**
	 * 查询树所有子节点
	 */
	@RequestMapping(value="/treenodeall")
	@ResponseBody
	public Object getAllTreeNode() {
		logger.info("start----------------查询树sysMenu");
		Map<String,Object> sysMenu = RequestUtil.getParameterMap(logger);
		List<Object> sysMenuTreeList = new ArrayList<Object>();
		try {
			sysMenuTreeList = sysMenuService.findAllTreeNodes(sysMenu.get("sys_menu_pid").toString());
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------查询树sysMenu");
		}
		return sysMenuTreeList;
	}
	/**
	 * 删除树节点
	 */
	@RequestMapping(value="/deltree")
	@ResponseBody
	public Object deleteTree(){
		logger.info("start----------------删除sysMenu");
		Map<String,Object> sysMenu = RequestUtil.getParameterMap(logger);
		Map<String,Object> paramDel = new HashMap<String,Object>();
		try{
			List<String> ids = new ArrayList<String>();
			ids.add(sysMenu.get("sys_menu_id").toString());
			sysMenuService.findAllTreeNodeIds(sysMenu.get("sys_menu_id").toString(),ids);
			paramDel.put("ids", ids.toArray());
			sysMenuService.delete(paramDel);
			paramDel.put("ids", null);
			paramDel.put("menuids", ids.toArray());
			sysRoleMenuService.delete(paramDel);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "成功");
	}
}
