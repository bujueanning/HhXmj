package com.adminlte.cache;

import java.util.concurrent.Callable;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.cache.Cache;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.data.redis.cache.RedisCacheManager;

public class EhRedisCache implements Cache {
	private Log logger = LogFactory.getLog(EhRedisCache.class);
	private RedisCacheManager redisCacheManager;
	private EhCacheCacheManager ehCacheManager;
	private long liveTime = 24 * 60 * 60; // 默认1天=24*60*60
	private String name;

	

	public EhCacheCacheManager getEhCacheManager() {
		return ehCacheManager;
	}

	public void setEhCacheManager(EhCacheCacheManager ehCacheManager) {
		this.ehCacheManager = ehCacheManager;
	}

	public long getLiveTime() {
		return liveTime;
	}

	public void setLiveTime(long liveTime) {
		this.liveTime = liveTime;
	}

	
	public RedisCacheManager getRedisCacheManager() {
		return redisCacheManager;
	}

	public void setRedisCacheManager(RedisCacheManager redisCacheManager) {
		this.redisCacheManager = redisCacheManager;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	public String getName() {
		return this.name;
	}

	
	public Object getNativeCache() {
		return this;
	}

	
	public ValueWrapper get(Object key) {
		ValueWrapper value = ehCacheManager.getCache(name).get(key);
		if (value != null) {
			logger.info("Get Cache:"+name+" L1 (ehcache)"+key+"-------------->"+value.get());
			return value;
		} else {
			ValueWrapper valueWrapper = redisCacheManager.getCache(name).get(key);
			if(valueWrapper==null){
				logger.info("GetNULL Cache:"+name+" L1(ehcache) L2 (redis) --------------> null");
				return null;
			}else{
				ehCacheManager.getCache(name).put(key, valueWrapper.get());// 取出来之后缓存到本地
				logger.info("Get Cache:"+name+" L2 (redis)"+key+"-------------->"+valueWrapper.get());
				return valueWrapper;
			}
		}
	}

	
	public void put(Object key, Object value) {
		// TODO Auto-generated method stub
		logger.info("Put Cache:"+name+" L1(ehcache) L2 (redis)"+key+"-------------->"+value);
		ehCacheManager.getCache(name).put(key, value);
		redisCacheManager.getCache(name).put(key, value);
	}
	
	public void evict(Object key) {
		logger.info("Evict Cache:"+name+" L1(ehcache) L2 (redis)"+"-------------->"+key);
		ehCacheManager.getCache(name).evict(key);
		redisCacheManager.getCache(name).evict(key);
	}

	
	public void clear() {
		logger.info("Clear Cache:"+name+" L1(ehcache) L2 (redis)"+"-------------->clear");
		ehCacheManager.getCache(name).clear();
		redisCacheManager.getCache(name).clear();
	}

	
	public <T> T get(Object key, Class<T> type) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public ValueWrapper putIfAbsent(Object key, Object value) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public <T> T get(Object arg0, Callable<T> arg1) {
		// TODO Auto-generated method stub
		return null;
	}

}
