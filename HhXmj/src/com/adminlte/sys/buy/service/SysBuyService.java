package com.adminlte.sys.buy.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("sysBuyService")
public class SysBuyService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> sysBuy)throws Exception{
		dao.save("sysBuyMapper.insert", sysBuy);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> sysBuys,Map<String,Object> sysBuyKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", sysBuyKey);
		paramMap.put("paramValue", sysBuys);
		dao.save("sysBuyMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> sysBuy)throws Exception{
		dao.delete("sysBuyMapper.delete", sysBuy);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> sysBuy)throws Exception{
		Map<String,Object> sysBuyQuery = new HashMap<String,Object>();
		sysBuyQuery.put("sys_buy_id",sysBuy.get("sys_buy_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sysBuy",sysBuy);
		paramMap.put("sysBuyQuery",sysBuyQuery);
		dao.update("sysBuyMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> sysBuy)throws Exception{
		return (List<Object>)dao.findForList("sysBuyMapper.select", sysBuy);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> sysBuy) throws Exception{
		Integer total = (Integer)dao.findForObject("sysBuyMapper.count", sysBuy);
		sysBuy.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(sysBuy.get("pageIndex")==null){
			sysBuy.put("pageIndex",0);
			sysBuy.put("startNu",0);
			sysBuy.put("pageSize",pageSize);
		}else{
			sysBuy.put("startNu",Integer.valueOf(sysBuy.get("pageIndex").toString())*pageSize);
			sysBuy.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("sysBuyMapper.select", sysBuy);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("sysBuyMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> sysBuy)throws Exception{
		return (Map<String,Object>)dao.findForObject("sysBuyMapper.select", sysBuy);
	}
	
	
	
}

