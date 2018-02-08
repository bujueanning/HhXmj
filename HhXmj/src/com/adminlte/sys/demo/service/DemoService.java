package com.adminlte.sys.demo.service;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.adminlte.base.dao.DaoSupport;


@Service("demoService")
public class DemoService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Transactional(rollbackFor=Exception.class)
	public void save() throws Exception{
//		SysUser sysUser1 = new SysUser();
//		sysUser1.setSysUserId("11demo");
//		dao.save("sysUserMapper.insertSelective", sysUser1);
//		SysUser sysUser2 = new SysUser();
//		sysUser2.setSysUserId("22demo");
//		dao.save("sysUserMapper.insertSelective", sysUser2);
		throw new Exception();
	}
	@Async
	public void testAsync(){
		try {
			System.out.println("async+begin");
			Thread.sleep(5000);
			System.out.println("async+end");
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}

