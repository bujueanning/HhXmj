package com.adminlte.base.test;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:tapplicationContext-redis.xml")
public class RedisCacheTestServiceTest {
	@Resource(name="redisCacheTestService")
    private RedisCacheTestService redisCacheTestService;
 
    @Test   //标明是测试方法  
    //@Transactional   标明此方法需使用事务  
    //@Rollback(true)  //标明使用完此方法后事务不回滚,true时为回滚  
    public void getTimestampTest() throws InterruptedException{  
//    	System.out.println("3调用+++++++++" + redisCacheTestService.getTimestamp3("param"));
//    	System.out.println("4调用+++++++++" + redisCacheTestService.getTimestamp4("param"));
        System.out.println("1调用+++++++++" + redisCacheTestService.getTimestamp1("param"));
//        System.out.println("2调用+++++++++" + redisCacheTestService.getTimestamp2("param"));
//        System.out.println("4调用+++++++++" + redisCacheTestService.getTimestamp4("param"));
//        System.out.println("1调用+++++++++" + redisCacheTestService.getTimestamp1("param"));
//        System.out.println("2调用+++++++++" + redisCacheTestService.getTimestamp2("param"));
    } 
}
