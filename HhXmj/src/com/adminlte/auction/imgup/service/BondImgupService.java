package com.adminlte.auction.imgup.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("bondImgupService")
public class BondImgupService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> bondImgup)throws Exception{
		dao.save("bondImgupMapper.insert", bondImgup);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> bondImgups,Map<String,Object> bondImgupKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", bondImgupKey);
		paramMap.put("paramValue", bondImgups);
		dao.save("bondImgupMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> bondImgup)throws Exception{
		dao.delete("bondImgupMapper.delete", bondImgup);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> bondImgup)throws Exception{
		Map<String,Object> bondImgupQuery = new HashMap<String,Object>();
		bondImgupQuery.put("bond_imgup_id",bondImgup.get("bond_imgup_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("bondImgup",bondImgup);
		paramMap.put("bondImgupQuery",bondImgupQuery);
		dao.update("bondImgupMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> bondImgup)throws Exception{
		return (List<Object>)dao.findForList("bondImgupMapper.select", bondImgup);
	}
	/*
	 *编号列表
	 */
	public List<Map<String,Object>> listNum(Map<String,Object> bondImgup)throws Exception{
		return (List<Map<String,Object>>)dao.findForList("bondImgupMapper.selectIndex", bondImgup);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> bondImgup) throws Exception{
		Integer total = (Integer)dao.findForObject("bondImgupMapper.count", bondImgup);
		bondImgup.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(bondImgup.get("pageIndex")==null){
			bondImgup.put("pageIndex",0);
			bondImgup.put("startNu",0);
			bondImgup.put("pageSize",pageSize);
		}else{
			bondImgup.put("startNu",Integer.valueOf(bondImgup.get("pageIndex").toString())*pageSize);
			bondImgup.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("bondImgupMapper.select", bondImgup);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("bondImgupMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> bondImgup)throws Exception{
		return (Map<String,Object>)dao.findForObject("bondImgupMapper.select", bondImgup);
	}
	
	
	
   /*
	* 查询树子节点
	*/
	public List<Object> findChildTreeNodes(Map<String,Object> bondImgup)throws Exception{
		return (List<Object>)dao.findForList("bondImgupMapper.selectTree", bondImgup);
	}
	/*
	* 查询树所有子节点
	*/
	public List<Object> findAllTreeNodes(String bond_imgup_id)throws Exception{
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("bond_imgup_pid", bond_imgup_id);
		List<Object> bondImgupTrees = (List<Object>)dao.findForList("bondImgupMapper.selectAllTree", paramMap);
		for(int i=0;i<bondImgupTrees.size();i++){
			Map<String,Object> treeMap = (Map<String,Object>)bondImgupTrees.get(i);
			treeMap.put("key", treeMap.get("treekey"));
			treeMap.put("title", treeMap.get("treetitle"));
			if(Integer.valueOf(treeMap.get("childNu").toString())>0){
				treeMap.put("children",findAllTreeNodes(treeMap.get("bond_imgup_id").toString()));
			}
		}
		return bondImgupTrees;
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
	public List<String> findAllTreeNodeIds(String bond_imgup_id,List<String> ids)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("bond_imgup_pid", bond_imgup_id);
		List<Object> bondImgupTrees = (List<Object>)dao.findForList("bondImgupMapper.selectAllTree", paramMap);
		for(int i=0;i<bondImgupTrees.size();i++){
			Map<String,Object> treeMap = (Map<String,Object>)bondImgupTrees.get(i);
			ids.add(treeMap.get("bond_imgup_id").toString());
			if(Integer.valueOf(treeMap.get("childNu").toString())>0){
				treeMap.put("children",findAllTreeNodeIds(treeMap.get("bond_imgup_id").toString(),ids));
			}
		}
		return ids;
	}
	/*
	* 查找二级和三级节点,用于左则菜单树s
	*/
	public List<Object> findAllTreeNodesByIds(String treePid,List<String> ids)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("bond_imgup_pid", treePid);
		paramMap.put("ids", ids.toArray());
		List<Object> bondImgupTrees = (List<Object>)dao.findForList("bondImgupMapper.selectAllTree", paramMap);
		for(int i=0;i<bondImgupTrees.size();i++){
			Map<String,Object> bondImgupTree = (Map<String,Object>)bondImgupTrees.get(i);
			if(Integer.valueOf(bondImgupTree.get("childNu").toString())>0){
				bondImgupTree.put("children",findAllTreeNodesByIds(bondImgupTree.get("bond_imgup_id").toString(),ids));
			}
		}
		return bondImgupTrees;
	}

}

