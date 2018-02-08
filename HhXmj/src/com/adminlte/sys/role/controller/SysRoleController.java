package com.adminlte.sys.role.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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

import com.adminlte.sys.role.activiti.pojo.SysRoleActiviti;
import com.adminlte.sys.role.activiti.service.SysRoleActivitiService;
import com.adminlte.sys.role.menu.service.SysRoleMenuService;
import com.adminlte.sys.role.perm.service.SysRolePermService;
import com.adminlte.sys.role.service.SysRoleService;
import com.adminlte.sys.user.role.service.SysUserRoleService;
import com.adminlte.utils.DictUtils;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.POIUtil;
import com.adminlte.utils.PathUtil;
import com.adminlte.utils.RequestUtil;
import com.adminlte.utils.ResponseUtil;
import com.adminlte.utils.ShiroUtils;


/** 
 * 类名称：sysRoleController
 * 创建人：Cheng
 * 创建时间：2017-04-19
 */
@Controller
@RequestMapping(value="sys/role")
public class SysRoleController{
	private Log logger = LogFactory.getLog(SysRoleController.class);
	@Resource(name="sysRoleService")
	private SysRoleService sysRoleService;
	@Resource(name="sysUserRoleService")
	private SysUserRoleService sysUserRoleService;
	@Resource(name="sysRolePermService")
	private SysRolePermService sysRolePermService;
	@Resource(name="sysRoleMenuService")
	private SysRoleMenuService sysRoleMenuService;
	@Resource(name="sysRoleActivitiService")
	private SysRoleActivitiService sysRoleActivitiService;
	@Resource(name = "dictUtils")
	private DictUtils dictUtils;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save() throws Exception{
		logger.info("start----------------新增sysRole");
		Map<String,Object> sysRole = RequestUtil.getParameterMap(logger);
		if(StringUtils.isEmpty(sysRole.get("sys_role_id").toString())){
			sysRole.put("sys_role_id", IDUtil.get32UUID());
			sysRole.put("sys_role_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			sysRole.put("sys_role_createuid", ShiroUtils.getCurrentUser().get("sys_role_id"));
			sysRoleService.save(sysRole);
		}else{
			sysRole.put("sys_role_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    sysRole.put("sys_role_updateuid", ShiroUtils.getCurrentUser().get("sys_role_id"));
			sysRoleService.updateById(sysRole);
		}
		
		return ResponseUtil.resultMap(1, "成功");
	}
	@RequestMapping("/upload") 
	@ResponseBody
	public String upload(@RequestParam(value="files[]", required=false) MultipartFile[] files,String sysRoleId){
		String path = PathUtil.getWebPath()+"upload/";
		try {
			for(MultipartFile mfile : files){
	            if (!mfile.isEmpty()) {
                	Map<String,Object> sysRoleMap = new HashMap<String,Object>();
	                	 	sysRoleMap.put("sys_role_id", IDUtil.get32UUID());
							sysRoleMap.put("sys_role_pid", "");
							sysRoleMap.put("sys_role_name", "");
							sysRoleMap.put("sys_role_flag", "");
							sysRoleMap.put("sys_role_createdate", "");
							sysRoleMap.put("sys_role_updatedate", "");
							sysRoleMap.put("sys_role_createuid", "");
							sysRoleMap.put("sys_role_updateuid", "");
							sysRoleMap.put("sys_role_testd_d", "");
							sysRoleMap.put("sys_role_testc_c", "");
	                sysRoleService.saveList(POIUtil.readExcelToMap(mfile.getInputStream(),mfile.getName(),sysRoleMap),sysRoleMap);
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
		logger.info("start----------------删除sysRole");
		Map<String,Object> sysRole = RequestUtil.getParameterMap(logger);
		try{
			sysRoleService.delete(sysRole);
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
		logger.info("start----------------修改sysRole");
		Map<String,Object> sysRole = RequestUtil.getParameterMap(logger);
		sysRole.put("sys_role_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
	    sysRole.put("sys_role_updateuid", ShiroUtils.getCurrentUser().get("sys_role_id"));
		sysRoleService.updateById(sysRole);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","成功");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("sys/role/sysrole_list");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表sysRole");
		Map<String,Object> sysRole = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				sysRole.put(conditionName,conditionValue);
			}
			List<Object> varList = sysRoleService.pageList(sysRole);	//列出sysRole列表
			mv.addObject("varList", varList);
			mv.addObject("sysRole", sysRole);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/role/sysrole_list");
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
		logger.info("start----------------列表sysRole");
		Map<String,Object> sysRole = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				sysRole.put(conditionName,conditionValue);
			}
			List<Object> varList = sysRoleService.pageList(sysRole);	//列出sysRole列表
			mv.addObject("varList", varList);
			mv.addObject("sysRole", sysRole);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/role/sysrole_list_tree");
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
		logger.info("start----------------列表sysRole");
		Map<String,Object> sysRole = RequestUtil.getParameterMap(logger);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				sysRole.put(conditionName,conditionValue);
			}
			List<Object> varList = sysRoleService.pageList(sysRole);	//列出sysRole列表
			resultMap.put("varList", varList);
			resultMap.put("sysRole", sysRole);
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
		logger.info("start----------------去新增sysRole页面");
		Map<String,Object> sysRole = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("sysRole", sysRole);
		mv.addObject("dict", dictUtils.getDictByTable("sys_role"));
		mv.setViewName("sys/role/sysrole_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(String paneltitle){
		logger.info("start----------------去修改sysRole页面");
		Map<String,Object> sysRole = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try {
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("sysRole", sysRoleService.find(sysRole));
			mv.addObject("dict", dictUtils.getDictByTable("sys_role"));
			mv.setViewName("sys/role/sysrole_edit_dialog");
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
		logger.info("start----------------批量删除sysRole");
		Map<String,Object> sysRole = RequestUtil.getParameterMap(logger);
		try {
			sysRoleService.delete(sysRole);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除sysRole");
		}
		return ResponseUtil.resultMap(1, "成功");
	}
	/**
	 * 角色菜单权限配置页面
	 */
	@RequestMapping(value="/treerolemenupermconf")
	public ModelAndView treerolemenupermconf(String paneltitle){
		logger.info("start----------------列表sysRole");
		ModelAndView mv = new ModelAndView();
		try{
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/role/sysrole_menu_perm_tree");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 角色流程节点配置页面
	 */
	@RequestMapping(value="/treeroleactiviticonf")
	public ModelAndView treeroleactiviticonf(String paneltitle){
		logger.info("start----------------列表sysRole");
		ModelAndView mv = new ModelAndView();
		try{
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/role/sysrole_activiti_tree");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 获取权限菜单树列表
	 */
	@RequestMapping(value="/getmenupermtree")
	@ResponseBody
	public Object getMenuPermTree(){
		logger.info("start----------------列表sysRole");
		Map<String,Object> sysRoleMenu = RequestUtil.getParameterMap(logger);
		Map<String,Object> returnMap = RequestUtil.getParameterMap(logger);
		sysRoleMenu.put("sys_role_menu_type", "selected");
		sysRoleMenu.put("sys_role_perm_type", "selected");
		try{
			List<Object> SysRoleMenu = sysRoleMenuService.list(sysRoleMenu);
			returnMap.put("menutree",SysRoleMenu);
			List<Object> sysRolePerm = sysRolePermService.list(sysRoleMenu);
			returnMap.put("permtree",sysRolePerm);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return returnMap;
	}
	/**
	 * 获取流程树列表
	 */
//	@RequestMapping(value="/getactivititree")
//	@ResponseBody
//	public Object getActivitiTree(SysRole sysRole){
//		logger.info("start----------------列表sysRole");
//		List<SysRoleActiviti> sysRoleActiviti = new ArrayList<SysRoleActiviti>();
//		try{
//			sysRoleActiviti = sysRoleActivitiService.findSelectedByRoleId(sysRole.getSysRoleId());
//		} catch(Exception e){
//			logger.error(e.toString(), e);
//		}
//		return ResponseUtil.resultMap(sysRoleActiviti);
//	}
	/**
	 * 保存角色流程树列表
	 */
	@RequestMapping(value="/saveroleactiviti")
	@ResponseBody
	public Object saveroleactiviti(@RequestBody List<SysRoleActiviti> sysRoleActivitiList,String sysRoleId){
		logger.info("start----------------列表sysRole");
		try{
			sysRoleActivitiService.saveRoleActiviti(sysRoleActivitiList, sysRoleId);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return "成功";
	}
	/**
	 * 保存角色权限树列表
	 */
	@RequestMapping(value="/saveroleperm")
	@ResponseBody
	public Object saveRolePerm(@RequestBody List<Object> sysRolePermList,String sys_role_id){
		logger.info("start----------------列表sysRole");
		try{
			sysRolePermService.saveRolePerm(sysRolePermList, sys_role_id);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return "成功";
	}
	/**
	 * 权限角色树列表
	 */
	@RequestMapping(value="/saverolemenu")
	@ResponseBody
	public Object saveRoleMenu(@RequestBody List<Object> sysRoleMenuList,String sys_role_id){
		logger.info("start----------------列表sysRole");
		try{
			sysRoleMenuService.saveRoleMenu(sysRoleMenuList, sys_role_id);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return "成功";
	}
	/**
	 * 树列表
	 */
	@RequestMapping(value="/tree")
	public ModelAndView tree(String paneltitle){
		logger.info("start----------------列表sysRole");
		ModelAndView mv = new ModelAndView();
		try{
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("dict", dictUtils.getDictByTable("sys_role"));
			mv.setViewName("sys/role/sysrole_tree");
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
		logger.info("start----------------新增sysRoleTree");
		Map<String,Object> sysRoleTree = RequestUtil.getParameterMap(logger);
		if(StringUtils.isEmpty(sysRoleTree.get("sys_role_id").toString())){
			sysRoleTree.put("sys_role_id",IDUtil.get32UUID());
			sysRoleTree.put("sys_role_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			sysRoleTree.put("sys_role_createuid", ShiroUtils.getCurrentUser().get("sys_role_id"));
			sysRoleService.save(sysRoleTree);
		}else{
			sysRoleTree.put("sys_role_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    sysRoleTree.put("sys_role_updateuid", ShiroUtils.getCurrentUser().get("sys_role_id"));
			sysRoleService.updateById(sysRoleTree);
		}
		sysRoleTree.put("key",sysRoleTree.get("sys_role_id").toString());
		sysRoleTree.put("title",sysRoleTree.get("sys_role_name").toString());
		sysRoleTree.put("lazy",false);
		return sysRoleTree;
	}
	/**
	 * 查询树
	 */
	@RequestMapping(value="/treenode")
	@ResponseBody
	public Object getTreeNode() {
		logger.info("start----------------查询树sysRole");
		Map<String,Object> sysRole = RequestUtil.getParameterMap(logger);
		List<Object> sysRoleTreeList = new ArrayList<Object>();
		try {
			sysRoleTreeList = sysRoleService.findChildTreeNodes(sysRole);
			for (int i = 0; i < sysRoleTreeList.size(); i++) {
				Map<String,Object> treeMap = (Map<String,Object>)sysRoleTreeList.get(i);
				treeMap.put("key", treeMap.get("treekey"));
				treeMap.put("title", treeMap.get("treetitle"));
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------查询树sysRole");
		}
		return sysRoleTreeList;
	}
	/**
	 * 查询树所有子节点
	 */
	@RequestMapping(value="/treenodeall")
	@ResponseBody
	public Object getAllTreeNode() {
		logger.info("start----------------查询树sysRole");
		Map<String,Object> sysRole = RequestUtil.getParameterMap(logger);
		List<Object> sysRoleTreeList = new ArrayList<Object>();
		try {
			sysRoleTreeList = sysRoleService.findAllTreeNodes(sysRole.get("sys_role_pid").toString());
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------查询树sysRole");
		}
		return sysRoleTreeList;
	}
	/**
	 * 删除树节点
	 */
	@RequestMapping(value="/deltree")
	@ResponseBody
	public Object deleteTree(){
		logger.info("start----------------删除sysMenu");
		Map<String,Object> sysRole = RequestUtil.getParameterMap(logger);
		Map<String,Object> paramDel = new HashMap<String,Object>();
		try{
			List<String> ids = new ArrayList<String>();
			ids.add(sysRole.get("sys_role_id").toString());
			sysRoleService.findAllTreeNodeIds(sysRole.get("sys_role_id").toString(),ids);
			paramDel.put("ids", ids.toArray());
			sysRoleService.delete(paramDel);
			
			paramDel.put("ids", null);
			paramDel.put("roleids", ids.toArray());
			sysUserRoleService.delete(paramDel);
			sysRolePermService.delete(paramDel);
			sysRoleMenuService.delete(paramDel);
//			sysRoleActivitiService.deleteByRoleIds(ids);
			
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "成功");
	}
}
