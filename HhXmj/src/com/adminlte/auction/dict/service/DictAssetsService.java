package com.adminlte.auction.dict.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("dictAssetsService")
public class DictAssetsService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> dictAssets)throws Exception{
		dao.save("dictAssetsMapper.insert", dictAssets);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> dictAssetss,Map<String,Object> dictAssetsKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", dictAssetsKey);
		paramMap.put("paramValue", dictAssetss);
		dao.save("dictAssetsMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> dictAssets)throws Exception{
		dao.delete("dictAssetsMapper.delete", dictAssets);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> dictAssets)throws Exception{
		Map<String,Object> dictAssetsQuery = new HashMap<String,Object>();
		dictAssetsQuery.put("dict_assets_id",dictAssets.get("dict_assets_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("dictAssets",dictAssets);
		paramMap.put("dictAssetsQuery",dictAssetsQuery);
		dao.update("dictAssetsMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> dictAssets)throws Exception{
		return (List<Object>)dao.findForList("dictAssetsMapper.select", dictAssets);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> dictAssets) throws Exception{
		Integer total = (Integer)dao.findForObject("dictAssetsMapper.count", dictAssets);
		dictAssets.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(dictAssets.get("pageIndex")==null){
			dictAssets.put("pageIndex",0);
			dictAssets.put("startNu",0);
			dictAssets.put("pageSize",pageSize);
		}else{
			dictAssets.put("startNu",Integer.valueOf(dictAssets.get("pageIndex").toString())*pageSize);
			dictAssets.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("dictAssetsMapper.select", dictAssets);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("dictAssetsMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> dictAssets)throws Exception{
		return (Map<String,Object>)dao.findForObject("dictAssetsMapper.select", dictAssets);
	}
	
	
	
   /*
	* 查询树子节点
	*/
	public List<Object> findChildTreeNodes(Map<String,Object> dictAssets)throws Exception{
		return (List<Object>)dao.findForList("dictAssetsMapper.selectTree", dictAssets);
	}
	/*
	* 查询树所有子节点
	*/
	public List<Object> findAllTreeNodes(String dict_assets_id)throws Exception{
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("dict_assets_pid", dict_assets_id);
		List<Object> dictAssetsTrees = (List<Object>)dao.findForList("dictAssetsMapper.selectAllTree", paramMap);
		for(int i=0;i<dictAssetsTrees.size();i++){
			Map<String,Object> treeMap = (Map<String,Object>)dictAssetsTrees.get(i);
			treeMap.put("key", treeMap.get("treekey"));
			treeMap.put("title", treeMap.get("treetitle"));
			if(Integer.valueOf(treeMap.get("childNu").toString())>0){
				treeMap.put("children",findAllTreeNodes(treeMap.get("dict_assets_id").toString()));
			}
		}
		return dictAssetsTrees;
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
	public List<String> findAllTreeNodeIds(String dict_assets_id,List<String> ids)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("dict_assets_pid", dict_assets_id);
		List<Object> dictAssetsTrees = (List<Object>)dao.findForList("dictAssetsMapper.selectAllTree", paramMap);
		for(int i=0;i<dictAssetsTrees.size();i++){
			Map<String,Object> treeMap = (Map<String,Object>)dictAssetsTrees.get(i);
			ids.add(treeMap.get("dict_assets_id").toString());
			if(Integer.valueOf(treeMap.get("childNu").toString())>0){
				treeMap.put("children",findAllTreeNodeIds(treeMap.get("dict_assets_id").toString(),ids));
			}
		}
		return ids;
	}
	/*
	* 查找二级和三级节点,用于左则菜单树s
	*/
	public List<Object> findAllTreeNodesByIds(String treePid,List<String> ids)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("dict_assets_pid", treePid);
		paramMap.put("ids", ids.toArray());
		List<Object> dictAssetsTrees = (List<Object>)dao.findForList("dictAssetsMapper.selectAllTree", paramMap);
		for(int i=0;i<dictAssetsTrees.size();i++){
			Map<String,Object> dictAssetsTree = (Map<String,Object>)dictAssetsTrees.get(i);
			if(Integer.valueOf(dictAssetsTree.get("childNu").toString())>0){
				dictAssetsTree.put("children",findAllTreeNodesByIds(dictAssetsTree.get("dict_assets_id").toString(),ids));
			}
		}
		return dictAssetsTrees;
	}

}

