package com.adminlte.sys.filex.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("sysFilexService")
public class SysFilexService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> sysFilex)throws Exception{
		dao.save("sysFilexMapper.insert", sysFilex);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> sysFilexs,Map<String,Object> sysFilexKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", sysFilexKey);
		paramMap.put("paramValue", sysFilexs);
		dao.save("sysFilexMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> sysFilex)throws Exception{
		dao.delete("sysFilexMapper.delete", sysFilex);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> sysFilex)throws Exception{
		Map<String,Object> sysFilexQuery = new HashMap<String,Object>();
		sysFilexQuery.put("sys_filex_id",sysFilex.get("sys_filex_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sysFilex",sysFilex);
		paramMap.put("sysFilexQuery",sysFilexQuery);
		dao.update("sysFilexMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> sysFilex)throws Exception{
		return (List<Object>)dao.findForList("sysFilexMapper.select", sysFilex);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> sysFilex) throws Exception{
		Integer total = (Integer)dao.findForObject("sysFilexMapper.count", sysFilex);
		sysFilex.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(sysFilex.get("pageIndex")==null){
			sysFilex.put("pageIndex",0);
			sysFilex.put("startNu",0);
			sysFilex.put("pageSize",pageSize);
		}else{
			sysFilex.put("startNu",Integer.valueOf(sysFilex.get("pageIndex").toString())*pageSize);
			sysFilex.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("sysFilexMapper.select", sysFilex);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("sysFilexMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> sysFilex)throws Exception{
		return (Map<String,Object>)dao.findForObject("sysFilexMapper.select", sysFilex);
	}
	
	
	
}

