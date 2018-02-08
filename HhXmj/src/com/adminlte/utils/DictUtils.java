package com.adminlte.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import com.adminlte.sys.common.service.SysCommonService;
import com.adminlte.sys.dict.service.SysDictService;
@Component("dictUtils")
public class DictUtils {
	@Resource(name = "sysDictService")
	private SysDictService sysDictService;
	@Resource(name = "sysCommonService")
	private SysCommonService sysCommonService;
	
	public Map<String,Object> getDictByTable(String tableName){
		Map<String, Object> dictMap = new HashMap<String, Object>();
		try {
			List<Map<String, Object>> tableColumns =  sysCommonService.selectColumn(tableName);
			for (int i = 0; i < tableColumns.size(); i++) {
				String column_name = tableColumns.get(i).get("COLUMN_NAME").toString();
				if(StringUtils.endsWith(column_name, "_c")) {
					
					Map<String, Object> sysDict = new HashMap<String, Object>();
					sysDict.put("sys_dict_value", StringUtils.substringAfter(column_name, tableName+"_"));
					sysDict = sysDictService.find(sysDict);
					
					List<Object> sysDicts = sysDictService.findAllTreeNodes(sysDict.get("sys_dict_id").toString());
					for (int j = 0; j < sysDicts.size(); j++) {
						dictMap.put(sysDict.get("sys_dict_value").toString(), sysDicts);
					}
				}
				if(StringUtils.endsWith(column_name, "_d")) {
					Map<String, Object> sysDict = new HashMap<String, Object>();
					sysDict.put("sys_dict_value", column_name);
					sysDict = sysDictService.find(sysDict);
					
					List<Object> sysDicts = sysDictService.findAllTreeNodes(sysDict.get("sys_dict_id").toString());
					dictMap.put(sysDict.get("sys_dict_value").toString(), sysDicts);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dictMap;
	}
}
