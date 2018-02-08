package com.adminlte.shiro;

public interface IAuthService {
	/**
     * 加载过滤配置信息
     * @return
     */
    public String loadFilterChainDefinitions();
    
    /**
     * 不重启服备重新构建权限过滤器
     */
    public void reCreateFilterChains();
}
