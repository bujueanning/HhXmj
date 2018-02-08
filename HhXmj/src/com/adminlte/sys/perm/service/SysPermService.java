package com.adminlte.sys.perm.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("sysPermService")
public class SysPermService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> sysPerm)throws Exception{
		dao.save("sysPermMapper.insert", sysPerm);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> sysPerms,Map<String,Object> sysPermKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", sysPermKey);
		paramMap.put("paramValue", sysPerms);
		dao.save("sysPermMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> sysPerm)throws Exception{
		dao.delete("sysPermMapper.delete", sysPerm);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> sysPerm)throws Exception{
		Map<String,Object> sysPermQuery = new HashMap<String,Object>();
		sysPermQuery.put("sys_perm_id",sysPerm.get("sys_perm_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sysPerm",sysPerm);
		paramMap.put("sysPermQuery",sysPermQuery);
		dao.update("sysPermMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> sysPerm)throws Exception{
		return (List<Object>)dao.findForList("sysPermMapper.select", sysPerm);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> sysPerm) throws Exception{
		Integer total = (Integer)dao.findForObject("sysPermMapper.count", sysPerm);
		sysPerm.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(sysPerm.get("pageIndex")==null){
			sysPerm.put("pageIndex",0);
			sysPerm.put("startNu",0);
			sysPerm.put("pageSize",pageSize);
		}else{
			sysPerm.put("startNu",Integer.valueOf(sysPerm.get("pageIndex").toString())*pageSize);
			sysPerm.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("sysPermMapper.select", sysPerm);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("sysPermMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> sysPerm)throws Exception{
		return (Map<String,Object>)dao.findForObject("sysPermMapper.select", sysPerm);
	}
	
	
	
   /*
	* 查询树子节点
	*/
	public List<Object> findChildTreeNodes(Map<String,Object> sysPerm)throws Exception{
		return (List<Object>)dao.findForList("sysPermMapper.selectTree", sysPerm);
	}
	/*
	* 查询树所有子节点
	*/
	public List<Object> findAllTreeNodes(String sys_perm_id)throws Exception{
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sys_perm_pid", sys_perm_id);
		List<Object> sysPermTrees = (List<Object>)dao.findForList("sysPermMapper.selectAllTree", paramMap);
		for(int i=0;i<sysPermTrees.size();i++){
			Map<String,Object> treeMap = (Map<String,Object>)sysPermTrees.get(i);
			treeMap.put("key", treeMap.get("treekey"));
			treeMap.put("title", treeMap.get("treetitle"));
			if(Integer.valueOf(treeMap.get("childNu").toString())>0){
				treeMap.put("children",findAllTreeNodes(treeMap.get("sys_perm_id").toString()));
			}
		}
		return sysPermTrees;
	}
	/*
	* 查询树所有子节点ids
	*/
	public List<String> findAllTreeNodeIds(String sys_perm_id,List<String> ids)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sys_perm_pid", sys_perm_id);
		List<Object> sysPermTrees = (List<Object>)dao.findForList("sysPermMapper.selectAllTree", paramMap);
		for(int i=0;i<sysPermTrees.size();i++){
			Map<String,Object> treeMap = (Map<String,Object>)sysPermTrees.get(i);
			ids.add(treeMap.get("sys_perm_id").toString());
			if(Integer.valueOf(treeMap.get("childNu").toString())>0){
				treeMap.put("children",findAllTreeNodeIds(treeMap.get("sys_perm_id").toString(),ids));
			}
		}
		return ids;
	}
	/*
	* 查找二级和三级节点,用于左则菜单树s
	*/
	public List<Object> findAllTreeNodesByIds(String treePid,List<String> ids)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sys_perm_pid", treePid);
		paramMap.put("ids", ids.toArray());
		List<Object> sysPermTrees = (List<Object>)dao.findForList("sysPermMapper.selectAllTree", paramMap);
		for(int i=0;i<sysPermTrees.size();i++){
			Map<String,Object> sysPermTree = (Map<String,Object>)sysPermTrees.get(i);
			if(Integer.valueOf(sysPermTree.get("childNu").toString())>0){
				sysPermTree.put("children",findAllTreeNodesByIds(sysPermTree.get("sys_perm_id").toString(),ids));
			}
		}
		return sysPermTrees;
	}
}

