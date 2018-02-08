package com.adminlte.auction.accept.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("bondAcceptService")
public class BondAcceptService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> bondAccept)throws Exception{
		dao.save("bondAcceptMapper.insert", bondAccept);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> bondAccepts,Map<String,Object> bondAcceptKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", bondAcceptKey);
		paramMap.put("paramValue", bondAccepts);
		dao.save("bondAcceptMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> bondAccept)throws Exception{
		dao.delete("bondAcceptMapper.delete", bondAccept);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> bondAccept)throws Exception{
		Map<String,Object> bondAcceptQuery = new HashMap<String,Object>();
		bondAcceptQuery.put("bond_accept_id",bondAccept.get("bond_accept_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("bondAccept",bondAccept);
		paramMap.put("bondAcceptQuery",bondAcceptQuery);
		dao.update("bondAcceptMapper.update", paramMap);
	}
	/*
	 * 根据资产编号修改
	 */
	public void update(Map<String,Object> bondAccept)throws Exception{
		Map<String,Object> bondAcceptQuery = new HashMap<String,Object>();
		bondAcceptQuery.put("bond_asset_number",bondAccept.get("bond_asset_number"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("bondAccept",bondAccept);
		paramMap.put("bondAcceptQuery",bondAcceptQuery);
		dao.update("bondAcceptMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> bondAccept)throws Exception{
		return (List<Object>)dao.findForList("bondAcceptMapper.select", bondAccept);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> bondAccept) throws Exception{
		Integer total = (Integer)dao.findForObject("bondAcceptMapper.count", bondAccept);
		bondAccept.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(bondAccept.get("pageIndex")==null){
			bondAccept.put("pageIndex",0);
			bondAccept.put("startNu",0);
			bondAccept.put("pageSize",pageSize);
		}else{
			bondAccept.put("startNu",Integer.valueOf(bondAccept.get("pageIndex").toString())*pageSize);
			bondAccept.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("bondAcceptMapper.select", bondAccept);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("bondAcceptMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> bondAccept)throws Exception{
		return (Map<String,Object>)dao.findForObject("bondAcceptMapper.select", bondAccept);
	}
	
	
	
}

