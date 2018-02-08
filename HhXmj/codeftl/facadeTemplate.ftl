package com.adminlte.${packageName}.service;

import java.util.List;
import java.util.Map;


public interface ${objectClassName}Facade {
@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> ${objectName})throws Exception;
	
	/*
	* 删除
	*/
	public void delete(Map<String,Object> ${objectName})throws Exception;
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> ${objectName})throws Exception;
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> ${objectName})throws Exception;
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> ${objectName}) throws Exception;
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception;
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> ${objectName})throws Exception;
	
	
	
	<#if treeTableFlag=="1" >
   /*
	* 查询树子节点
	*/
	public List<Object> findChildTreeNodes(Map<String,Object> ${objectName})throws Exception;
	/*
	* 查询树所有子节点
	*/
	public List<Object> findAllTreeNodes(String ${objectName}Id)throws Exception;
	/*
	* 查询树所有子节点ids
	*/
	public List<String> findAllTreeNodeIds(String ${objectName}Id,List<String> ids)throws Exception;
	/*
	* 查找二级和三级节点,用于左则菜单树s
	*/
	public List<Object> findAllTreeNodesByIds(String treePid,List<String> ids);
	</#if>
}

