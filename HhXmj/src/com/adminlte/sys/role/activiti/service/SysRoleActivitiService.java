package com.adminlte.sys.role.activiti.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.adminlte.base.dao.DaoSupport;
import com.adminlte.sys.role.activiti.pojo.SysRoleActiviti;
import com.adminlte.sys.role.activiti.pojo.SysRoleActivitiCriteria;
import com.adminlte.sys.role.activiti.pojo.SysRoleActivitiCriteria.Criteria;
import com.adminlte.sys.role.activiti.pojo.SysRoleActivitiEx;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.Page;


@Service("sysRoleActivitiService")
public class SysRoleActivitiService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(SysRoleActiviti sysRoleActiviti)throws Exception{
		dao.save("sysRoleActivitiMapper.insertSelective", sysRoleActiviti);
	}
	/*
	* 新增
	*/
	public void saveRoleActiviti(List<SysRoleActiviti> sysRoleActivitiList,String sysRoleId)throws Exception{
		this.deleteByRoleId(sysRoleId);
		for(int i=0;i<sysRoleActivitiList.size();i++){
			SysRoleActiviti sysRoleActiviti = new SysRoleActiviti();
			sysRoleActiviti.setSysRoleActivitiId(IDUtil.get32UUID());
			sysRoleActiviti.setSysRoleId(sysRoleId);
			sysRoleActiviti.setSysActivitiId(sysRoleActivitiList.get(i).getSysActivitiId());
			sysRoleActiviti.setSysRoleActivitiType(sysRoleActivitiList.get(i).getSysRoleActivitiType());
			this.save(sysRoleActiviti);
		}
	}
	/*
	* 通过id获取数据
	*/
	public List<SysRoleActiviti> findSelectedByRoleId(String roleId)throws Exception{
		SysRoleActivitiCriteria sysRoleActivitiCriteria = new SysRoleActivitiCriteria();
		Criteria criteria = sysRoleActivitiCriteria.createCriteria();
		criteria.andSysRoleIdEqualTo(roleId);
		criteria.andSysRoleActivitiTypeEqualTo("selected");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("sysRoleActivitiCriteria", sysRoleActivitiCriteria);
		
		return (List<SysRoleActiviti>)dao.findForList("sysRoleActivitiMapper.selectByCriteria", paramMap);
	}
	/*
	* 删除
	*/
	public void deleteByRoleId(String sysRoleId)throws Exception{
		SysRoleActivitiCriteria sysRoleActivitiCriteria = new SysRoleActivitiCriteria();
		Criteria criteria = sysRoleActivitiCriteria.createCriteria();
		criteria.andSysRoleIdEqualTo(sysRoleId);
		dao.delete("sysRoleActivitiMapper.deleteByCriteria", sysRoleActivitiCriteria);
	}
	/*
	* 删除
	*/
	public void deleteByRoleIds(List<String> sysRoleIds)throws Exception{
		SysRoleActivitiCriteria sysRoleActivitiCriteria = new SysRoleActivitiCriteria();
		Criteria criteria = sysRoleActivitiCriteria.createCriteria();
		criteria.andSysRoleIdIn(sysRoleIds);
		dao.delete("sysRoleActivitiMapper.deleteByCriteria", sysRoleActivitiCriteria);
	}
	/*
	* 删除
	*/
	public void deleteByActivitiIds(List<String> sysActivitiIds)throws Exception{
		SysRoleActivitiCriteria sysRoleActivitiCriteria = new SysRoleActivitiCriteria();
		Criteria criteria = sysRoleActivitiCriteria.createCriteria();
		criteria.andSysActivitiIdIn(sysActivitiIds);
		dao.delete("sysRoleActivitiMapper.deleteByCriteria", sysRoleActivitiCriteria);
	}
	/*
	* 删除
	*/
	public void deleteById(String sysRoleActivitiId)throws Exception{
		SysRoleActivitiCriteria sysRoleActivitiCriteria = new SysRoleActivitiCriteria();
		Criteria criteria = sysRoleActivitiCriteria.createCriteria();
		criteria.andSysRoleActivitiIdEqualTo(sysRoleActivitiId);
		dao.delete("sysRoleActivitiMapper.deleteByCriteria", sysRoleActivitiCriteria);
	}
	/*
	* 删除
	*/
	public void deleteByActivitiId(String sysActivitiId)throws Exception{
		SysRoleActivitiCriteria sysRoleActivitiCriteria = new SysRoleActivitiCriteria();
		Criteria criteria = sysRoleActivitiCriteria.createCriteria();
		criteria.andSysActivitiIdEqualTo(sysActivitiId);
		dao.delete("sysRoleActivitiMapper.deleteByCriteria", sysRoleActivitiCriteria);
	}
	/*
	* 批量删除
	*/
	public void deleteAllByIds(List<String> ids)throws Exception{
		SysRoleActivitiCriteria sysRoleActivitiCriteria = new SysRoleActivitiCriteria();
		Criteria criteria = sysRoleActivitiCriteria.createCriteria();
		criteria.andSysRoleActivitiIdIn(ids);
		
		dao.delete("sysRoleActivitiMapper.deleteByCriteria", sysRoleActivitiCriteria);
	}
	
	/*
	* 修改
	*/
	public void editById(SysRoleActiviti sysRoleActiviti,String sysRoleActivitiId)throws Exception{
		SysRoleActivitiCriteria sysRoleActivitiCriteria = new SysRoleActivitiCriteria();
		Criteria criteria = sysRoleActivitiCriteria.createCriteria();
		criteria.andSysRoleActivitiIdEqualTo(sysRoleActivitiId);
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sysRoleActivitiCriteria", sysRoleActivitiCriteria);
		paramMap.put("sysRoleActiviti", sysRoleActiviti);
	
		dao.update("sysRoleActivitiMapper.updateSelective", paramMap);
	}
	
	/*
	*列表
	*/
	public List<SysRoleActiviti> list(SysRoleActiviti sysRoleActiviti)throws Exception{
	    SysRoleActivitiCriteria sysRoleActivitiCriteria = new SysRoleActivitiCriteria();
		Criteria criteria = sysRoleActivitiCriteria.createCriteria();
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sysRoleActivitiCriteria", sysRoleActivitiCriteria);
		return (List<SysRoleActiviti>)dao.findForList("sysRoleActivitiMapper.selectByCriteria", paramMap);
	}
	
	/*
	*分页列表
	*/
	public List<SysRoleActiviti> pageList(Page page,String orderByClause,SysRoleActivitiEx sysRoleActivitiEx) throws Exception{
		SysRoleActivitiCriteria sysRoleActivitiCriteria = new SysRoleActivitiCriteria();
		sysRoleActivitiCriteria.setOrderByClause(orderByClause);
		Criteria criteria = sysRoleActivitiCriteria.createCriteria();
		
	    if(StringUtils.isNotEmpty(sysRoleActivitiEx.getSysRoleActivitiType())){
			criteria.andSysRoleActivitiTypeLike('%'+sysRoleActivitiEx.getSysRoleActivitiType()+'%');
		}
		
		Integer total = (Integer)dao.findForObject("sysRoleActivitiMapper.countByCriteria", sysRoleActivitiCriteria);
		page.setTotal(total);
		page.setStartNu(page.getPageIndex()*page.getPageSize());
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sysRoleActivitiCriteria", sysRoleActivitiCriteria);
		paramMap.put("page", page);
		return (List<SysRoleActiviti>)dao.findForList("sysRoleActivitiMapper.selectByCriteria", paramMap);
	}
	
	/*
	*查找所有
	*/
	public List<SysRoleActiviti> findAll()throws Exception{
	    SysRoleActivitiCriteria sysRoleActivitiCriteria = new SysRoleActivitiCriteria();
		Criteria criteria = sysRoleActivitiCriteria.createCriteria();
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sysRoleActivitiCriteria", sysRoleActivitiCriteria);
		return (List<SysRoleActiviti>)dao.findForList("sysRoleActivitiMapper.selectByCriteria", paramMap);
	}
	
	/*
	* 通过id获取数据
	*/
	public SysRoleActiviti findById(String sysRoleActivitiId)throws Exception{
		SysRoleActivitiCriteria sysRoleActivitiCriteria = new SysRoleActivitiCriteria();
		Criteria criteria = sysRoleActivitiCriteria.createCriteria();
		criteria.andSysRoleActivitiIdEqualTo(sysRoleActivitiId);
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sysRoleActivitiCriteria", sysRoleActivitiCriteria);
		
		return (SysRoleActiviti)dao.findForObject("sysRoleActivitiMapper.selectByCriteria", paramMap);
	}
	/*
	* 通过id获取数据
	*/
	public List<String> findRoleIdByActivitiId(String sysActivitiId)throws Exception{
		SysRoleActivitiCriteria sysRoleActivitiCriteria = new SysRoleActivitiCriteria();
		Criteria criteria = sysRoleActivitiCriteria.createCriteria();
		criteria.andSysActivitiIdEqualTo(sysActivitiId);
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sysRoleActivitiCriteria", sysRoleActivitiCriteria);
		
		return (List<String>)dao.findForList("sysRoleActivitiMapper.selectRoleIdByCriteria", paramMap);
	}
	
	
	
}

