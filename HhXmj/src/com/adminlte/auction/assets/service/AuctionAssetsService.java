package com.adminlte.auction.assets.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("auctionAssetsService")
public class AuctionAssetsService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> auctionAssets)throws Exception{
		dao.save("auctionAssetsMapper.insert", auctionAssets);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> auctionAssetss,Map<String,Object> auctionAssetsKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", auctionAssetsKey);
		paramMap.put("paramValue", auctionAssetss);
		dao.save("auctionAssetsMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> auctionAssets)throws Exception{
		dao.delete("auctionAssetsMapper.delete", auctionAssets);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> auctionAssets)throws Exception{
		Map<String,Object> auctionAssetsQuery = new HashMap<String,Object>();
		auctionAssetsQuery.put("auction_assets_id",auctionAssets.get("auction_assets_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("auctionAssets",auctionAssets);
		paramMap.put("auctionAssetsQuery",auctionAssetsQuery);
		dao.update("auctionAssetsMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> auctionAssets)throws Exception{
		return (List<Object>)dao.findForList("auctionAssetsMapper.select", auctionAssets);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> auctionAssets) throws Exception{
		Integer total = (Integer)dao.findForObject("auctionAssetsMapper.count", auctionAssets);
		auctionAssets.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(auctionAssets.get("pageIndex")==null){
			auctionAssets.put("pageIndex",0);
			auctionAssets.put("startNu",0);
			auctionAssets.put("pageSize",pageSize);
		}else{
			auctionAssets.put("startNu",Integer.valueOf(auctionAssets.get("pageIndex").toString())*pageSize);
			auctionAssets.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("auctionAssetsMapper.select", auctionAssets);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("auctionAssetsMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> auctionAssets)throws Exception{
		return (Map<String,Object>)dao.findForObject("auctionAssetsMapper.select", auctionAssets);
	}


	public Map<String,Object> findByMap(Map<String, Object> auctionAssets) throws Exception {
		return (Map<String,Object>)dao.findForObject("auctionAssetsMapper.find", auctionAssets);
	}
}

