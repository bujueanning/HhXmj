package com.adminlte.sys.common.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.adminlte.base.dao.DaoSupport;

@Service("sysCommonService")
public class SysCommonService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	/*
	* 查找数据
	*/
	public List<Map<String,Object>> selectColumn(String tablename)throws Exception{
		Map<String,Object> paramMap =  new HashMap<String,Object>();
		paramMap.put("tableName", tablename);
		return (List<Map<String,Object>>)dao.findForList("sysCommonMapper.selectColumn", paramMap);
	}
	public String selectTable(String tablename)throws Exception{
		Map<String,Object> paramMap =  new HashMap<String,Object>();
		paramMap.put("tableName", tablename);
		return (String)dao.findForObject("sysCommonMapper.selectTable", paramMap);
	}
}

