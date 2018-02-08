package com.adminlte.website.company.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("companyNewsService")
public class CompanyNewsService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> companyNews)throws Exception{
		dao.save("companyNewsMapper.insert", companyNews);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> companyNewss,Map<String,Object> companyNewsKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", companyNewsKey);
		paramMap.put("paramValue", companyNewss);
		dao.save("companyNewsMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> companyNews)throws Exception{
		dao.delete("companyNewsMapper.delete", companyNews);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> companyNews)throws Exception{
		Map<String,Object> companyNewsQuery = new HashMap<String,Object>();
		companyNewsQuery.put("company_news_id",companyNews.get("company_news_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("companyNews",companyNews);
		paramMap.put("companyNewsQuery",companyNewsQuery);
		dao.update("companyNewsMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> companyNews)throws Exception{
		return (List<Object>)dao.findForList("companyNewsMapper.select", companyNews);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> companyNews) throws Exception{
		Integer total = (Integer)dao.findForObject("companyNewsMapper.count", companyNews);
		companyNews.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(companyNews.get("pageIndex")==null){
			companyNews.put("pageIndex",0);
			companyNews.put("startNu",0);
			companyNews.put("pageSize",pageSize);
		}else{
			companyNews.put("startNu",Integer.valueOf(companyNews.get("pageIndex").toString())*pageSize);
			companyNews.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("companyNewsMapper.select", companyNews);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("companyNewsMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> companyNews)throws Exception{
		return (Map<String,Object>)dao.findForObject("companyNewsMapper.select", companyNews);
	}
	
	
	
}

