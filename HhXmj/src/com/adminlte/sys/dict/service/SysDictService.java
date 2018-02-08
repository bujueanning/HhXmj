package com.adminlte.sys.dict.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("sysDictService")
public class SysDictService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> sysDict)throws Exception{
		dao.save("sysDictMapper.insert", sysDict);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> sysDicts,Map<String,Object> sysDictKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", sysDictKey);
		paramMap.put("paramValue", sysDicts);
		dao.save("sysDictMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> sysDict)throws Exception{
		dao.delete("sysDictMapper.delete", sysDict);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> sysDict)throws Exception{
		Map<String,Object> sysDictQuery = new HashMap<String,Object>();
		sysDictQuery.put("sys_dict_id",sysDict.get("sys_dict_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sysDict",sysDict);
		paramMap.put("sysDictQuery",sysDictQuery);
		dao.update("sysDictMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> sysDict)throws Exception{
		return (List<Object>)dao.findForList("sysDictMapper.select", sysDict);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> sysDict) throws Exception{
		Integer total = (Integer)dao.findForObject("sysDictMapper.count", sysDict);
		sysDict.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(sysDict.get("pageIndex")==null){
			sysDict.put("pageIndex",0);
			sysDict.put("startNu",0);
			sysDict.put("pageSize",pageSize);
		}else{
			sysDict.put("startNu",Integer.valueOf(sysDict.get("pageIndex").toString())*pageSize);
			sysDict.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("sysDictMapper.select", sysDict);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("sysDictMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> sysDict)throws Exception{
		return (Map<String,Object>)dao.findForObject("sysDictMapper.select", sysDict);
	}
	
	
	
   /*
	* 查询树子节点
	*/
	public List<Object> findChildTreeNodes(Map<String,Object> sysDict)throws Exception{
		return (List<Object>)dao.findForList("sysDictMapper.selectTree", sysDict);
	}
	/*
	* 查询树所有子节点
	*/
	public List<Object> findAllTreeNodes(String sys_dict_id)throws Exception{
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sys_dict_pid", sys_dict_id);
		List<Object> sysDictTrees = (List<Object>)dao.findForList("sysDictMapper.selectAllTree", paramMap);
		for(int i=0;i<sysDictTrees.size();i++){
			Map<String,Object> treeMap = (Map<String,Object>)sysDictTrees.get(i);
			treeMap.put("key", treeMap.get("treekey"));
			treeMap.put("title", treeMap.get("treetitle"));
			if(Integer.valueOf(treeMap.get("childNu").toString())>0){
				treeMap.put("children",findAllTreeNodes(treeMap.get("sys_dict_id").toString()));
			}
		}
		return sysDictTrees;
	}
	/*
	* 查询树所有子节点ids
	*/
	public List<String> findAllTreeNodeIds(String sys_dict_id,List<String> ids)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sys_dict_pid", sys_dict_id);
		List<Object> sysDictTrees = (List<Object>)dao.findForList("sysDictMapper.selectAllTree", paramMap);
		for(int i=0;i<sysDictTrees.size();i++){
			Map<String,Object> treeMap = (Map<String,Object>)sysDictTrees.get(i);
			ids.add(treeMap.get("sys_dict_id").toString());
			if(Integer.valueOf(treeMap.get("childNu").toString())>0){
				treeMap.put("children",findAllTreeNodeIds(treeMap.get("sys_dict_id").toString(),ids));
			}
		}
		return ids;
	}
	/*
	* 查找二级和三级节点,用于左则菜单树s
	*/
	public List<Object> findAllTreeNodesByIds(String treePid,List<String> ids)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sys_dict_pid", treePid);
		paramMap.put("ids", ids.toArray());
		List<Object> sysDictTrees = (List<Object>)dao.findForList("sysDictMapper.selectAllTree", paramMap);
		for(int i=0;i<sysDictTrees.size();i++){
			Map<String,Object> sysDictTree = (Map<String,Object>)sysDictTrees.get(i);
			if(Integer.valueOf(sysDictTree.get("childNu").toString())>0){
				sysDictTree.put("children",findAllTreeNodesByIds(sysDictTree.get("sys_dict_id").toString(),ids));
			}
		}
		return sysDictTrees;
	}
}

