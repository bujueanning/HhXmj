package com.adminlte.auction.info.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("auctionInfoService")
public class AuctionInfoService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> auctionInfo)throws Exception{
		dao.save("auctionInfoMapper.insert", auctionInfo);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> auctionInfos,Map<String,Object> auctionInfoKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", auctionInfoKey);
		paramMap.put("paramValue", auctionInfos);
		dao.save("auctionInfoMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> auctionInfo)throws Exception{
		dao.delete("auctionInfoMapper.delete", auctionInfo);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> auctionInfo)throws Exception{
		Map<String,Object> auctionInfoQuery = new HashMap<String,Object>();
		auctionInfoQuery.put("auction_info_id",auctionInfo.get("auction_info_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("auctionInfo",auctionInfo);
		paramMap.put("auctionInfoQuery",auctionInfoQuery);
		dao.update("auctionInfoMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> auctionInfo)throws Exception{
		return (List<Object>)dao.findForList("auctionInfoMapper.select", auctionInfo);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> auctionInfo) throws Exception{
		Integer total = (Integer)dao.findForObject("auctionInfoMapper.count", auctionInfo);
		auctionInfo.put("total",total);
		int pageSize= 100;	//当前页展示记录
		if(auctionInfo.get("pageIndex")==null){
			auctionInfo.put("pageIndex",0);
			auctionInfo.put("startNu",0);
			auctionInfo.put("pageSize",pageSize);
		}else{
			auctionInfo.put("startNu",Integer.valueOf(auctionInfo.get("pageIndex").toString())*pageSize);
			auctionInfo.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("auctionInfoMapper.select", auctionInfo);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("auctionInfoMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> auctionInfo)throws Exception{
		return (Map<String,Object>)dao.findForObject("auctionInfoMapper.select", auctionInfo);
	}
	
	
	
}

