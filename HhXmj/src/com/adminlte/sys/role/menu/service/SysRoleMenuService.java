package com.adminlte.sys.role.menu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.PropertiesUtil;

@Service("sysRoleMenuService")
public class SysRoleMenuService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> sysRoleMenu)throws Exception{
		dao.save("sysRoleMenuMapper.insert", sysRoleMenu);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> sysRoleMenus,Map<String,Object> sysRoleMenuKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", sysRoleMenuKey);
		paramMap.put("paramValue", sysRoleMenus);
		dao.save("sysRoleMenuMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> sysRoleMenu)throws Exception{
		dao.delete("sysRoleMenuMapper.delete", sysRoleMenu);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> sysRoleMenu)throws Exception{
		Map<String,Object> sysRoleMenuQuery = new HashMap<String,Object>();
		sysRoleMenuQuery.put("sys_role_menu_id",sysRoleMenu.get("sys_role_menu_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sysRoleMenu",sysRoleMenu);
		paramMap.put("sysRoleMenuQuery",sysRoleMenuQuery);
		dao.update("sysRoleMenuMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> sysRoleMenu)throws Exception{
		return (List<Object>)dao.findForList("sysRoleMenuMapper.select", sysRoleMenu);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> sysRoleMenu) throws Exception{
		Integer total = (Integer)dao.findForObject("sysRoleMenuMapper.count", sysRoleMenu);
		sysRoleMenu.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(sysRoleMenu.get("pageIndex")==null){
			sysRoleMenu.put("pageIndex",0);
			sysRoleMenu.put("startNu",0);
			sysRoleMenu.put("pageSize",pageSize);
		}else{
			sysRoleMenu.put("startNu",Integer.valueOf(sysRoleMenu.get("pageIndex").toString())*pageSize);
			sysRoleMenu.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("sysRoleMenuMapper.select", sysRoleMenu);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("sysRoleMenuMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> sysRoleMenu)throws Exception{
		return (Map<String,Object>)dao.findForObject("sysRoleMenuMapper.select", sysRoleMenu);
	}
	/*
	* 保存
	*/
	public void saveRoleMenu(List<Object> sysRoleMenuList,String sys_role_id)throws Exception{
		Map<String,Object> paramDel = new HashMap<String,Object>();
		paramDel.put("sys_role_id", sys_role_id);
		this.delete(paramDel);
		for(int i=0;i<sysRoleMenuList.size();i++){
			Map<String,Object> sysRoleMenu = (Map<String,Object>)sysRoleMenuList.get(i);
			sysRoleMenu.put("sys_role_menu_id",IDUtil.get32UUID());
			sysRoleMenu.put("sys_role_id",sys_role_id);
			this.save(sysRoleMenu);
		}
	}
}

