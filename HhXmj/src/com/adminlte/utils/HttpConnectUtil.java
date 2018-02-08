package com.adminlte.utils;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.multipart.FilePart;
import org.apache.commons.httpclient.methods.multipart.MultipartRequestEntity;
import org.apache.commons.httpclient.methods.multipart.Part;
import org.apache.commons.httpclient.methods.multipart.StringPart;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.commons.io.IOUtils;

import com.alibaba.fastjson.JSONObject;
public class HttpConnectUtil {
	
	/**
	 * get方式
	 * @param url
	 * @return
	 */
	public static String getHttp(String url) {
		String responseMsg = "";
		HttpClient httpClient = new HttpClient();
		GetMethod getMethod = new GetMethod(url);
		getMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,new DefaultHttpMethodRetryHandler());
		try {
			httpClient.executeMethod(getMethod);
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			InputStream in = getMethod.getResponseBodyAsStream();
			int len = 0;
			byte[] buf = new byte[1024];
			while((len=in.read(buf))!=-1){
				out.write(buf, 0, len);
			}
			responseMsg = out.toString("UTF-8");
		} catch (HttpException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			//释放连接
			getMethod.releaseConnection();
		}
		return responseMsg;
	}

	/**
	 * postFile方式
	 * @param url
	 * @param code
	 * @param type
	 * @return
	 */
	public static String postFileHttp(String url) {
		String responseMsg = "";
		HttpClient httpClient = new HttpClient();
		httpClient.getParams().setContentCharset("GBK");
		httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(50000);// 设置连接时间
		PostMethod postMethod = new PostMethod(url);
		try {
			postMethod.setParameter("user_id", "eee");
			File targetFile = new File("D:\\14b4a475d091ff4ea56dcfee2434812f.jpg");// TODO 指定上传文件
			Part[] parts = { new FilePart("file", targetFile) ,new StringPart("user_id", "xx") };
			postMethod.setRequestEntity(new MultipartRequestEntity(parts,postMethod.getParams()));
			httpClient.executeMethod(postMethod);
			responseMsg = IOUtils.toString(postMethod.getResponseBodyAsStream());
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			postMethod.releaseConnection();
		}
		return responseMsg;
	}
	/**
	 * post方式
	 * @param url
	 * @param code
	 * @param type
	 * @return
	 */
	public static String postHttp(String url) {
		String responseMsg = "";
		HttpClient httpClient = new HttpClient();
		httpClient.getParams().setContentCharset("GBK");
		httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(50000);// 设置连接时间
		PostMethod postMethod = new PostMethod(url);
		try {
			postMethod.addParameter("key", "6263382a1f410169e4a3c1fb757ac390");
			postMethod.addParameter("user_id", "6222081905000783304");
			httpClient.executeMethod(postMethod);
			responseMsg = IOUtils.toString(postMethod.getResponseBodyAsStream());
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			postMethod.releaseConnection();
		}
		return responseMsg;
	}
	public static String convertUnicode(String ori){
        char aChar;
        int len = ori.length();
        StringBuffer outBuffer = new StringBuffer(len);
        for (int x = 0; x < len;) {
            aChar = ori.charAt(x++);
            if (aChar == '\\') {
                aChar = ori.charAt(x++);
                if (aChar == 'u') {
                    // Read the xxxx
                    int value = 0;
                    for (int i = 0; i < 4; i++) {
                        aChar = ori.charAt(x++);
                        switch (aChar) {
                        case '0':
                        case '1':
                        case '2':
                        case '3':
                        case '4':
                        case '5':
                        case '6':
                        case '7':
                        case '8':
                        case '9':
                            value = (value << 4) + aChar - '0';
                            break;
                        case 'a':
                        case 'b':
                        case 'c':
                        case 'd':
                        case 'e':
                        case 'f':
                            value = (value << 4) + 10 + aChar - 'a';
                            break;
                        case 'A':
                        case 'B':
                        case 'C':
                        case 'D':
                        case 'E':
                        case 'F':
                            value = (value << 4) + 10 + aChar - 'A';
                            break;
                        default:
                            throw new IllegalArgumentException(
                                    "Malformed   \\uxxxx   encoding.");
                        }
                    }
                    outBuffer.append((char) value);
                } else {
                    if (aChar == 't')
                        aChar = '\t';
                    else if (aChar == 'r')
                        aChar = '\r';
                    else if (aChar == 'n')
                        aChar = '\n';
                    else if (aChar == 'f')
                        aChar = '\f';
                    outBuffer.append(aChar);
                }
            } else
                outBuffer.append(aChar);
 
        }
        return outBuffer.toString();
	}
	public static void main(String[] args) {
//		String returnStr = HttpConnectUtil.getHttp("http://detectionbankcard.api.juhe.cn/bankCard?key=6263382a1f410169e4a3c1fb757ac390&cardid=6226622801758828");
		String returnStr = HttpConnectUtil.postFileHttp("http://localhost:8080/test/appuser/uploadImage");
//		String returnStr = HttpConnectUtil.postHttp("http://localhost:8080/test/appuser//improveUserInfo");
		System.out.println(HttpConnectUtil.convertUnicode(returnStr));
		JSONObject json = JSONObject.parseObject(returnStr);
//		System.out.println(json.get("reason"));
//		System.out.println(JSONObject.fromObject(json.get("result")).get("bank"));
		
		
		
		
		
		
//		中国农业银行-->农业银行
//		{"reason":"查询成功","result":{"bank":"农业银行","type":"金穗通宝卡（个人普卡）","nature":"借记卡","kefu":"95599","logo":"http://7rylcd.com2.z0.glb.qiniucdn.com/nongye.png","info":"天津"},"error_code":0}		
//		{"reason":"查询失败,请检测卡号是否正确","result":"[]","error_code":305402}
//		{"reason":"查询成功","result":{"bank":"中国工商银行","type":"理财金卡","nature":"借记卡","kefu":"95588","logo":"http://7rylcd.com2.z0.glb.qiniucdn.com/gongshang.png","info":""},"error_code":0}
//		{"reason":"查询成功","result":{"bank":"中国银行","type":"长城电子借记卡","nature":"借记卡","kefu":"95566","logo":"http://7rylcd.com2.z0.glb.qiniucdn.com/zhongguo.png","info":""},"error_code":0}
//		{"reason":"查询成功","result":{"bank":"中信银行","type":"理财宝IC卡","nature":"借记卡","kefu":"95558","logo":"http://7rylcd.com2.z0.glb.qiniucdn.com/zhongxin.png","info":""},"error_code":0}
//		{"reason":"查询成功","result":{"bank":"兴业银行","type":"兴业自然人生理财卡","nature":"借记卡","kefu":"95561","logo":"http://7rylcd.com2.z0.glb.qiniucdn.com/xingye.png","info":""},"error_code":0}
//		{"reason":"查询成功","result":{"bank":"光大银行","type":"阳光卡(银联卡)","nature":"借记卡","kefu":"95595","logo":"http://7rylcd.com2.z0.glb.qiniucdn.com/guangda.png","info":""},"error_code":0}
	}
}
