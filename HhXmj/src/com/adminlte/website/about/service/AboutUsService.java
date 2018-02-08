package com.adminlte.website.about.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("aboutUsService")
public class AboutUsService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> aboutUs)throws Exception{
		dao.save("aboutUsMapper.insert", aboutUs);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> aboutUss,Map<String,Object> aboutUsKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", aboutUsKey);
		paramMap.put("paramValue", aboutUss);
		dao.save("aboutUsMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> aboutUs)throws Exception{
		dao.delete("aboutUsMapper.delete", aboutUs);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> aboutUs)throws Exception{
		Map<String,Object> aboutUsQuery = new HashMap<String,Object>();
		aboutUsQuery.put("about_us_id",aboutUs.get("about_us_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("aboutUs",aboutUs);
		paramMap.put("aboutUsQuery",aboutUsQuery);
		dao.update("aboutUsMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> aboutUs)throws Exception{
		return (List<Object>)dao.findForList("aboutUsMapper.select", aboutUs);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> aboutUs) throws Exception{
		Integer total = (Integer)dao.findForObject("aboutUsMapper.count", aboutUs);
		aboutUs.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(aboutUs.get("pageIndex")==null){
			aboutUs.put("pageIndex",0);
			aboutUs.put("startNu",0);
			aboutUs.put("pageSize",pageSize);
		}else{
			aboutUs.put("startNu",Integer.valueOf(aboutUs.get("pageIndex").toString())*pageSize);
			aboutUs.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("aboutUsMapper.select", aboutUs);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("aboutUsMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> aboutUs)throws Exception{
		return (Map<String,Object>)dao.findForObject("aboutUsMapper.select", aboutUs);
	}
	
	
	
}

