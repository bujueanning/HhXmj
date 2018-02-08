package com.adminlte.base.test;

import org.apache.commons.lang3.RandomUtils;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service("ehCacheTestService")
public class EhCacheTestService {
	
	@Cacheable(value="common1",key="#test1")
    public String getTimestamp1(String test1) {
        return "common1++++++"+RandomUtils.nextInt(0, 10000);
    }
	@Cacheable(value="common2",key="#test2")
    public String getTimestamp2(String test2) {
        return "common2++++++"+RandomUtils.nextInt(0, 10000);
    }
	
	@CacheEvict(value ={"ehcache1","ehcache2"},allEntries = true,beforeInvocation=true)
    public String getTimestamp3(String test21) {
        return "ehcache3++++++"+RandomUtils.nextInt(0, 10000);
    }
	@Cacheable(value="ehcache1",key="#test1")
    public String getTimestamp4(String test1) {
        return "ehcache4++++++"+RandomUtils.nextInt(0, 10000);
    }
	@Cacheable(value="ehcache2",key="#test2")
    public String getTimestamp5(String test2) {
        return "ehcache5++++++"+RandomUtils.nextInt(0, 10000);
    }
}
