package com.adminlte.base.test;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.adminlte.sys.common.service.SysCommonService;
import com.adminlte.sys.dict.service.SysDictService;
import com.adminlte.utils.DictUtils;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext-test.xml")
public class BaseTest4 {
	@Resource(name = "sysDictService")
	private SysDictService sysDictService;
	@Resource(name = "sysCommonService")
	private SysCommonService sysCommonService;
	@Resource(name = "dictUtils")
	private DictUtils dictUtils;
	@Test
	public void testDictUtil() throws Exception{
		dictUtils.getDictByTable("sys_user");
	}
}
