package com.adminlte.shiro;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.stereotype.Component;

import com.adminlte.cache.SysCacheService;
import com.adminlte.sys.perm.service.SysPermService;
import com.adminlte.sys.role.perm.service.SysRolePermService;
import com.adminlte.sys.role.service.SysRoleService;
import com.adminlte.sys.user.role.service.SysUserRoleService;
import com.adminlte.sys.user.service.SysUserService;
import com.adminlte.utils.ShiroUtils;

/**
 */
@Component("myShiroRealm")
public class MyShiroRealm extends AuthorizingRealm {
	@Resource(name = "sysUserService")
	private SysUserService sysUserService;
	@Resource(name = "sysUserRoleService")
	private SysUserRoleService sysUserRoleService;
	@Resource(name = "sysRoleService")
	private SysRoleService sysRoleService;
	@Resource(name = "sysRolePermService")
	private SysRolePermService sysRolePermService;
	@Resource(name = "sysPermService")
	private SysPermService sysPermService;
	@Resource(name = "sysCacheService")
	private SysCacheService sysCacheService;
	/**
	 * 权限验证 为当前登录的Subject授予角色和权限
	 * 
	 * @see 经测试:本例中该方法的调用时机为需授权资源被访问时
	 * @see 经测试:并且每次访问需授权资源时都会执行该方法中的逻辑,这表明本例中默认并未启用AuthorizationCache
	 * @see 个人感觉若使用了Spring3.1开始提供的ConcurrentMapCache支持,
	 *      则可灵活决定是否启用AuthorizationCache
	 * @see 比如说这里从数据库获取权限信息时,先去访问Spring3.1提供的缓存,而不使用Shior提供的AuthorizationCache
	 * @see cache实现参数父类getAuthorizationInfo方法,因为使用springCacheManager,
	 *      所以shiroCacheManager为null,
	 * @see 所以将cache部分的实现过程写到doGetAuthorizationInfo中
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		if (principals == null) {
			return null;
		}
		String sys_user_account = (String) super.getAvailablePrincipal(principals);
		SimpleAuthorizationInfo simpleAuthorInfo = null;
		Object simpleAuthorInfoValueWrapper = null;
		try {
			simpleAuthorInfoValueWrapper = sysCacheService.getCache("shiroRealmAuthorizationCache",sys_user_account);
			if (simpleAuthorInfoValueWrapper == null) {
				List<String> permissionList = new ArrayList<String>();
				if (StringUtils.equals(sys_user_account, "admin")) {
					List<Object> sysPermList = sysPermService.findAll();
					for (int i = 0; i < sysPermList.size(); i++) {
						permissionList.add(StringUtils.substringBetween(((Map<String,Object>)sysPermList.get(i)).get("sys_perm_flag").toString(), "[", "]"));
					}
				} else {
					Map<String,Object> sysUser = new HashMap<String,Object>();
					sysUser.put("sys_user_account", sys_user_account);
					sysUser = sysUserService.find(sysUser);
					sysUser.put("sys_role_perm_type", "selected");
					List<Object> sysPermList = sysUserRoleService.listPermByUserId(sysUser);
					if (sysPermList != null && sysPermList.size() > 0) {
						for (int i = 0; i < sysPermList.size(); i++) {
								permissionList.add(StringUtils.substringBetween(((Map<String,Object>)sysPermList.get(i)).get("sys_perm_flag").toString(), "[", "]"));
							}
						} else {
							throw new AuthorizationException();
						}
					}
					if (permissionList.size() > 0) {
						simpleAuthorInfo = new SimpleAuthorizationInfo();
						simpleAuthorInfo.addStringPermissions(permissionList);
						sysCacheService.putCache("shiroRealmAuthorizationCache",sys_user_account, simpleAuthorInfo);
					}
					// //为当前用户设置角色和权限
					// SimpleAuthorizationInfo simpleAuthorInfo = new
					// SimpleAuthorizationInfo();
					// //实际中可能会像上面注释的那样从数据库取得
					// if(null!=sysUserAccount && "jadyer".equals(sysUserAccount)){
					// //添加一个角色,不是配置意义上的添加,而是证明该用户拥有admin角色
					// simpleAuthorInfo.addRole("admin");
					// //添加权限
					// simpleAuthorInfo.addStringPermission("admin:manage");
					// System.out.println("已为用户[jadyer]赋予了[admin]角色和[admin:manage]权限");
					// return simpleAuthorInfo;
					// }else if(null!=sysUserAccount &&
					// "玄玉".equals(sysUserAccount)){
					// System.out.println("当前用户[玄玉]无授权");
					// return simpleAuthorInfo;
					// }
			}else{
				simpleAuthorInfo = (SimpleAuthorizationInfo)simpleAuthorInfoValueWrapper;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 若该方法什么都不做直接返回null的话,就会导致任何用户访问/admin/listUser.jsp时都会自动跳转到unauthorizedUrl指定的地址
		// 详见applicationContext.xml中的<bean id="shiroFilter">的配置
		return simpleAuthorInfo;
	}

	/**
	 * 登陆验证 验证当前登录的Subject
	 * 
	 * @see 经测试:本例中该方法的调用时机为LoginController.login()方法中执行Subject.login()时
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken)
			throws AuthenticationException {
		// 获取基于用户名和密码的令牌
		// 实际上这个authcToken是从LoginController里面currentUser.login(token)传过来的
		// 两个token的引用都是一样的,本例中是org.apache.shiro.authc.UsernamePasswordToken@33799a1e
		// 此处无需比对,比对的逻辑Shiro会做,我们只需返回一个和令牌相关的正确的验证信息
		// 说白了就是第一个参数填登录用户名,第二个参数填合法的登录密码(可以是从数据库中取到的,本例中为了演示就硬编码了)
		// 这样一来,在随后的登录页面上就只有这里指定的用户和密码才能通过验证
		// 没有返回登录用户名对应的SimpleAuthenticationInfo对象时,就会在LoginController中抛出UnknownAccountException异常
		SimpleAuthenticationInfo authcInfo = null;
		Map<String,Object> sysUser = new HashMap<String,Object>();
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		System.out.println(
				"验证当前Subject时获取到token为" + ReflectionToStringBuilder.toString(token, ToStringStyle.MULTI_LINE_STYLE));
		try {
			sysUser.put("sys_user_account", token.getUsername());
			sysUser = sysUserService.find(sysUser);
			if (sysUser != null) {
				//清除权限和当前session的用户
				sysCacheService.evictCache("shiroRealmAuthorizationCache", sysUser.get("sys_user_account").toString());
				sysCacheService.evictCache("shiroSessionCache", sysUser.get("sys_user_account").toString());
				//登陆不能缓存,必须new,才能生成session
				authcInfo = new SimpleAuthenticationInfo(sysUser.get("sys_user_account").toString(),sysUser.get("sys_user_password").toString(), this.getName());
				ShiroUtils.setAttr("currentUser", sysUser);//用户信息存入session
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return authcInfo;
	}
	
	
}
