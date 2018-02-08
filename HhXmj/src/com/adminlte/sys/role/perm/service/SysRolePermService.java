package com.adminlte.sys.role.perm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.PropertiesUtil;

@Service("sysRolePermService")
public class SysRolePermService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> sysRolePerm)throws Exception{
		dao.save("sysRolePermMapper.insert", sysRolePerm);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> sysRolePerms,Map<String,Object> sysRolePermKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", sysRolePermKey);
		paramMap.put("paramValue", sysRolePerms);
		dao.save("sysRolePermMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> sysRolePerm)throws Exception{
		dao.delete("sysRolePermMapper.delete", sysRolePerm);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> sysRolePerm)throws Exception{
		Map<String,Object> sysRolePermQuery = new HashMap<String,Object>();
		sysRolePermQuery.put("sys_role_perm_id",sysRolePerm.get("sys_role_perm_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sysRolePerm",sysRolePerm);
		paramMap.put("sysRolePermQuery",sysRolePermQuery);
		dao.update("sysRolePermMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> sysRolePerm)throws Exception{
		return (List<Object>)dao.findForList("sysRolePermMapper.select", sysRolePerm);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> sysRolePerm) throws Exception{
		Integer total = (Integer)dao.findForObject("sysRolePermMapper.count", sysRolePerm);
		sysRolePerm.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(sysRolePerm.get("pageIndex")==null){
			sysRolePerm.put("pageIndex",0);
			sysRolePerm.put("startNu",0);
			sysRolePerm.put("pageSize",pageSize);
		}else{
			sysRolePerm.put("startNu",Integer.valueOf(sysRolePerm.get("pageIndex").toString())*pageSize);
			sysRolePerm.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("sysRolePermMapper.select", sysRolePerm);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("sysRolePermMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> sysRolePerm)throws Exception{
		return (Map<String,Object>)dao.findForObject("sysRolePermMapper.select", sysRolePerm);
	}
	/*
	* 保存
	*/
	public void saveRolePerm(List<Object> sysRolePermList,String sys_role_id)throws Exception{
		Map<String,Object> paramDel = new HashMap<String,Object>();
		paramDel.put("sys_role_id", sys_role_id);
		this.delete(paramDel);
		for(int i=0;i<sysRolePermList.size();i++){
			Map<String,Object> sysRoleMenu = (Map<String,Object>)sysRolePermList.get(i);
			sysRoleMenu.put("sys_role_perm_id",IDUtil.get32UUID());
			sysRoleMenu.put("sys_role_id",sys_role_id);
			this.save(sysRoleMenu);
		}
	}
}

