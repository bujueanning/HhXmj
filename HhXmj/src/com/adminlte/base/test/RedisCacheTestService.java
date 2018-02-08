package com.adminlte.base.test;

import org.apache.commons.lang3.RandomUtils;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service("redisCacheTestService")
public class RedisCacheTestService {
	
	@Cacheable(value="common1")
    public String getTimestamp1(String test) {
        return "ehcache1++++++"+RandomUtils.nextInt(0, 10000);
    }
	@Cacheable(value="common2",key="#test")
    public String getTimestamp2(String test) {
        return "ehcache2++++++"+RandomUtils.nextInt(0, 10000);
    }
	@CacheEvict(value="common1",allEntries=true)
    public String getTimestamp3(String test) {
        return "ehcache3++++++"+RandomUtils.nextInt(0, 10000);
    }
	@CacheEvict(value="common2",allEntries=true)
    public String getTimestamp4(String test) {
        return "ehcache4++++++"+RandomUtils.nextInt(0, 10000);
    }
}
