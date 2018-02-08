package com.adminlte.sys.user.role.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.PropertiesUtil;

@Service("sysUserRoleService")
public class SysUserRoleService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> sysUserRole)throws Exception{
		dao.save("sysUserRoleMapper.insert", sysUserRole);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> sysUserRoles,Map<String,Object> sysUserRoleKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", sysUserRoleKey);
		paramMap.put("paramValue", sysUserRoles);
		dao.save("sysUserRoleMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> sysUserRole)throws Exception{
		dao.delete("sysUserRoleMapper.delete", sysUserRole);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> sysUserRole)throws Exception{
		Map<String,Object> sysUserRoleQuery = new HashMap<String,Object>();
		sysUserRoleQuery.put("sys_user_role_id",sysUserRole.get("sys_user_role_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sysUserRole",sysUserRole);
		paramMap.put("sysUserRoleQuery",sysUserRoleQuery);
		dao.update("sysUserRoleMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> sysUserRole)throws Exception{
		return (List<Object>)dao.findForList("sysUserRoleMapper.select", sysUserRole);
	}
	
	/*
	*列表
	*/
	public List<Object> listMenuIdByUserId(Map<String,Object> sysUserRole)throws Exception{
		return (List<Object>)dao.findForList("sysUserRoleMapper.listMenuIdByUserId", sysUserRole);
	}
	/*
	*列表
	*/
	public List<Object> listPermByUserId(Map<String,Object> sysUserRole)throws Exception{
		return (List<Object>)dao.findForList("sysUserRoleMapper.listPermByUserId", sysUserRole);
	}
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> sysUserRole) throws Exception{
		Integer total = (Integer)dao.findForObject("sysUserRoleMapper.count", sysUserRole);
		sysUserRole.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(sysUserRole.get("pageIndex")==null){
			sysUserRole.put("pageIndex",0);
			sysUserRole.put("startNu",0);
			sysUserRole.put("pageSize",pageSize);
		}else{
			sysUserRole.put("startNu",Integer.valueOf(sysUserRole.get("pageIndex").toString())*pageSize);
			sysUserRole.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("sysUserRoleMapper.select", sysUserRole);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("sysUserRoleMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> sysUserRole)throws Exception{
		return (Map<String,Object>)dao.findForObject("sysUserRoleMapper.select", sysUserRole);
	}
	/*
	* 新增
	*/
	public void saveUserRole(List<Map<String,Object>> sysUserRoleList,String sys_user_id)throws Exception{
		Map<String,Object> paramDel = new HashMap<String,Object>();
		paramDel.put("sys_user_id", sys_user_id);
		this.delete(paramDel);
		for(int i=0;i<sysUserRoleList.size();i++){
			Map<String,Object> sysUserRole = (Map<String,Object>)sysUserRoleList.get(i);
			sysUserRole.put("sys_user_role_id",IDUtil.get32UUID());
			sysUserRole.put("sys_user_id",sys_user_id);
			this.save(sysUserRole);
		}
	}
	/*
	* 通过roleid获取userid数据
	* type:partsel,selected
	*/
	public List<String> findUserIdByRoleId(List<String> roleIdList)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("roleIds", roleIdList.toArray());
		return (List<String>)dao.findForList("sysUserRoleMapper.findUserIdByRoleId", paramMap);
	}
	
	
	
}

