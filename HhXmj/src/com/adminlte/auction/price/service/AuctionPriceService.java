package com.adminlte.auction.price.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("auctionPriceService")
public class AuctionPriceService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> auctionPrice)throws Exception{
		dao.save("auctionPriceMapper.insert", auctionPrice);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> auctionPrices,Map<String,Object> auctionPriceKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", auctionPriceKey);
		paramMap.put("paramValue", auctionPrices);
		dao.save("auctionPriceMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> auctionPrice)throws Exception{
		dao.delete("auctionPriceMapper.delete", auctionPrice);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> auctionPrice)throws Exception{
		Map<String,Object> auctionPriceQuery = new HashMap<String,Object>();
		auctionPriceQuery.put("auction_price_id",auctionPrice.get("auction_price_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("auctionPrice",auctionPrice);
		paramMap.put("auctionPriceQuery",auctionPriceQuery);
		dao.update("auctionPriceMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> auctionPrice)throws Exception{
		return (List<Object>)dao.findForList("auctionPriceMapper.select", auctionPrice);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> auctionPrice) throws Exception{
		Integer total = (Integer)dao.findForObject("auctionPriceMapper.count", auctionPrice);
		auctionPrice.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(auctionPrice.get("pageIndex")==null){
			auctionPrice.put("pageIndex",0);
			auctionPrice.put("startNu",0);
			auctionPrice.put("pageSize",pageSize);
		}else{
			auctionPrice.put("startNu",Integer.valueOf(auctionPrice.get("pageIndex").toString())*pageSize);
			auctionPrice.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("auctionPriceMapper.select", auctionPrice);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("auctionPriceMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> auctionPrice)throws Exception{
		return (Map<String,Object>)dao.findForObject("auctionPriceMapper.select", auctionPrice);
	}
	
	
	
}

