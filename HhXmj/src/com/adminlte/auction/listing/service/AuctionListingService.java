package com.adminlte.auction.listing.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("auctionListingService")
public class AuctionListingService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> auctionListing)throws Exception{
		dao.save("auctionListingMapper.insert", auctionListing);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> auctionListings,Map<String,Object> auctionListingKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", auctionListingKey);
		paramMap.put("paramValue", auctionListings);
		dao.save("auctionListingMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> auctionListing)throws Exception{
		dao.delete("auctionListingMapper.delete", auctionListing);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> auctionListing)throws Exception{
		Map<String,Object> auctionListingQuery = new HashMap<String,Object>();
		auctionListingQuery.put("auction_listing_id",auctionListing.get("auction_listing_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("auctionListing",auctionListing);
		paramMap.put("auctionListingQuery",auctionListingQuery);
		dao.update("auctionListingMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> auctionListing)throws Exception{
		return (List<Object>)dao.findForList("auctionListingMapper.select", auctionListing);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> auctionListing) throws Exception{
		Integer total = (Integer)dao.findForObject("auctionListingMapper.count", auctionListing);
		auctionListing.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(auctionListing.get("pageIndex")==null){
			auctionListing.put("pageIndex",0);
			auctionListing.put("startNu",0);
			auctionListing.put("pageSize",pageSize);
		}else{
			auctionListing.put("startNu",Integer.valueOf(auctionListing.get("pageIndex").toString())*pageSize);
			auctionListing.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("auctionListingMapper.select", auctionListing);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("auctionListingMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> auctionListing)throws Exception{
		return (Map<String,Object>)dao.findForObject("auctionListingMapper.select", auctionListing);
	}
	
	
	
}

