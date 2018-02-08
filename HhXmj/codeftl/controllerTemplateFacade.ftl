package com.adminlte.${packageName}.controller;

import java.util.List;
import java.util.ArrayList;
import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.reflect.FieldUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.adminlte.${packageName}.pojo.${objectClassName};
import com.adminlte.${packageName}.pojo.${objectClassName}Ex;
import com.adminlte.${packageName}.pojo.${objectClassName}Facade;
<#if treeTableFlag=="1" >
import com.adminlte.${packageName}.pojo.${objectClassName}Tree;
</#if>
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.Page;
import com.adminlte.utils.ResponseUtil;


/** 
 * 类名称：${objectName}Controller
 * 创建人：Cheng
 * 创建时间：${nowDate?string("yyyy-MM-dd")}
 */
@Controller
@RequestMapping(value="${packagePath}")
public class ${objectClassName}Controller{
	private Log logger = LogFactory.getLog(${objectClassName}Controller.class);
	@Resource(name="${objectName}Facade")
	private ${objectClassName}Facade ${objectName}Facade;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save(${objectClassName} ${objectName}) throws Exception{
		logger.info("start----------------新增${objectName}");
		if(StringUtils.isEmpty(${objectName}.get${objectClassName}Id())){
			${objectName}.set${objectClassName}Id(IDUtil.get32UUID());
			${objectName}Facade.save(${objectName});
		}else{
			${objectName}Facade.editById(${objectName},${objectName}.get${objectClassName}Id());
		}
		
		return ResponseUtil.resultMap(1, "success");
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/del")
	@ResponseBody
	public Object delete(${objectClassName} ${objectName}){
		logger.info("start----------------删除${objectName}");
		try{
			${objectName}Facade.deleteById(${objectName}.get${objectClassName}Id());
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "success");
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(${objectClassName} ${objectName},String paneltitle) throws Exception{
		logger.info("start----------------修改${objectName}");
		ModelAndView mv = new ModelAndView();
		${objectName}Facade.editById(${objectName},${objectName}.get${objectClassName}Id());
		mv.addObject("msg","success");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("${packagePath}/${objectNameLower}_list");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page,String orderByClause,${objectClassName}Ex ${objectName}Ex,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表${objectName}"+ReflectionToStringBuilder.toString(${objectName}Ex, ToStringStyle.DEFAULT_STYLE));
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				FieldUtils.writeField(FieldUtils.getDeclaredField(${objectName}Ex.getClass().getSuperclass(), conditionName, true), ${objectName}Ex, conditionValue, true);
			}
			List<${objectClassName}>	varList = ${objectName}Facade.pageList(page, orderByClause, ${objectName}Ex);	//列出${objectName}列表
			mv.addObject("varList", varList);
			mv.addObject("page", page);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("${packagePath}/${objectNameLower}_list");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goadd")
	public ModelAndView goAdd(${objectClassName} ${objectName},String paneltitle){
		logger.info("start----------------去新增${objectName}页面");
		ModelAndView mv = new ModelAndView();
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("${objectName}", ${objectName});
		mv.setViewName("${packagePath}/${objectNameLower}_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(${objectClassName} ${objectName},String paneltitle){
		logger.info("start----------------去修改${objectName}页面");
		ModelAndView mv = new ModelAndView();
		try {
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("${objectName}", ${objectName}Facade.findById(${objectName}.get${objectClassName}Id()));
			mv.setViewName("${packagePath}/${objectNameLower}_edit_dialog");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	/**
	 * 批量提交
	 */
	@RequestMapping(value="/postall")
	@ResponseBody
	public Object postObjAll(@RequestBody List<${objectClassName}> ${objectName}s) {
		logger.info("start----------------批量提交${objectName}");
		try {
//			systemUserService.deleteAllByIds(ids);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量提交${objectName}");
		}
		return ResponseUtil.resultMap(1, "success");
	}
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/delall")
	@ResponseBody
	public Object deleteAll(@RequestParam("ids[]")List<String> ids) {
		logger.info("start----------------批量删除${objectName}");
		try {
			${objectName}Facade.deleteAllByIds(ids);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除${objectName}");
		}
		return ResponseUtil.resultMap(1, "success");
	}
<#if treeTableFlag=="1" >
	/**
	 * 树列表
	 */
	@RequestMapping(value="/tree")
	public ModelAndView tree(String paneltitle){
		logger.info("start----------------列表${objectName}");
		ModelAndView mv = new ModelAndView();
		try{
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("${packagePath}/${objectNameLower}_tree");
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
	public Object saveTree(${objectClassName}Tree ${objectName}Tree) throws Exception{
		logger.info("start----------------新增${objectName}Tree"+ReflectionToStringBuilder.toString(${objectName}Tree, ToStringStyle.DEFAULT_STYLE));
		if(StringUtils.isEmpty(${objectName}Tree.get${objectClassName}Id())){
			${objectName}Tree.set${objectClassName}Id(IDUtil.get32UUID());
			${objectName}Facade.save(${objectName}Tree);
		}else{
			${objectName}Facade.editById(${objectName}Tree,${objectName}Tree.get${objectClassName}Id());
		}
		${objectName}Tree.setKey(${objectName}Tree.get${objectClassName}Id());
		${objectName}Tree.setTitle(${objectName}Tree.get${objectClassName}Name());
		${objectName}Tree.setLazy(false);
		return ${objectName}Tree;
	}
	/**
	 * 查询树
	 */
	@RequestMapping(value="/treenode")
	@ResponseBody
	public Object getTreeNode(${objectClassName} ${objectName}) {
		logger.info("start----------------查询树${objectName}");
		List<${objectClassName}Tree> ${objectName}TreeList = new ArrayList<${objectClassName}Tree>();
		try {
			${objectName}TreeList = ${objectName}Facade.findChildTreeNodes(${objectName}.get${objectClassName}Pid());
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------查询树${objectName}");
		}
		return ${objectName}TreeList;
	}
	/**
	 * 查询树所有子节点
	 */
	@RequestMapping(value="/treenodeall")
	@ResponseBody
	public Object getAllTreeNode(${objectClassName} ${objectName}) {
		logger.info("start----------------查询树${objectName}");
		List<${objectClassName}Tree> ${objectName}TreeList = new ArrayList<${objectClassName}Tree>();
		try {
			${objectName}TreeList = ${objectName}Facade.findAllTreeNodes(${objectName}.get${objectClassName}Pid());
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------查询树${objectName}");
		}
		return ${objectName}TreeList;
	}
	/**
	 * 删除树节点
	 */
	@RequestMapping(value="/deltree")
	@ResponseBody
	public Object deleteTree(${objectClassName} ${objectName}){
		logger.info("start----------------删除sysMenu");
		try{
			${objectName}Facade.deleteTreeNodeById(${objectName}.get${objectClassName}Id());
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "success");
	}
</#if>
}
