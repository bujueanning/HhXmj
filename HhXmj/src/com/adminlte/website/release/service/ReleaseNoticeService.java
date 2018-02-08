package com.adminlte.website.release.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("releaseNoticeService")
public class ReleaseNoticeService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> releaseNotice)throws Exception{
		dao.save("releaseNoticeMapper.insert", releaseNotice);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> releaseNotices,Map<String,Object> releaseNoticeKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", releaseNoticeKey);
		paramMap.put("paramValue", releaseNotices);
		dao.save("releaseNoticeMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> releaseNotice)throws Exception{
		dao.delete("releaseNoticeMapper.delete", releaseNotice);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> releaseNotice)throws Exception{
		Map<String,Object> releaseNoticeQuery = new HashMap<String,Object>();
		releaseNoticeQuery.put("release_notice_id",releaseNotice.get("release_notice_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("releaseNotice",releaseNotice);
		paramMap.put("releaseNoticeQuery",releaseNoticeQuery);
		dao.update("releaseNoticeMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> releaseNotice)throws Exception{
		return (List<Object>)dao.findForList("releaseNoticeMapper.select", releaseNotice);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> releaseNotice) throws Exception{
		Integer total = (Integer)dao.findForObject("releaseNoticeMapper.count", releaseNotice);
		releaseNotice.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(releaseNotice.get("pageIndex")==null){
			releaseNotice.put("pageIndex",0);
			releaseNotice.put("startNu",0);
			releaseNotice.put("pageSize",pageSize);
		}else{
			releaseNotice.put("startNu",Integer.valueOf(releaseNotice.get("pageIndex").toString())*pageSize);
			releaseNotice.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("releaseNoticeMapper.select", releaseNotice);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("releaseNoticeMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> releaseNotice)throws Exception{
		return (Map<String,Object>)dao.findForObject("releaseNoticeMapper.select", releaseNotice);
	}
	
	
	
}

