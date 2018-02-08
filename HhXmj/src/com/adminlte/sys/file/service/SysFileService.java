package com.adminlte.sys.file.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("sysFileService")
public class SysFileService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> sysFile)throws Exception{
		dao.save("sysFileMapper.insert", sysFile);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> sysFiles,Map<String,Object> sysFileKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", sysFileKey);
		paramMap.put("paramValue", sysFiles);
		dao.save("sysFileMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> sysFile)throws Exception{
		dao.delete("sysFileMapper.delete", sysFile);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> sysFile)throws Exception{
		Map<String,Object> sysFileQuery = new HashMap<String,Object>();
		sysFileQuery.put("sys_file_id",sysFile.get("sys_file_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sysFile",sysFile);
		paramMap.put("sysFileQuery",sysFileQuery);
		dao.update("sysFileMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> sysFile)throws Exception{
		return (List<Object>)dao.findForList("sysFileMapper.select", sysFile);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> sysFile) throws Exception{
		Integer total = (Integer)dao.findForObject("sysFileMapper.count", sysFile);
		sysFile.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(sysFile.get("pageIndex")==null){
			sysFile.put("pageIndex",0);
			sysFile.put("startNu",0);
			sysFile.put("pageSize",pageSize);
		}else{
			sysFile.put("startNu",Integer.valueOf(sysFile.get("pageIndex").toString())*pageSize);
			sysFile.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("sysFileMapper.select", sysFile);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("sysFileMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> sysFile)throws Exception{
		return (Map<String,Object>)dao.findForObject("sysFileMapper.select", sysFile);
	}
	
	
	
}

