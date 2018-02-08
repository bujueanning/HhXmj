package com.adminlte.shiro;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;
import org.springframework.stereotype.Component;
@Component("shiroCacheManager")
public class ShiroCacheManager implements CacheManager{

	
	public <K, V> Cache<K, V> getCache(String paramString) throws CacheException {
		return null;
	}

}
