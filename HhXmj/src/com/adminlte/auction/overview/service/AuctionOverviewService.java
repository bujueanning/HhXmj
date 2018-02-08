package com.adminlte.auction.overview.service;

import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("auctionOverviewService")
public class AuctionOverviewService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> auctionOverview)throws Exception{
		dao.save("auctionOverviewMapper.insert", auctionOverview);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> auctionOverviews,Map<String,Object> auctionOverviewKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", auctionOverviewKey);
		paramMap.put("paramValue", auctionOverviews);
		dao.save("auctionOverviewMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> auctionOverview)throws Exception{
		dao.delete("auctionOverviewMapper.delete", auctionOverview);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> auctionOverview)throws Exception{
		Map<String,Object> auctionOverviewQuery = new HashMap<String,Object>();
		auctionOverviewQuery.put("auction_overview_id",auctionOverview.get("auction_overview_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("auctionOverview",auctionOverview);
		paramMap.put("auctionOverviewQuery",auctionOverviewQuery);
		dao.update("auctionOverviewMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> auctionOverview)throws Exception{
		return (List<Object>)dao.findForList("auctionOverviewMapper.select", auctionOverview);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> auctionOverview) throws Exception{
		Integer total = (Integer)dao.findForObject("auctionOverviewMapper.count", auctionOverview);
		auctionOverview.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(auctionOverview.get("pageIndex")==null){
			auctionOverview.put("pageIndex",0);
			auctionOverview.put("startNu",0);
			auctionOverview.put("pageSize",pageSize);
		}else{
			auctionOverview.put("startNu",Integer.valueOf(auctionOverview.get("pageIndex").toString())*pageSize);
			auctionOverview.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("auctionOverviewMapper.select", auctionOverview);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("auctionOverviewMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> auctionOverview)throws Exception{
		return (Map<String,Object>)dao.findForObject("auctionOverviewMapper.select", auctionOverview);
	}
	
	
	
}

