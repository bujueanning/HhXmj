package com.adminlte.base.test;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.adminlte.sys.dict.service.SysDictService;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.PropertiesUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext-test.xml")
public class BaseTest2 {
	@Resource(name = "sysDictService")
	private SysDictService sysDictService;

	// 用户表列规范  sys_user_valid_d 
	// 备注规范         有效状态:0_无效,1_有效
	// 公共列规范      sys_user_flag_c
	// 备注规范         用户标记:0_系统用户,1_注册用户,2_双身份
	@Test
	public void saveTest() throws Exception {
		Properties dbProp = PropertiesUtil.getProperties("dbconfig.properties");
		Connection conn = DriverManager.getConnection(dbProp.getProperty("db.url"), dbProp.getProperty("db.name"),
				dbProp.getProperty("db.password"));
		String tableName = "sys_filex";
		List<String> dictDColumnList = new ArrayList<String>();
		List<String> dictCColumnList = new ArrayList<String>();
		DatabaseMetaData dbmd = conn.getMetaData();
		ResultSet rs = dbmd.getColumns(null, "%", tableName, "%");
		while (rs.next()) {
			String columnName = rs.getString("COLUMN_NAME").toLowerCase();
			String columnRemark = rs.getString("REMARKS");
			if (StringUtils.contains(columnRemark, ":")) {
				if (StringUtils.contains(columnName, "_d")) {
					dictDColumnList.add(columnName + "+" + columnRemark);
				}
				if (StringUtils.contains(columnName, "_c")) {
					dictCColumnList.add(columnName + "+" + columnRemark);
				}
				System.out.println("字典字段:" + columnName + "+" + columnRemark);
			}
		}
		ResultSet tablers = dbmd.getTables(null, null, tableName, null);
		String tableRemark = "";
		while (tablers.next()) {
			tableRemark = tablers.getString("REMARKS");
			if (!StringUtils.isNotEmpty(tableRemark)) {
				tableRemark = tableName;
			}
			System.out.println("表备注:" + tableRemark);
		}
		// 本表字典
		if (dictDColumnList.size() > 0) {
			Map<String, Object> sysDict = new HashMap<String, Object>();
			sysDict.put("sys_dict_value", tableName);
			sysDict = sysDictService.find(sysDict);
			if (sysDict != null) {
				Map<String, Object> paramDel = new HashMap<String, Object>();
				List<String> ids = new ArrayList<String>();
				ids.add(sysDict.get("sys_dict_id").toString());
				sysDictService.findAllTreeNodeIds(sysDict.get("sys_dict_id").toString(), ids);
				paramDel.put("ids", ids.toArray());
				sysDictService.delete(paramDel);
			}

			String rootId = IDUtil.get32UUID();
			Map<String, Object> rootsysDict = new HashMap<String, Object>();
			rootsysDict.put("sys_dict_id", rootId);
			rootsysDict.put("sys_dict_pid", "root");
			rootsysDict.put("sys_dict_name", tableRemark);
			rootsysDict.put("sys_dict_value", tableName);
			rootsysDict.put("sys_dict_seq", "0");
			rootsysDict.put("sys_dict_active", "0");
			rootsysDict.put("sys_dict_createdate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			rootsysDict.put("sys_dict_updatedate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			rootsysDict.put("sys_dict_createuid", "");
			rootsysDict.put("sys_dict_updateuid", "");
			sysDictService.save(rootsysDict);

			for (int i = 0; i < dictDColumnList.size(); i++) {
				String[] dict1 = StringUtils.split(dictDColumnList.get(i), "+");
				String[] dict2 = StringUtils.split(dict1[1], ":");
				String[] dict3 = StringUtils.split(dict2[1], ",");
				String paramId = IDUtil.get32UUID();
				Map<String, Object> paramsysDict = new HashMap<String, Object>();
				paramsysDict.put("sys_dict_id", paramId);
				paramsysDict.put("sys_dict_pid", rootId);
				paramsysDict.put("sys_dict_name", dict2[0]);
				paramsysDict.put("sys_dict_value", dict1[0]);
				paramsysDict.put("sys_dict_seq", "0");
				paramsysDict.put("sys_dict_active", "0");
				paramsysDict.put("sys_dict_createdate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
				paramsysDict.put("sys_dict_updatedate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
				paramsysDict.put("sys_dict_createuid", "");
				paramsysDict.put("sys_dict_updateuid", "");
				sysDictService.save(paramsysDict);
				for (int j = 0; j < dict3.length; j++) {
					String[] dict4 = StringUtils.split(dict3[j], "_");
					String valueId = IDUtil.get32UUID();
					Map<String, Object> valuesysDict = new HashMap<String, Object>();
					valuesysDict.put("sys_dict_id", valueId);
					valuesysDict.put("sys_dict_pid", paramId);
					valuesysDict.put("sys_dict_name", dict4[1]);
					valuesysDict.put("sys_dict_value", dict4[0]);
					valuesysDict.put("sys_dict_seq", "0");
					valuesysDict.put("sys_dict_active", "0");
					valuesysDict.put("sys_dict_createdate",
							new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
					valuesysDict.put("sys_dict_updatedate",
							new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
					valuesysDict.put("sys_dict_createuid", "");
					valuesysDict.put("sys_dict_updateuid", "");
					sysDictService.save(valuesysDict);
				}

			}
		}

		// 公共字典
		if (dictCColumnList.size() > 0) {
			Map<String, Object> sysRootDict = new HashMap<String, Object>();
			sysRootDict.put("sys_dict_value", "common");
			sysRootDict = sysDictService.find(sysRootDict);
			if(sysRootDict==null) {
				sysRootDict = new HashMap<String, Object>();
				String paramId = IDUtil.get32UUID();
				sysRootDict.put("sys_dict_id", paramId);
				sysRootDict.put("sys_dict_pid", "root");
				sysRootDict.put("sys_dict_name", "共用");
				sysRootDict.put("sys_dict_value", "common");
				sysRootDict.put("sys_dict_seq", "0");
				sysRootDict.put("sys_dict_active", "0");
				sysRootDict.put("sys_dict_createdate",
						new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
				sysRootDict.put("sys_dict_updatedate",
						new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
				sysRootDict.put("sys_dict_createuid", "");
				sysRootDict.put("sys_dict_updateuid", "");
				sysDictService.save(sysRootDict);
			}
			for (int i = 0; i < dictCColumnList.size(); i++) {
				String[] dict1 = StringUtils.split(dictCColumnList.get(i), "+");
				String commonDictName = StringUtils.substringAfter(dict1[0], tableName + "_");
				Map<String, Object> sysDict = new HashMap<String, Object>();
				sysDict.put("sys_dict_value", commonDictName);
				sysDict = sysDictService.find(sysDict);
				if (sysDict == null) {
					String[] dict2 = StringUtils.split(dict1[1], ":");
					String[] dict3 = StringUtils.split(dict2[1], ",");

				    String paramId = IDUtil.get32UUID();
					Map<String, Object> paramsysDict = new HashMap<String, Object>();
					paramsysDict.put("sys_dict_id", paramId);
					paramsysDict.put("sys_dict_pid", sysRootDict.get("sys_dict_id").toString());
					paramsysDict.put("sys_dict_name", dict2[0]);
					paramsysDict.put("sys_dict_value", commonDictName);
					paramsysDict.put("sys_dict_seq", "0");
					paramsysDict.put("sys_dict_active", "0");
					paramsysDict.put("sys_dict_createdate",
							new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
					paramsysDict.put("sys_dict_updatedate",
							new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
					paramsysDict.put("sys_dict_createuid", "");
					paramsysDict.put("sys_dict_updateuid", "");
					sysDictService.save(paramsysDict);
					for (int j = 0; j < dict3.length; j++) {
						String[] dict4 = StringUtils.split(dict3[j], "_");
						String valueId = IDUtil.get32UUID();
						Map<String, Object> valuesysDict = new HashMap<String, Object>();
						valuesysDict.put("sys_dict_id", valueId);
						valuesysDict.put("sys_dict_pid", paramId);
						valuesysDict.put("sys_dict_name", dict4[1]);
						valuesysDict.put("sys_dict_value", dict4[0]);
						valuesysDict.put("sys_dict_seq", "0");
						valuesysDict.put("sys_dict_active", "0");
						valuesysDict.put("sys_dict_createdate",
								new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
						valuesysDict.put("sys_dict_updatedate",
								new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
						valuesysDict.put("sys_dict_createuid", "");
						valuesysDict.put("sys_dict_updateuid", "");
						sysDictService.save(valuesysDict);
					}

				}

			}

		}

	}

}
