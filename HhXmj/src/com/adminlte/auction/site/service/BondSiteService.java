package com.adminlte.auction.site.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("bondSiteService")
public class BondSiteService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> bondSite)throws Exception{
		dao.save("bondSiteMapper.insert", bondSite);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> bondSites,Map<String,Object> bondSiteKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", bondSiteKey);
		paramMap.put("paramValue", bondSites);
		dao.save("bondSiteMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> bondSite)throws Exception{
		dao.delete("bondSiteMapper.delete", bondSite);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> bondSite)throws Exception{
		Map<String,Object> bondSiteQuery = new HashMap<String,Object>();
		bondSiteQuery.put("bond_site_id",bondSite.get("bond_site_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("bondSite",bondSite);
		paramMap.put("bondSiteQuery",bondSiteQuery);
		dao.update("bondSiteMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> bondSite)throws Exception{
		return (List<Object>)dao.findForList("bondSiteMapper.select", bondSite);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> bondSite) throws Exception{
		Integer total = (Integer)dao.findForObject("bondSiteMapper.count", bondSite);
		bondSite.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(bondSite.get("pageIndex")==null){
			bondSite.put("pageIndex",0);
			bondSite.put("startNu",0);
			bondSite.put("pageSize",pageSize);
		}else{
			bondSite.put("startNu",Integer.valueOf(bondSite.get("pageIndex").toString())*pageSize);
			bondSite.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("bondSiteMapper.select", bondSite);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("bondSiteMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> bondSite)throws Exception{
		return (Map<String,Object>)dao.findForObject("bondSiteMapper.select", bondSite);
	}
	
	
	
   /*
	* 查询树子节点
	*/
	public List<Object> findChildTreeNodes(Map<String,Object> bondSite)throws Exception{
		return (List<Object>)dao.findForList("bondSiteMapper.selectTree", bondSite);
	}
	/*
	* 查询树所有子节点
	*/
	public List<Object> findAllTreeNodes(String bond_site_id)throws Exception{
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("bond_site_pid", bond_site_id);
		List<Object> bondSiteTrees = (List<Object>)dao.findForList("bondSiteMapper.selectAllTree", paramMap);
		for(int i=0;i<bondSiteTrees.size();i++){
			Map<String,Object> treeMap = (Map<String,Object>)bondSiteTrees.get(i);
			treeMap.put("key", treeMap.get("treekey"));
			treeMap.put("title", treeMap.get("treetitle"));
			if(Integer.valueOf(treeMap.get("childNu").toString())>0){
				treeMap.put("children",findAllTreeNodes(treeMap.get("bond_site_id").toString()));
			}
		}
		return bondSiteTrees;
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
	public List<String> findAllTreeNodeIds(String bond_site_id,List<String> ids)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("bond_site_pid", bond_site_id);
		List<Object> bondSiteTrees = (List<Object>)dao.findForList("bondSiteMapper.selectAllTree", paramMap);
		for(int i=0;i<bondSiteTrees.size();i++){
			Map<String,Object> treeMap = (Map<String,Object>)bondSiteTrees.get(i);
			ids.add(treeMap.get("bond_site_id").toString());
			if(Integer.valueOf(treeMap.get("childNu").toString())>0){
				treeMap.put("children",findAllTreeNodeIds(treeMap.get("bond_site_id").toString(),ids));
			}
		}
		return ids;
	}
	/*
	* 查找二级和三级节点,用于左则菜单树s
	*/
	public List<Object> findAllTreeNodesByIds(String treePid,List<String> ids)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("bond_site_pid", treePid);
		paramMap.put("ids", ids.toArray());
		List<Object> bondSiteTrees = (List<Object>)dao.findForList("bondSiteMapper.selectAllTree", paramMap);
		for(int i=0;i<bondSiteTrees.size();i++){
			Map<String,Object> bondSiteTree = (Map<String,Object>)bondSiteTrees.get(i);
			if(Integer.valueOf(bondSiteTree.get("childNu").toString())>0){
				bondSiteTree.put("children",findAllTreeNodesByIds(bondSiteTree.get("bond_site_id").toString(),ids));
			}
		}
		return bondSiteTrees;
	}

}

