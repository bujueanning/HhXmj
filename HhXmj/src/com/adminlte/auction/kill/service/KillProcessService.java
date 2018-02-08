package com.adminlte.auction.kill.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("killProcessService")
public class KillProcessService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> killProcess)throws Exception{
		dao.save("killProcessMapper.insert", killProcess);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> killProcesss,Map<String,Object> killProcessKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", killProcessKey);
		paramMap.put("paramValue", killProcesss);
		dao.save("killProcessMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> killProcess)throws Exception{
		dao.delete("killProcessMapper.delete", killProcess);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> killProcess)throws Exception{
		Map<String,Object> killProcessQuery = new HashMap<String,Object>();
		killProcessQuery.put("kill_process_id",killProcess.get("kill_process_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("killProcess",killProcess);
		paramMap.put("killProcessQuery",killProcessQuery);
		dao.update("killProcessMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> killProcess)throws Exception{
		return (List<Object>)dao.findForList("killProcessMapper.select", killProcess);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> killProcess) throws Exception{
		Integer total = (Integer)dao.findForObject("killProcessMapper.count", killProcess);
		killProcess.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(killProcess.get("pageIndex")==null){
			killProcess.put("pageIndex",0);
			killProcess.put("startNu",0);
			killProcess.put("pageSize",pageSize);
		}else{
			killProcess.put("startNu",Integer.valueOf(killProcess.get("pageIndex").toString())*pageSize);
			killProcess.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("killProcessMapper.select", killProcess);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("killProcessMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> killProcess)throws Exception{
		return (Map<String,Object>)dao.findForObject("killProcessMapper.select", killProcess);
	}
	
	
	
}

