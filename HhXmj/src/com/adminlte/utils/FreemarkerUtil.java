package com.adminlte.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.Locale;
import java.util.Map;

import org.apache.commons.io.FileUtils;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * 
 * 创建人：FH 创建时间：2015年2月8日
 * @version
 */
public class FreemarkerUtil {

	/**
	 * 打印到控制台(测试用)
	 *  @param ftlName
	 */
	public static void print(String ftlName, Map<String,Object> paramMap, String ftlPath) throws Exception{
		try {
			Template temp = getTemplate(ftlName);		//通过Template可以将模板文件输出到相应的流
			temp.process(paramMap, new PrintWriter(System.out));
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 输出到输出到文件
	 * @param ftlName   ftl文件名
	 * @param paramMap		传入的map
	 * @param outFile	输出后的文件全部路径
	 * @param filePath	输出前的文件上部路径
	 */
	public static void printFile(String ftlName, Map<String,Object> paramMap, String outFile, String outPath) throws Exception{
		try {
			File file = new File(System.getProperty("user.dir") + "\\src\\" + outPath + "\\" + outFile);
			System.out.println(file.getAbsolutePath());
			Writer out = new BufferedWriter(new OutputStreamWriter(FileUtils.openOutputStream(file), "utf-8"));
			Template template = getTemplate(ftlName);
			template.process(paramMap, out);					//模版输出
			out.flush();
			out.close();
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 通过文件名加载模版
	 * @param ftlName
	 */
	public static Template getTemplate(String ftlName) throws Exception{
		try {
			Configuration cfg = new Configuration(); 												//通过Freemaker的Configuration读取相应的ftl
			cfg.setEncoding(Locale.CHINA, "utf-8");
			cfg.setDirectoryForTemplateLoading(new File(System.getProperty("user.dir") + "\\codeftl\\"));		//设定去哪里读取相应的ftl模板文件
			Template temp = cfg.getTemplate(ftlName);												//在模板文件目录中找到名称为name的文件
			return temp;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
