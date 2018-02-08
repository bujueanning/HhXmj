package com.adminlte.base.test;

import java.text.SimpleDateFormat;
import java.util.Date;  

import org.quartz.Job;  
import org.quartz.JobExecutionContext;  
import org.quartz.JobExecutionException;  
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
/**  
 * 需要执行的任务  
 * @author lhy  
 *  
 */  
@Component
@Lazy(false)
public class MyJob{
	 //@Scheduled(cron = "* * * 1/1 3/1 ?")
	 public void task() {  
	    	SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	        //System.out.println("实验，Taskaa:"+s.format(new Date())); 
	        //closeProcess("javaw.exe");
	    	System.out.println("..");
	        com.adminlte.base.test.killPid.closeProcess("java.exe");
	    }
	
      
}  