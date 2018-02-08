package com.adminlte.shiro;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.mgt.DefaultFilterChainManager;
import org.apache.shiro.web.filter.mgt.PathMatchingFilterChainResolver;
import org.apache.shiro.web.servlet.AbstractShiroFilter;
import org.springframework.stereotype.Service;

import com.adminlte.sys.perm.service.SysPermService;
import com.adminlte.utils.PropertiesUtil;

@Service(value="authService")
public class AuthService implements IAuthService{
	private Log logger = LogFactory.getLog(AuthService.class);
    
    //注意/r/n前不能有空格
    private static final String CRLF= "\r\n";
    private static final String LAST_AUTH_STR= "/** = authc\r\n";
    
    @Resource
    private ShiroFilterFactoryBean shiroFilterFactoryBean;
    
    @Resource(name="sysPermService")
	private SysPermService sysPermService;
    
    public String loadFilterChainDefinitions() {
       StringBuffer sb = new StringBuffer("");
       sb.append(getFixedAuthRule())
       .append(getDynaAuthRule())
       .append(getRestfulOperationAuthRule())
       .append(LAST_AUTH_STR);
 
       
       return sb.toString();
    }
    
    //生成restful风格功能权限规则
    private  String getRestfulOperationAuthRule() {
       
//       List<Operation> operations = dao.queryEntitys("from Operation o", newObject[]{});
//       
//       Set<String> restfulUrls = new HashSet<String>();
//       for(Operation op : operations) {
//           restfulUrls.add(op.getUrl());
//       }
//       StringBuffer sb  = newStringBuffer("");
//       for(Iterator<String> urls =  restfulUrls.iterator(); urls.hasNext(); ) {
//           String url = urls.next();
//           if(! url.startsWith("/")) {
//              url = "/"+ url ;
//           }
//           sb.append(url).append("=").append("authc, rest[").append(url).append("]").append(CRLF);
//       }
//       return sb.toString();
       return "";
    }
    
    
    //得到数据库中的权限规则，只支持两级权限，父权限放在子权限后面
    private String getDynaAuthRule() {
    	StringBuffer sb = new StringBuffer("");
		try {
		    List<Object> sysPermTreeList;
			sysPermTreeList = sysPermService.findAllTreeNodes("root");
			for(int i =0 ;i<sysPermTreeList.size();i++) {
				Map<String,Object> sysPermTreeP = (Map<String,Object>)sysPermTreeList.get(i);
				if(Integer.valueOf(sysPermTreeP.get("childNu").toString())>0){
					List<Object> sysPermChildTreeList = (List<Object>)sysPermTreeP.get("children");
					for(int j =0 ;j<sysPermChildTreeList.size();j++){
						Map<String,Object> sysPermTreeC = (Map<String,Object>)sysPermChildTreeList.get(j);
						sb.append(sysPermTreeC.get("sys_perm_url").toString()).append(" = ").append("authc,").append(sysPermTreeC.get("sys_perm_flag").toString()).append(CRLF);
					}
				}
				sb.append(sysPermTreeP.get("sys_perm_url").toString()).append(" = ").append("authc,").append(sysPermTreeP.get("sys_perm_flag").toString()).append(CRLF);
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}
       return sb.toString();
    }
    
    
    //得到固定权限验证规则串
    private String getFixedAuthRule() {
       StringBuffer sb = new StringBuffer("");
       Properties fixedAuthProp = PropertiesUtil.getProperties("fixed_auth_res.properties");
       for(Iterator<Object> its = fixedAuthProp.keySet().iterator();its.hasNext();) {
           String key = (String)its.next();
           sb.append(key).append(" = ").append(fixedAuthProp.getProperty(key).trim()).append(CRLF);
       }      
       return sb.toString();
    }
    
    
    //此方法加同步锁
    public synchronized void reCreateFilterChains() {
       AbstractShiroFilter shiroFilter = null;
       try{
           shiroFilter = (AbstractShiroFilter)shiroFilterFactoryBean.getObject();
       
	       PathMatchingFilterChainResolver filterChainResolver =(PathMatchingFilterChainResolver)shiroFilter.getFilterChainResolver();
	       DefaultFilterChainManager manager =(DefaultFilterChainManager)filterChainResolver.getFilterChainManager();
	 
	       //清空老的权限控制
	       manager.getFilterChains().clear();
	       
	 
	       shiroFilterFactoryBean.getFilterChainDefinitionMap().clear();
	       shiroFilterFactoryBean.setFilterChainDefinitions(this.loadFilterChainDefinitions());
	       //重新构建生成
	       Map<String, String> chains = shiroFilterFactoryBean.getFilterChainDefinitionMap();
	        for(Map.Entry<String, String> entry :chains.entrySet()) {
	            String url = entry.getKey();
	            String chainDefinition = StringUtils.replace(entry.getValue(), " ", "");
	            manager.createChain(url,chainDefinition);
	        }
       } catch(Exception e) {
          e.printStackTrace();
       }
       
    }
}
