package com.adminlte.base.test;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.adminlte.sys.common.service.SysCommonService;
import com.adminlte.sys.dict.service.SysDictService;
import com.adminlte.utils.FreemarkerUtil;
import com.adminlte.utils.PathUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext-test.xml")
public class BaseTest3 {
	@Resource(name = "sysDictService")
	private SysDictService sysDictService;
	@Resource(name = "sysCommonService")
	private SysCommonService sysCommonService;
	@Test
	public void doFreemarkerCode() throws Exception{
		//模版生成路径
		String outPath="codeout";
		/* ============================================================================================= */
		String tableName = "sys_filex";
		String treeQuerytableName = "";
		System.out.println(tableName);
		if(StringUtils.contains(tableName, "+")) {
			treeQuerytableName = StringUtils.substringBefore(tableName, "+");
			tableName = StringUtils.substringAfter(tableName, "+");
		}
		Map<String,Object> paramMap = new HashMap<String,Object>();		//创建数据模型
		
		if(StringUtils.isNotEmpty(tableName)){
			String packageName = StringUtils.replace(tableName, "_", ".");
			String packagePath = StringUtils.replace(tableName, "_", "/");
			String objectName = this.getTableFieldName(tableName);	   			//类名				========2
			String objectClassName = StringUtils.capitalize(objectName);
			paramMap.put("packageName", packageName);
			paramMap.put("packagePath", packagePath);
			paramMap.put("objectName", objectName);//类名
			paramMap.put("objectNameLower", objectName.toLowerCase());		//类名(全小写)
			paramMap.put("objectNameUpper", objectName.toUpperCase());		//类名(全大写)
			paramMap.put("objectClassName", objectClassName);		//类名(全大写)
			paramMap.put("tablename", tableName);								//表前缀
			paramMap.put("tablenameLower", tableName.toLowerCase());			//表前缀小写
			paramMap.put("tablenameUpper", tableName.toUpperCase());			//表前缀大写
			paramMap.put("nowDate", new Date());
			List<Map<String,Object>> tableColumns = sysCommonService.selectColumn(tableName);
			paramMap.put("tableColumns", tableColumns);//COLUMN_NAME,COLUMN_COMMENT,DATA_TYPE
			String treeTableFlag = "0";
			
			for(int i=0;i<tableColumns.size();i++){
				String columnName = tableColumns.get(i).get("COLUMN_NAME").toString();
				if(columnName.contains("pid")){
					treeTableFlag = "1";
				}
			}
			paramMap.put("treeTableFlag", treeTableFlag);
			File file = new File(System.getProperty("user.dir") + "\\src\\" + outPath);
			FileUtils.deleteQuietly(file);
			/* ============================================================================================= */
			FreemarkerUtil.printFile("controllerTemplate.ftl", paramMap, objectClassName+"Controller.java", outPath);
			FreemarkerUtil.printFile("serviceTemplate.ftl", paramMap, objectClassName+"Service.java", outPath);
			FreemarkerUtil.printFile("facadeTemplate.ftl", paramMap, objectClassName+"Facade.java", outPath);
			FreemarkerUtil.printFile("mysqlCommonMap.ftl", paramMap, objectClassName+"CommonMapper.xml", outPath);
			FreemarkerUtil.printFile("mysqlMap.ftl", paramMap, objectClassName+"Mapper.xml", outPath);
			if(treeTableFlag=="1"){
				FreemarkerUtil.printFile("adminlte_tree_Template.ftl", paramMap, objectName.toLowerCase()+"_tree.jsp", outPath);
			}
			FreemarkerUtil.printFile("adminlte_edit_dialog_Template.ftl", paramMap, objectName.toLowerCase()+"_edit_dialog.jsp", outPath);
			FreemarkerUtil.printFile("adminlte_edit_Template.ftl", paramMap, objectName.toLowerCase()+"_edit.jsp", outPath);
			FreemarkerUtil.printFile("adminlte_list_Template.ftl", paramMap, objectName.toLowerCase()+"_list.jsp", outPath);
			
			System.out.println(PathUtil.getClassPath()+outPath);
			
			if(StringUtils.isNotEmpty(treeQuerytableName)){
				packageName = StringUtils.replace(treeQuerytableName, "_", ".");
				packagePath = StringUtils.replace(treeQuerytableName, "_", "/");
				objectName = this.getTableFieldName(tableName);
				String queryObjectName = this.getTableFieldName(treeQuerytableName);	   			//类名				========2
				objectClassName = StringUtils.capitalize(queryObjectName);
				paramMap.put("treepackageName", packageName);
				paramMap.put("treepackagePath", packagePath);
				paramMap.put("treeobjectName", queryObjectName);//类名
				paramMap.put("treeobjectNameLower", queryObjectName.toLowerCase());		//类名(全小写)
				paramMap.put("treeobjectNameUpper", queryObjectName.toUpperCase());		//类名(全大写)
				paramMap.put("treeobjectClassName", objectClassName);		//类名(全大写)
				paramMap.put("treetablename", treeQuerytableName);								//表前缀
				paramMap.put("treetablenameLower", treeQuerytableName.toLowerCase());			//表前缀小写
				paramMap.put("treetablenameUpper", treeQuerytableName.toUpperCase());			//表前缀大写
				paramMap.put("treenowDate", new Date());
				List<Map<String,Object>> treeTableColumns = sysCommonService.selectColumn(treeQuerytableName);
				paramMap.put("treeTableColumns", treeTableColumns);//COLUMN_NAME,COLUMN_COMMENT,DATA_TYPE
				/* ============================================================================================= */
				FreemarkerUtil.printFile("adminlte_list_tree.ftl", paramMap, objectName.toLowerCase()+"_list_tree.jsp", outPath);
				
				System.out.println(PathUtil.getClassPath()+outPath);
			}
			
			
		}
		
	}
	private String getTableFieldName(String tableName) {
		if(StringUtils.contains(tableName, "_")){
			String[] tableNames = StringUtils.split(tableName, "_");
			tableName = tableNames[0];
			for(int i=1;i<tableNames.length;i++){
				tableName = tableName+StringUtils.capitalize(tableNames[i]);
			}
		}
		return tableName;
	}
}
