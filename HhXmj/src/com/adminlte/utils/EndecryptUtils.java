package com.adminlte.utils;

import org.apache.shiro.crypto.hash.Md5Hash;

public  class EndecryptUtils {
	public static String passwordMd5(String password,String useraccount){
//		SecureRandomNumberGenerator secureRandomNumberGenerator=new SecureRandomNumberGenerator(); 
//	    String salt= secureRandomNumberGenerator.nextBytes().toHex(); 
	    //组合username,两次迭代，对密码进行加密 
	    return new Md5Hash(password,useraccount,2).toHex();
	}
	 
}
