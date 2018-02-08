package com.adminlte.sys.menu.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("sysMenuService")
public class SysMenuService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> sysMenu)throws Exception{
		dao.save("sysMenuMapper.insert", sysMenu);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> sysMenus,Map<String,Object> sysMenuKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", sysMenuKey);
		paramMap.put("paramValue", sysMenus);
		dao.save("sysMenuMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> sysMenu)throws Exception{
		dao.delete("sysMenuMapper.delete", sysMenu);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> sysMenu)throws Exception{
		Map<String,Object> sysMenuQuery = new HashMap<String,Object>();
		sysMenuQuery.put("sys_menu_id",sysMenu.get("sys_menu_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sysMenu",sysMenu);
		paramMap.put("sysMenuQuery",sysMenuQuery);
		dao.update("sysMenuMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> sysMenu)throws Exception{
		return (List<Object>)dao.findForList("sysMenuMapper.select", sysMenu);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> sysMenu) throws Exception{
		Integer total = (Integer)dao.findForObject("sysMenuMapper.count", sysMenu);
		sysMenu.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(sysMenu.get("pageIndex")==null){
			sysMenu.put("pageIndex",0);
			sysMenu.put("startNu",0);
			sysMenu.put("pageSize",pageSize);
		}else{
			sysMenu.put("startNu",Integer.valueOf(sysMenu.get("pageIndex").toString())*pageSize);
			sysMenu.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("sysMenuMapper.select", sysMenu);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("sysMenuMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> sysMenu)throws Exception{
		return (Map<String,Object>)dao.findForObject("sysMenuMapper.select", sysMenu);
	}
	
	
	
   /*
	* 查询树子节点
	*/
	public List<Object> findChildTreeNodes(Map<String,Object> sysMenu)throws Exception{
		return (List<Object>)dao.findForList("sysMenuMapper.selectTree", sysMenu);
	}
	/*
	* 查询树所有子节点
	*/
	public List<Object> findAllTreeNodes(String sys_menu_id)throws Exception{
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sys_menu_pid", sys_menu_id);
		List<Object> sysMenuTrees = (List<Object>)dao.findForList("sysMenuMapper.selectAllTree", paramMap);
		for(int i=0;i<sysMenuTrees.size();i++){
			Map<String,Object> treeMap = (Map<String,Object>)sysMenuTrees.get(i);
			treeMap.put("key", treeMap.get("treekey"));
			treeMap.put("title", treeMap.get("treetitle"));
			if(Integer.valueOf(treeMap.get("childNu").toString())>0){
				treeMap.put("children",findAllTreeNodes(treeMap.get("sys_menu_id").toString()));
			}
		}
		return sysMenuTrees;
	}
	/*
	* 查询树所有子节点ids
	*/
	public List<String> findAllTreeNodeIds(String sys_menu_id,List<String> ids)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sys_menu_pid", sys_menu_id);
		List<Object> sysMenuTrees = (List<Object>)dao.findForList("sysMenuMapper.selectAllTree", paramMap);
		for(int i=0;i<sysMenuTrees.size();i++){
			Map<String,Object> treeMap = (Map<String,Object>)sysMenuTrees.get(i);
			ids.add(treeMap.get("sys_menu_id").toString());
			if(Integer.valueOf(treeMap.get("childNu").toString())>0){
				treeMap.put("children",findAllTreeNodeIds(treeMap.get("sys_menu_id").toString(),ids));
			}
		}
		return ids;
	}
	/*
	* 查找二级和三级节点,用于左则菜单树s
	*/
	public List<Object> findAllTreeNodesByIds(String treePid,List<String> ids)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sys_menu_pid", treePid);
		paramMap.put("ids", ids.toArray());
		List<Object> sysMenuTrees = (List<Object>)dao.findForList("sysMenuMapper.selectAllTree", paramMap);
		for(int i=0;i<sysMenuTrees.size();i++){
			Map<String,Object> sysMenuTree = (Map<String,Object>)sysMenuTrees.get(i);
			if(Integer.valueOf(sysMenuTree.get("childNu").toString())>0){
				sysMenuTree.put("children",findAllTreeNodesByIds(sysMenuTree.get("sys_menu_id").toString(),ids));
			}
		}
		return sysMenuTrees;
	}
}

