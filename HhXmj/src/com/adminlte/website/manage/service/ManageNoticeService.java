package com.adminlte.website.manage.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("manageNoticeService")
public class ManageNoticeService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> manageNotice)throws Exception{
		dao.save("manageNoticeMapper.insert", manageNotice);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> manageNotices,Map<String,Object> manageNoticeKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", manageNoticeKey);
		paramMap.put("paramValue", manageNotices);
		dao.save("manageNoticeMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> manageNotice)throws Exception{
		dao.delete("manageNoticeMapper.delete", manageNotice);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> manageNotice)throws Exception{
		Map<String,Object> manageNoticeQuery = new HashMap<String,Object>();
		manageNoticeQuery.put("manage_notice_id",manageNotice.get("manage_notice_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("manageNotice",manageNotice);
		paramMap.put("manageNoticeQuery",manageNoticeQuery);
		dao.update("manageNoticeMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> manageNotice)throws Exception{
		return (List<Object>)dao.findForList("manageNoticeMapper.select", manageNotice);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> manageNotice) throws Exception{
		Integer total = (Integer)dao.findForObject("manageNoticeMapper.count", manageNotice);
		manageNotice.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(manageNotice.get("pageIndex")==null){
			manageNotice.put("pageIndex",0);
			manageNotice.put("startNu",0);
			manageNotice.put("pageSize",pageSize);
		}else{
			manageNotice.put("startNu",Integer.valueOf(manageNotice.get("pageIndex").toString())*pageSize);
			manageNotice.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("manageNoticeMapper.select", manageNotice);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("manageNoticeMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> manageNotice)throws Exception{
		return (Map<String,Object>)dao.findForObject("manageNoticeMapper.select", manageNotice);
	}
	
	
	
}

