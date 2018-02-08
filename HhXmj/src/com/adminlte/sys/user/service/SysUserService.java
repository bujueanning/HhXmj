package com.adminlte.sys.user.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("sysUserService")
public class SysUserService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> sysUser)throws Exception{
		dao.save("sysUserMapper.insert", sysUser);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> sysUsers,Map<String,Object> sysUserKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", sysUserKey);
		paramMap.put("paramValue", sysUsers);
		dao.save("sysUserMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> sysUser)throws Exception{
		dao.delete("sysUserMapper.delete", sysUser);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> sysUser)throws Exception{
		Map<String,Object> sysUserQuery = new HashMap<String,Object>();
		sysUserQuery.put("sys_user_id",sysUser.get("sys_user_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sysUser",sysUser);
		paramMap.put("sysUserQuery",sysUserQuery);
		dao.update("sysUserMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> sysUser)throws Exception{
		return (List<Object>)dao.findForList("sysUserMapper.select", sysUser);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> sysUser) throws Exception{
		Integer total = (Integer)dao.findForObject("sysUserMapper.count", sysUser);
		sysUser.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(sysUser.get("pageIndex")==null){
			sysUser.put("pageIndex",0);
			sysUser.put("startNu",0);
			sysUser.put("pageSize",pageSize);
		}else{
			sysUser.put("startNu",Integer.valueOf(sysUser.get("pageIndex").toString())*pageSize);
			sysUser.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("sysUserMapper.select", sysUser);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("sysUserMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> sysUser)throws Exception{
		return (Map<String,Object>)dao.findForObject("sysUserMapper.select", sysUser);
	}
	
	
	
}

