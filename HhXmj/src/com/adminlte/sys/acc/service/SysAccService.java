package com.adminlte.sys.acc.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("sysAccService")
public class SysAccService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> sysAcc)throws Exception{
		dao.save("sysAccMapper.insert", sysAcc);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> sysAccs,Map<String,Object> sysAccKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", sysAccKey);
		paramMap.put("paramValue", sysAccs);
		dao.save("sysAccMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> sysAcc)throws Exception{
		dao.delete("sysAccMapper.delete", sysAcc);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> sysAcc)throws Exception{
		Map<String,Object> sysAccQuery = new HashMap<String,Object>();
		sysAccQuery.put("sys_acc_id",sysAcc.get("sys_acc_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sysAcc",sysAcc);
		paramMap.put("sysAccQuery",sysAccQuery);
		dao.update("sysAccMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> sysAcc)throws Exception{
		return (List<Object>)dao.findForList("sysAccMapper.select", sysAcc);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> sysAcc) throws Exception{
		Integer total = (Integer)dao.findForObject("sysAccMapper.count", sysAcc);
		sysAcc.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(sysAcc.get("pageIndex")==null){
			sysAcc.put("pageIndex",0);
			sysAcc.put("startNu",0);
			sysAcc.put("pageSize",pageSize);
		}else{
			sysAcc.put("startNu",Integer.valueOf(sysAcc.get("pageIndex").toString())*pageSize);
			sysAcc.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("sysAccMapper.select", sysAcc);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("sysAccMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> sysAcc)throws Exception{
		return (Map<String,Object>)dao.findForObject("sysAccMapper.select", sysAcc);
	}
	
	
	
}

