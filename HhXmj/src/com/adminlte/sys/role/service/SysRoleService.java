package com.adminlte.sys.role.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("sysRoleService")
public class SysRoleService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> sysRole)throws Exception{
		dao.save("sysRoleMapper.insert", sysRole);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> sysRoles,Map<String,Object> sysRoleKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", sysRoleKey);
		paramMap.put("paramValue", sysRoles);
		dao.save("sysRoleMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> sysRole)throws Exception{
		dao.delete("sysRoleMapper.delete", sysRole);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> sysRole)throws Exception{
		Map<String,Object> sysRoleQuery = new HashMap<String,Object>();
		sysRoleQuery.put("sys_role_id",sysRole.get("sys_role_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sysRole",sysRole);
		paramMap.put("sysRoleQuery",sysRoleQuery);
		dao.update("sysRoleMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> sysRole)throws Exception{
		return (List<Object>)dao.findForList("sysRoleMapper.select", sysRole);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> sysRole) throws Exception{
		Integer total = (Integer)dao.findForObject("sysRoleMapper.count", sysRole);
		sysRole.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(sysRole.get("pageIndex")==null){
			sysRole.put("pageIndex",0);
			sysRole.put("startNu",0);
			sysRole.put("pageSize",pageSize);
		}else{
			sysRole.put("startNu",Integer.valueOf(sysRole.get("pageIndex").toString())*pageSize);
			sysRole.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("sysRoleMapper.select", sysRole);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("sysRoleMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> sysRole)throws Exception{
		return (Map<String,Object>)dao.findForObject("sysRoleMapper.select", sysRole);
	}
	
	
	
   /*
	* 查询树子节点
	*/
	public List<Object> findChildTreeNodes(Map<String,Object> sysRole)throws Exception{
		return (List<Object>)dao.findForList("sysRoleMapper.selectTree", sysRole);
	}
	/*
	* 查询树所有子节点
	*/
	public List<Object> findAllTreeNodes(String sys_role_id)throws Exception{
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sys_role_pid", sys_role_id);
		List<Object> sysRoleTrees = (List<Object>)dao.findForList("sysRoleMapper.selectAllTree", paramMap);
		for(int i=0;i<sysRoleTrees.size();i++){
			Map<String,Object> treeMap = (Map<String,Object>)sysRoleTrees.get(i);
			treeMap.put("key", treeMap.get("treekey"));
			treeMap.put("title", treeMap.get("treetitle"));
			if(Integer.valueOf(treeMap.get("childNu").toString())>0){
				treeMap.put("children",findAllTreeNodes(treeMap.get("sys_role_id").toString()));
			}
		}
		return sysRoleTrees;
	}
	/*
	* 查询树所有子节点ids
	*/
	public List<String> findAllTreeNodeIds(String sys_role_id,List<String> ids)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sys_role_pid", sys_role_id);
		List<Object> sysRoleTrees = (List<Object>)dao.findForList("sysRoleMapper.selectAllTree", paramMap);
		for(int i=0;i<sysRoleTrees.size();i++){
			Map<String,Object> treeMap = (Map<String,Object>)sysRoleTrees.get(i);
			ids.add(treeMap.get("sys_role_id").toString());
			if(Integer.valueOf(treeMap.get("childNu").toString())>0){
				treeMap.put("children",findAllTreeNodeIds(treeMap.get("sys_role_id").toString(),ids));
			}
		}
		return ids;
	}
	/*
	* 查找二级和三级节点,用于左则菜单树s
	*/
	public List<Object> findAllTreeNodesByIds(String treePid,List<String> ids)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sys_role_pid", treePid);
		paramMap.put("ids", ids.toArray());
		List<Object> sysRoleTrees = (List<Object>)dao.findForList("sysRoleMapper.selectAllTree", paramMap);
		for(int i=0;i<sysRoleTrees.size();i++){
			Map<String,Object> sysRoleTree = (Map<String,Object>)sysRoleTrees.get(i);
			if(Integer.valueOf(sysRoleTree.get("childNu").toString())>0){
				sysRoleTree.put("children",findAllTreeNodesByIds(sysRoleTree.get("sys_role_id").toString(),ids));
			}
		}
		return sysRoleTrees;
	}
}

