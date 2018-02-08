package com.adminlte.cache;

import javax.annotation.Resource;

import org.springframework.cache.Cache.ValueWrapper;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.stereotype.Service;


@Service("sysCacheService")
public class SysCacheService{

	@Resource(name = "redisCacheManager")
	private RedisCacheManager redisCacheManager;
	
	@Resource(name = "ehCacheManager")
	private EhCacheCacheManager ehCacheCacheManager;
	
	public Object getCache(String cacheName,String cacheKey)throws Exception{
		ValueWrapper valueWrapper = ehCacheCacheManager.getCache(cacheName).get(cacheKey);
		if(valueWrapper==null){
			valueWrapper = redisCacheManager.getCache(cacheName).get(cacheKey);
			if(valueWrapper!=null){
				ehCacheCacheManager.getCache(cacheName).put(cacheKey, valueWrapper.get());
				return valueWrapper.get();
			}else{
				return null;
			}
		}
		return valueWrapper.get();
	}
	
	public void putCache(String cacheName,String cacheKey,Object cacheValue)throws Exception{
		ehCacheCacheManager.getCache(cacheName).put(cacheKey, cacheValue);
		redisCacheManager.getCache(cacheName).put(cacheKey, cacheValue);
	}
	public void evictCache(String cacheName,String cacheKey)throws Exception{
		ehCacheCacheManager.getCache(cacheName).evict(cacheKey);
		redisCacheManager.getCache(cacheName).evict(cacheKey);
	}
}