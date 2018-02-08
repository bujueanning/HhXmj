package com.adminlte.base.test;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:tapplicationContext-ehcache.xml")
public class EhCacheTestServiceTest {
	@Resource(name="ehCacheTestService")
    private EhCacheTestService ehCacheTestService;
 
    @Test   //标明是测试方法  
    //@Transactional   标明此方法需使用事务  
    //@Rollback(true)  //标明使用完此方法后事务不回滚,true时为回滚  
    public void getTimestampTest() throws InterruptedException{  
        System.out.println("1调用+++++++++" + ehCacheTestService.getTimestamp1("param1"));
        System.out.println("1调用+++++++++" + ehCacheTestService.getTimestamp1("param1"));
        System.out.println("1调用+++++++++" + ehCacheTestService.getTimestamp1("param1"));
        System.out.println("1调用+++++++++" + ehCacheTestService.getTimestamp1("param1"));
        System.out.println("1调用+++++++++" + ehCacheTestService.getTimestamp1("param1"));
        System.out.println("1调用+++++++++" + ehCacheTestService.getTimestamp1("param1"));
//        System.out.println("2调用+++++++++" + ehCacheTestService.getTimestamp2("param2"));
//        System.out.println("3调用+++++++++" + ehCacheTestService.getTimestamp3("param"));
//        System.out.println("4调用+++++++++" + ehCacheTestService.getTimestamp4("param1"));
//        System.out.println("5调用+++++++++" + ehCacheTestService.getTimestamp5("param2"));
    } 
}
