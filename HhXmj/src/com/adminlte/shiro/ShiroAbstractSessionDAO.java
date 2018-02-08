package com.adminlte.shiro;

import java.io.Serializable;
import java.util.Collection;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.ValidatingSession;
import org.apache.shiro.session.mgt.eis.AbstractSessionDAO;
import org.springframework.stereotype.Component;

import com.adminlte.cache.SysCacheService;

//参考CachingSessionDAO实现
@Component("shiroAbstractSessionDAO")
public class ShiroAbstractSessionDAO extends AbstractSessionDAO {
	@Resource(name = "sysCacheService")
	private SysCacheService sysCacheService;
	
	public void update(Session paramSession) throws UnknownSessionException {
		try {
			if ((paramSession instanceof ValidatingSession)) {
				if (((ValidatingSession) paramSession).isValid()) {
					sysCacheService.putCache("shiroSessionCache", paramSession.getId().toString(), paramSession);
				} else {
					sysCacheService.evictCache("shiroSessionCache", paramSession.getId().toString());
				}
			} else {
				sysCacheService.putCache("shiroSessionCache", paramSession.getId().toString(), paramSession);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void delete(Session paramSession) {
		try {
			sysCacheService.evictCache("shiroSessionCache",paramSession.getId().toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Collection<Session> getActiveSessions() {
		return null;
	}
	
	protected Serializable doCreate(Session paramSession) {
		try {
			Serializable sessionId = generateSessionId(paramSession);
			assignSessionId(paramSession, sessionId);
 			sysCacheService.putCache("shiroSessionCache",paramSession.getId().toString(), paramSession);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return paramSession.getId();
	}
	
	protected Session doReadSession(Serializable paramSerializable) {
		Session shiroSession = null;
		try {
			Object ehShiroSessionwrapper = sysCacheService.getCache("shiroSessionCache",paramSerializable.toString());
			if (ehShiroSessionwrapper != null) {
				shiroSession = (Session) ehShiroSessionwrapper;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return shiroSession;
	}
}
