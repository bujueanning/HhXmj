package com.adminlte.auction.sheet.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("bondSheetService")
public class BondSheetService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> bondSheet)throws Exception{
		dao.save("bondSheetMapper.insert", bondSheet);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> bondSheets,Map<String,Object> bondSheetKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", bondSheetKey);
		paramMap.put("paramValue", bondSheets);
		dao.save("bondSheetMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> bondSheet)throws Exception{
		dao.delete("bondSheetMapper.delete", bondSheet);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> bondSheet)throws Exception{
		Map<String,Object> bondSheetQuery = new HashMap<String,Object>();
		bondSheetQuery.put("bond_sheet_id",bondSheet.get("bond_sheet_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("bondSheet",bondSheet);
		paramMap.put("bondSheetQuery",bondSheetQuery);
		dao.update("bondSheetMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> bondSheet)throws Exception{
		return (List<Object>)dao.findForList("bondSheetMapper.select", bondSheet);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> bondSheet) throws Exception{
		Integer total = (Integer)dao.findForObject("bondSheetMapper.count", bondSheet);
		bondSheet.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(bondSheet.get("pageIndex")==null){
			bondSheet.put("pageIndex",0);
			bondSheet.put("startNu",0);
			bondSheet.put("pageSize",pageSize);
		}else{
			bondSheet.put("startNu",Integer.valueOf(bondSheet.get("pageIndex").toString())*pageSize);
			bondSheet.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("bondSheetMapper.select", bondSheet);
	}
	//订单将资产表查出
	public List<Object> pageListAll(Map<String,Object> bondSheet) throws Exception{
		Integer total = (Integer)dao.findForObject("bondSheetMapper.count", bondSheet);
		bondSheet.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(bondSheet.get("pageIndex")==null){
			bondSheet.put("pageIndex",0);
			bondSheet.put("startNu",0);
			bondSheet.put("pageSize",pageSize);
		}else{
			bondSheet.put("startNu",Integer.valueOf(bondSheet.get("pageIndex").toString())*pageSize);
			bondSheet.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("bondSheetMapper.selectall", bondSheet);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("bondSheetMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> bondSheet)throws Exception{
		return (Map<String,Object>)dao.findForObject("bondSheetMapper.select", bondSheet);
	}
	
	
	
}

