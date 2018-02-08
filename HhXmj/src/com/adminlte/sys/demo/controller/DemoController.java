package com.adminlte.sys.demo.controller;

import java.io.File;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.adminlte.sys.demo.service.DemoService;
import com.adminlte.utils.PathUtil;

@RestController
@RequestMapping(value="/demo")
public class DemoController {
	private Log logger = LogFactory.getLog(DemoController.class);
	@Resource(name="demoService")
	private DemoService demoService;
	
	@RequestMapping("/saveTransactional")
	public String saveTransactional(){
		try {
			demoService.save();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "成功";
	}
	@RequestMapping("/testAsync") 
	public String testAsync(){
		demoService.testAsync();
		System.out.println("afterAsync");
		return "";
	}
	@RequestMapping("/upload") 
	@ResponseBody
	public String upload(@RequestParam(value="files[]", required=false) MultipartFile[] files,String sysUserId){
		String path = PathUtil.getWebPath()+"upload/";
        for(MultipartFile mfile : files){
            if (!mfile.isEmpty()) {
                File file = new File(path + mfile.getOriginalFilename()); //服务器上新建文件
                logger.debug(file.getAbsolutePath());
                try {
                    FileUtils.copyInputStreamToFile(mfile.getInputStream(), file);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return "成功";
	}
	@RequestMapping("/testUpload") 
	public String testUpload(@RequestParam(value="file", required=false)MultipartFile mfile,String user_id){
		String path = PathUtil.getWebPath()+"upload/";
        if (!mfile.isEmpty()) {
            File file = new File(path + mfile.getOriginalFilename()); //服务器上新建文件
            try {
                FileUtils.copyInputStreamToFile(mfile.getInputStream(), file);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "成功";
	}
}
