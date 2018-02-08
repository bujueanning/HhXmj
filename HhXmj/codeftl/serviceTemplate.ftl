package com.adminlte.${packageName}.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("${objectName}Service")
public class ${objectClassName}Service {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> ${objectName})throws Exception{
		dao.save("${objectName}Mapper.insert", ${objectName});
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> ${objectName}s,Map<String,Object> ${objectName}Key)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", ${objectName}Key);
		paramMap.put("paramValue", ${objectName}s);
		dao.save("${objectName}Mapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> ${objectName})throws Exception{
		dao.delete("${objectName}Mapper.delete", ${objectName});
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> ${objectName})throws Exception{
		Map<String,Object> ${objectName}Query = new HashMap<String,Object>();
		${objectName}Query.put("${tablenameLower}_id",${objectName}.get("${tablenameLower}_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("${objectName}",${objectName});
		paramMap.put("${objectName}Query",${objectName}Query);
		dao.update("${objectName}Mapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> ${objectName})throws Exception{
		return (List<Object>)dao.findForList("${objectName}Mapper.select", ${objectName});
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> ${objectName}) throws Exception{
		Integer total = (Integer)dao.findForObject("${objectName}Mapper.count", ${objectName});
		${objectName}.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(${objectName}.get("pageIndex")==null){
			${objectName}.put("pageIndex",0);
			${objectName}.put("startNu",0);
			${objectName}.put("pageSize",pageSize);
		}else{
			${objectName}.put("startNu",Integer.valueOf(${objectName}.get("pageIndex").toString())*pageSize);
			${objectName}.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("${objectName}Mapper.select", ${objectName});
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("${objectName}Mapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> ${objectName})throws Exception{
		return (Map<String,Object>)dao.findForObject("${objectName}Mapper.select", ${objectName});
	}
	
	
	
	<#if treeTableFlag=="1" >
   /*
	* 查询树子节点
	*/
	public List<Object> findChildTreeNodes(Map<String,Object> ${objectName})throws Exception{
		return (List<Object>)dao.findForList("${objectName}Mapper.selectTree", ${objectName});
	}
	/*
	* 查询树所有子节点
	*/
	public List<Object> findAllTreeNodes(String ${tablenameLower}_id)throws Exception{
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("${tablenameLower}_pid", ${tablenameLower}_id);
		List<Object> ${objectName}Trees = (List<Object>)dao.findForList("${objectName}Mapper.selectAllTree", paramMap);
		for(int i=0;i<${objectName}Trees.size();i++){
			Map<String,Object> treeMap = (Map<String,Object>)${objectName}Trees.get(i);
			treeMap.put("key", treeMap.get("treekey"));
			treeMap.put("title", treeMap.get("treetitle"));
			if(Integer.valueOf(treeMap.get("childNu").toString())>0){
				treeMap.put("children",findAllTreeNodes(treeMap.get("${tablenameLower}_id").toString()));
			}
		}
		return ${objectName}Trees;
	}
	/*
	* 查询Select树所有子节点
	*/
	public List<Map<String,Object>> findSelect2(List<Map<String,Object>> resultList,String org_branch_id,String black)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("org_branch_pid", org_branch_id);
		List<Object> orgBranchTrees = (List<Object>)dao.findForList("orgBranchMapper.selectAllTree", paramMap);
		black = black + " ";
		for(int i=0;i<orgBranchTrees.size();i++){
			Map<String,Object> treeMap = (Map<String,Object>)orgBranchTrees.get(i);
			treeMap.put("org_branch_name", black+treeMap.get("org_branch_name"));
			treeMap.put("key", treeMap.get("treekey"));
			treeMap.put("title", treeMap.get("treetitle"));
			resultList.add(treeMap);
			if(Integer.valueOf(treeMap.get("childNu").toString())>0){
				findSelect2(resultList,treeMap.get("org_branch_id").toString(),black);
			}
		}
		return resultList;
	}
	/*
	* 查询树所有子节点ids
	*/
	public List<String> findAllTreeNodeIds(String ${tablenameLower}_id,List<String> ids)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("${tablenameLower}_pid", ${tablenameLower}_id);
		List<Object> ${objectName}Trees = (List<Object>)dao.findForList("${objectName}Mapper.selectAllTree", paramMap);
		for(int i=0;i<${objectName}Trees.size();i++){
			Map<String,Object> treeMap = (Map<String,Object>)${objectName}Trees.get(i);
			ids.add(treeMap.get("${tablenameLower}_id").toString());
			if(Integer.valueOf(treeMap.get("childNu").toString())>0){
				treeMap.put("children",findAllTreeNodeIds(treeMap.get("${tablenameLower}_id").toString(),ids));
			}
		}
		return ids;
	}
	/*
	* 查找二级和三级节点,用于左则菜单树s
	*/
	public List<Object> findAllTreeNodesByIds(String treePid,List<String> ids)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("${tablenameLower}_pid", treePid);
		paramMap.put("ids", ids.toArray());
		List<Object> ${objectName}Trees = (List<Object>)dao.findForList("${objectName}Mapper.selectAllTree", paramMap);
		for(int i=0;i<${objectName}Trees.size();i++){
			Map<String,Object> ${objectName}Tree = (Map<String,Object>)${objectName}Trees.get(i);
			if(Integer.valueOf(${objectName}Tree.get("childNu").toString())>0){
				${objectName}Tree.put("children",findAllTreeNodesByIds(${objectName}Tree.get("${tablenameLower}_id").toString(),ids));
			}
		}
		return ${objectName}Trees;
	}

	</#if>
}

