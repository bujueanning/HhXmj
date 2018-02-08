package com.adminlte.utils;

import java.util.Properties;

public class Page {
	private Properties settingProp = PropertiesUtil.getProperties("setting.properties");
	private int pageIndex=Integer.parseInt((String) settingProp.get("pageIndex")); //当前页数
	private int startNu; //当前页起始记录数
	private int total=Integer.parseInt((String) settingProp.get("total"));	//总记录数
	private int pageSize=Integer.parseInt((String) settingProp.get("pageSize"));	//当前页展示记录
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getStartNu() {
		return startNu;
	}
	public void setStartNu(int startNu) {
		this.startNu = startNu;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}
