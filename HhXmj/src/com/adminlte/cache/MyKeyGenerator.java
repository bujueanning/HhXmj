package com.adminlte.cache;

import java.lang.reflect.Method;

import org.springframework.cache.interceptor.KeyGenerator;

public class MyKeyGenerator implements KeyGenerator{
	//返回类名+方法名+参数=生成的key
	
	public Object generate(Object paramObject, Method paramMethod, Object... paramVarArgs) {
					StringBuilder sb = new StringBuilder();
					sb.append(paramObject.getClass().getName());
					sb.append(paramMethod.getName());
					for (Object obj : paramVarArgs) {
						sb.append(obj.toString());
					}
					return sb.toString();
	}
	
}
