package com.adminlte.${packageName}.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.adminlte.${packageName}.service.${objectClassName}Service;
import com.adminlte.utils.DictUtils;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.POIUtil;
import com.adminlte.utils.PathUtil;
import com.adminlte.utils.RequestUtil;
import com.adminlte.utils.ResponseUtil;
import com.adminlte.utils.ShiroUtils;


/** 
 * 类名称：${objectName}Controller
 * 创建人：Cheng
 * 创建时间：${nowDate?string("yyyy-MM-dd")}
 */
@Controller
@RequestMapping(value="${packagePath}")
public class ${objectClassName}Controller{
	private Log logger = LogFactory.getLog(${objectClassName}Controller.class);
	@Resource(name="${objectName}Service")
	private ${objectClassName}Service ${objectName}Service;
	<#list tableColumns as var>
		<#if var["COLUMN_NAME"]?ends_with("_id")  && var["COLUMN_NAME"]?replace("_id","")!=tablename>
		   @Resource(name="${var["COLUMN_NAME"]?replace("_id","")?replace("_.*","","r")}${var["COLUMN_NAME"]?replace("_id","")?replace(".*_","","r")?cap_first}Service")
			private ${var["COLUMN_NAME"]?replace("_id","")?replace("_.*","","r")?cap_first}${var["COLUMN_NAME"]?replace("_id","")?replace(".*_","","r")?cap_first}Service  ${var["COLUMN_NAME"]?replace("_id","")?replace("_.*","","r")}${var["COLUMN_NAME"]?replace("_id","")?replace(".*_","","r")?cap_first}Service;
		</#if>
	</#list>
	@Resource(name = "dictUtils")
	private DictUtils dictUtils;
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save() throws Exception{
		logger.info("start----------------新增${objectName}");
		Map<String,Object> ${objectName} = RequestUtil.getParameterMap(logger);
		if(StringUtils.isEmpty(${objectName}.get("${tablenameLower}_id").toString())){
			${objectName}.put("${tablenameLower}_id", IDUtil.get32UUID());
			${objectName}.put("${tablenameLower}_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			${objectName}.put("${tablenameLower}_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			${objectName}Service.save(${objectName});
		}else{
			${objectName}.put("${tablenameLower}_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    ${objectName}.put("${tablenameLower}_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			${objectName}Service.updateById(${objectName});
		}
		
		return ResponseUtil.resultMap(1, "success");
	}
	/**
	 * 上传
	 */
	@RequestMapping("/upload") 
	@ResponseBody
	public String upload(@RequestParam(value="files[]", required=false) MultipartFile[] files,String ${objectName}Id){
		String path = PathUtil.getWebPath()+"upload/";
		try {
			for(MultipartFile mfile : files){
	            if (!mfile.isEmpty()) {
                	Map<String,Object> ${objectName}Map = new HashMap<String,Object>();
                	 <#list tableColumns as var>
	                	 <#if var["COLUMN_NAME"]=="${tablenameLower}_id" >
	                	 	${objectName}Map.put("${var["COLUMN_NAME"]}", IDUtil.get32UUID());
						 <#else>
							${objectName}Map.put("${var["COLUMN_NAME"]}", "");
						 </#if>
					</#list>
	                ${objectName}Service.saveList(POIUtil.readExcelToMap(mfile.getInputStream(),mfile.getName(),${objectName}Map),${objectName}Map);
	            }
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "success";
	}
	/**
	 * 下载
	 */
	@RequestMapping("/download") 
	public ResponseEntity<byte[]> download(){
		ResponseEntity<byte[]> down = null;
		try {
	        File file=new File("E:\\test.xlsx");  
	        HttpHeaders headers = new HttpHeaders();  
	        String fileName= new String("你好.xlsx".getBytes("UTF-8"),"iso-8859-1");//为了解决中文名称乱码问题  
	        headers.setContentDispositionFormData("attachment", fileName);   
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);   
	        down =  new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),    
	                headers, HttpStatus.CREATED);   
		} catch (Exception e) {
			e.printStackTrace();
		}
		return down;
	}
	/**
	 * 删除
	 */
	@RequestMapping(value="/del")
	@ResponseBody
	public Object delete(){
		logger.info("start----------------删除${objectName}");
		Map<String,Object> ${objectName} = RequestUtil.getParameterMap(logger);
		try{
			${objectName}Service.delete(${objectName});
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "success");
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(String paneltitle) throws Exception{
		logger.info("start----------------修改${objectName}");
		Map<String,Object> ${objectName} = RequestUtil.getParameterMap(logger);
		${objectName}.put("${tablenameLower}_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
	    ${objectName}.put("${tablenameLower}_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
		${objectName}Service.updateById(${objectName});
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","success");
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("${packagePath}/${objectNameLower}_list");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表${objectName}");
		Map<String,Object> ${objectName} = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				${objectName}.put(conditionName,conditionValue);
			}
			List<Object> varList = ${objectName}Service.pageList(${objectName});	//列出${objectName}列表
			mv.addObject("varList", varList);
			mv.addObject("${objectName}", ${objectName});
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("${packagePath}/${objectNameLower}_list");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 列表
	 */
	@RequestMapping(value="/listtree")
	public ModelAndView listTree(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表${objectName}");
		Map<String,Object> ${objectName} = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				${objectName}.put(conditionName,conditionValue);
			}
			List<Object> varList = ${objectName}Service.pageList(${objectName});	//列出${objectName}列表
			mv.addObject("varList", varList);
			mv.addObject("${objectName}", ${objectName});
			mv.addObject("conditionName", conditionName);
			mv.addObject("conditionValue", conditionValue);
			mv.addObject("paneltitle", paneltitle);
			mv.setViewName("${packagePath}/${objectNameLower}_list_tree");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 列表json方式
	 */
	@RequestMapping(value="/listjson")
	@ResponseBody
	public Object listjson(String orderByClause,String conditionName,String conditionValue,String paneltitle){
		logger.info("start----------------列表${objectName}");
		Map<String,Object> ${objectName} = RequestUtil.getParameterMap(logger);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			if(StringUtils.isNotEmpty(conditionName)&&StringUtils.isNotEmpty(conditionValue)){
				${objectName}.put(conditionName,conditionValue);
			}
			List<Object> varList = ${objectName}Service.pageList(${objectName});	//列出${objectName}列表
			resultMap.put("varList", varList);
			resultMap.put("${objectName}", ${objectName});
			resultMap.put("conditionName", conditionName);
			resultMap.put("conditionValue", conditionValue);
			resultMap.put("paneltitle", paneltitle);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "成功", resultMap);
	}
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goadd")
	public ModelAndView goAdd(String paneltitle){
		logger.info("start----------------去新增${objectName}页面");
		Map<String,Object> ${objectName} = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		mv.addObject("paneltitle", paneltitle);
		mv.addObject("${objectName}", ${objectName});
		mv.addObject("dict", dictUtils.getDictByTable("${tablenameLower}"));
		mv.setViewName("${packagePath}/${objectNameLower}_edit_dialog");
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goedit")
	public ModelAndView goEdit(String paneltitle){
		logger.info("start----------------去修改${objectName}页面");
		Map<String,Object> ${objectName} = RequestUtil.getParameterMap(logger);
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("${objectName}", ${objectName}Service.find(${objectName}));
			<#list tableColumns as var>
			<#if var["COLUMN_NAME"]?ends_with("_id")  && var["COLUMN_NAME"]?replace("_id","")!=tablename>
			List<Map<String,Object>> ${var["COLUMN_NAME"]?replace("_id","")?replace("_.*","","r")}${var["COLUMN_NAME"]?replace("_id","")?replace(".*_","","r")?cap_first}List = new ArrayList<Map<String,Object>>();
        	 mv.addObject("${var["COLUMN_NAME"]?replace("_id","")?replace("_.*","","r")}${var["COLUMN_NAME"]?replace("_id","")?replace(".*_","","r")?cap_first}", ${var["COLUMN_NAME"]?replace("_id","")?replace("_.*","","r")}${var["COLUMN_NAME"]?replace("_id","")?replace(".*_","","r")?cap_first}Service.findSelect2(${var["COLUMN_NAME"]?replace("_id","")?replace("_.*","","r")}${var["COLUMN_NAME"]?replace("_id","")?replace(".*_","","r")?cap_first}List,"root", ""));
			</#if>
			</#list>
			
			mv.addObject("dict", dictUtils.getDictByTable("${tablenameLower}"));
			mv.setViewName("${packagePath}/${objectNameLower}_edit_dialog");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/delall")
	@ResponseBody
	public Object deleteAll() {
		logger.info("start----------------批量删除${objectName}");
		Map<String,Object> ${objectName} = RequestUtil.getParameterMap(logger);
		try {
			${objectName}Service.delete(${objectName});
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------批量删除${objectName}");
		}
		return ResponseUtil.resultMap(1, "success");
	}
<#if treeTableFlag=="1" >
	/**
	 * 树列表
	 */
	@RequestMapping(value="/tree")
	public ModelAndView tree(String paneltitle){
		logger.info("start----------------列表${objectName}");
		ModelAndView mv = new ModelAndView();
		try{
			mv.addObject("paneltitle", paneltitle);
			mv.addObject("dict", dictUtils.getDictByTable("${tablenameLower}"));
			mv.setViewName("${packagePath}/${objectNameLower}_tree");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 新增
	 */
	@RequestMapping(value="/savetree")
	@ResponseBody
	public Object saveTree() throws Exception{
		logger.info("start----------------新增${objectName}Tree");
		Map<String,Object> ${objectName}Tree = RequestUtil.getParameterMap(logger);
		if(StringUtils.isEmpty(${objectName}Tree.get("${tablenameLower}_id").toString())){
			${objectName}Tree.put("${tablenameLower}_id",IDUtil.get32UUID());
			${objectName}Tree.put("${tablenameLower}_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			${objectName}Tree.put("${tablenameLower}_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			${objectName}Service.save(${objectName}Tree);
		}else{
			${objectName}Tree.put("${tablenameLower}_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		    ${objectName}Tree.put("${tablenameLower}_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			${objectName}Service.updateById(${objectName}Tree);
		}
		${objectName}Tree.put("key",${objectName}Tree.get("${tablenameLower}_id").toString());
		${objectName}Tree.put("title",${objectName}Tree.get("${tablenameLower}_name").toString());
		${objectName}Tree.put("lazy",false);
		return ${objectName}Tree;
	}
	/**
	 * 查询树
	 */
	@RequestMapping(value="/treenode")
	@ResponseBody
	public Object getTreeNode() {
		logger.info("start----------------查询树${objectName}");
		Map<String,Object> ${objectName} = RequestUtil.getParameterMap(logger);
		List<Object> ${objectName}TreeList = new ArrayList<Object>();
		try {
			${objectName}TreeList = ${objectName}Service.findChildTreeNodes(${objectName});
			for (int i = 0; i < ${objectName}TreeList.size(); i++) {
				Map<String,Object> treeMap = (Map<String,Object>)${objectName}TreeList.get(i);
				treeMap.put("key", treeMap.get("treekey"));
				treeMap.put("title", treeMap.get("treetitle"));
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------查询树${objectName}");
		}
		return ${objectName}TreeList;
	}
	/**
	 * 查询树所有子节点
	 */
	@RequestMapping(value="/treenodeall")
	@ResponseBody
	public Object getAllTreeNode() {
		logger.info("start----------------查询树${objectName}");
		Map<String,Object> ${objectName} = RequestUtil.getParameterMap(logger);
		List<Object> ${objectName}TreeList = new ArrayList<Object>();
		try {
			${objectName}TreeList = ${objectName}Service.findAllTreeNodes(${objectName}.get("${tablenameLower}_pid").toString());
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logger.info("end----------------查询树${objectName}");
		}
		return ${objectName}TreeList;
	}
	/**
	 * 删除树节点
	 */
	@RequestMapping(value="/deltree")
	@ResponseBody
	public Object deleteTree(){
		logger.info("start----------------删除sysMenu");
		Map<String,Object> ${objectName} = RequestUtil.getParameterMap(logger);
		Map<String,Object> paramDel = new HashMap<String,Object>();
		try{
			List<String> ids = new ArrayList<String>();
			ids.add(${objectName}.get("${tablenameLower}_id").toString());
			${objectName}Service.findAllTreeNodeIds(${objectName}.get("${tablenameLower}_id").toString(),ids);
			paramDel.put("ids", ids.toArray());
			${objectName}Service.delete(paramDel);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return ResponseUtil.resultMap(1, "success");
	}
</#if>
}
