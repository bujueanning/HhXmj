package com.adminlte.sys.goods.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("sysGoodsService")
public class SysGoodsService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> sysGoods)throws Exception{
		dao.save("sysGoodsMapper.insert", sysGoods);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> sysGoodss,Map<String,Object> sysGoodsKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", sysGoodsKey);
		paramMap.put("paramValue", sysGoodss);
		dao.save("sysGoodsMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> sysGoods)throws Exception{
		dao.delete("sysGoodsMapper.delete", sysGoods);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> sysGoods)throws Exception{
		Map<String,Object> sysGoodsQuery = new HashMap<String,Object>();
		sysGoodsQuery.put("sys_goods_id",sysGoods.get("sys_goods_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sysGoods",sysGoods);
		paramMap.put("sysGoodsQuery",sysGoodsQuery);
		dao.update("sysGoodsMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> sysGoods)throws Exception{
		return (List<Object>)dao.findForList("sysGoodsMapper.select", sysGoods);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> sysGoods) throws Exception{
		Integer total = (Integer)dao.findForObject("sysGoodsMapper.count", sysGoods);
		sysGoods.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(sysGoods.get("pageIndex")==null){
			sysGoods.put("pageIndex",0);
			sysGoods.put("startNu",0);
			sysGoods.put("pageSize",pageSize);
		}else{
			sysGoods.put("startNu",Integer.valueOf(sysGoods.get("pageIndex").toString())*pageSize);
			sysGoods.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("sysGoodsMapper.select", sysGoods);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("sysGoodsMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> sysGoods)throws Exception{
		return (Map<String,Object>)dao.findForObject("sysGoodsMapper.select", sysGoods);
	}
	
	
	
}

