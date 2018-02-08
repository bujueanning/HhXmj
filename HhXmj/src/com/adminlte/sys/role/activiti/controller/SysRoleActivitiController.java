package com.adminlte.sys.role.activiti.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.reflect.FieldUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.adminlte.sys.role.activiti.pojo.SysRoleActiviti;
import com.adminlte.sys.role.activiti.pojo.SysRoleActivitiEx;
import com.adminlte.sys.role.activiti.service.SysRoleActivitiService;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.Page;
import com.adminlte.utils.ResponseUtil;


/** 
 * 类名称：sysRoleActivitiController
 * 创建人：Cheng
 * 创建时间：2016-10-14
 */
@Controller
@RequestMapping(value="sys/role/activiti")
public class SysRoleActivitiController{
	private Log logger = LogFactory.getLog(SysRoleActivitiController.class);
	@Resource(name="sysRoleActivitiService")
	private SysRoleActivitiService sysRoleActivitiService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save(SysRoleActiviti sysRoleActiviti) throws Exception{
		logger.info("start----------------新增sysRoleActiviti");
		if(StringUtils.isEmpty(sysRoleActiviti.getSysRoleActivitiId())){
			sysRoleActiviti.setSysRoleActivitiId(IDUtil.get32UUID());
			sysRoleActivitiService.save(sysRoleActiviti);
		}else{
			sysRoleActivitiService.editById(sysRoleActiviti,sysRoleActiviti.getSysRoleActivitiId());
		}
		
		return ResponseUtil.resultMap(1, "成功");
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/del")
	@ResponseBody
	public Object delete(SysRoleActiviti sysRoleActiviti){
		logger.info("start----------------删除sysRoleActiviti");
		try{
			sysRoleActivitiService.deleteById(sysRoleActiviti.getSysRoleActivitiId());
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "成功");
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(SysRoleActiviti sysRoleActiviti,String paneltitle) throws Exception{
		logger.info("start----------------修改sysRoleActiviti");
		ModelAndView mv = new ModelAndView();
		sysRoleActivitiService.editById(sysRoleActiviti,sysRoleActiviti.getSysRoleActivitiId());
		mv.addObject("msg","成功");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("sys/role/activiti/sysroleactiviti_list");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page,String orderByClause,SysRoleActivitiEx sysRoleActivitiEx,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表sysRoleActiviti");
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				FieldUtils.writeField(FieldUtils.getDeclaredField(sysRoleActivitiEx.getClass().getSuperclass(), conditionName, true), sysRoleActivitiEx, conditionValue, true);
			}
			List<SysRoleActiviti>	varList = sysRoleActivitiService.pageList(page, orderByClause, sysRoleActivitiEx);	//列出sysRoleActiviti列表
			mv.addObject("varList", varList);
			mv.addObject("page", page);
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("sys/role/activiti/sysroleactiviti_list");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goadd")
	public ModelAndView goAdd(SysRoleActiviti sysRoleActiviti,String paneltitle){
		logger.info("start----------------去新增sysRoleActiviti页面");
		ModelAndView mv = new ModelAndView();
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("sysRoleActiviti", sysRoleActiviti);
		mv.setViewName("sys/role/activiti/sysroleactiviti_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(SysRoleActiviti sysRoleActiviti,String paneltitle){
		logger.info("start----------------去修改sysRoleActiviti页面");
		ModelAndView mv = new ModelAndView();
		try {
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("sysRoleActiviti", sysRoleActivitiService.findById(sysRoleActiviti.getSysRoleActivitiId()));
			mv.setViewName("sys/role/activiti/sysroleactiviti_edit_dialog");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	/**
	 * 批量提交
	 */
	@RequestMapping(value="/postall")
	@ResponseBody
	public Object postObjAll(@RequestBody List<SysRoleActiviti> sysRoleActivitis) {
		logger.info("start----------------批量提交sysRoleActiviti");
		try {
//			systemUserService.deleteAllByIds(ids);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量提交sysRoleActiviti");
		}
		return ResponseUtil.resultMap(1, "成功");
	}
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/delall")
	@ResponseBody
	public Object deleteAll(@RequestParam("ids[]")List<String> ids) {
		logger.info("start----------------批量删除sysRoleActiviti");
		try {
			sysRoleActivitiService.deleteAllByIds(ids);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除sysRoleActiviti");
		}
		return ResponseUtil.resultMap(1, "成功");
	}
}
