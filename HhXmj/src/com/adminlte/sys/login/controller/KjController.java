package com.adminlte.sys.login.controller;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adminlte.auction.assets.service.AuctionAssetsService;
import com.adminlte.auction.site.service.BondSiteService;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.adminlte.sys.file.service.SysFileService;
import com.adminlte.sys.menu.service.SysMenuService;
import com.adminlte.sys.role.menu.service.SysRoleMenuService;
import com.adminlte.sys.role.service.SysRoleService;
import com.adminlte.sys.user.role.service.SysUserRoleService;
import com.adminlte.sys.user.service.SysUserService;
import com.adminlte.utils.EndecryptUtils;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.RequestUtil;
import com.adminlte.utils.ResponseUtil;
import com.adminlte.utils.ShiroUtils;
import com.adminlte.utils.VerifyCodeUtil;


@Controller
@RequestMapping(value="/sys/kj")
public class KjController{
	private Log logger = LogFactory.getLog(KjController.class);
	@Resource(name="sysUserService")
	private SysUserService sysUserService;
	@Resource(name="sysRoleService")
	private SysRoleService sysRoleService;
	@Resource(name="sysMenuService")
	private SysMenuService sysMenuService;
	@Resource(name="sysUserRoleService")
	private SysUserRoleService sysUserRoleService;
	@Resource(name="sysRoleMenuService")
	private SysRoleMenuService sysRoleMenuService;
	@Resource(name="auctionAssetsService")
	private AuctionAssetsService auctionAssetsService;
	@Resource(name="bondSiteService")
	private BondSiteService bondSiteService;
	@Resource(name="sysFileService")
	private SysFileService sysFileService;
    /**
	 * 访问登录页
	 * @return
	 */
	@RequestMapping(value="/index")
	public ModelAndView toindex()throws Exception{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sys/kj/index");
		if (ShiroUtils.getCurrentUser() != null) {
			mv.addObject("loginstatus", "true");
		}else {
			mv.addObject("loginstatus", "false");
		}
		return mv;
	}
	/**
	 * 访问登录页
	 * @return
	 */
	@RequestMapping(value="/login")
	public ModelAndView toLogin()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sys/kj/login/login");
		return mv;
	}
	/**
	 * 访问注册页
	 * @return
	 */
	@RequestMapping(value="/goinfo")
	public ModelAndView goinfo()throws Exception{
		Map<String,Object> file = null;
		List<Object> varList = null;
		List<Object> city=null;
		List<Object> companyCity = null;
		Map<String,Object> siteOne = null;
		Map<String,Object> siteCompany = null;
		Map<String,Object> bondSite = RequestUtil.getParameterMap(logger);
		Map<String,Object> sysFile = RequestUtil.getParameterMap(logger);
		
		System.out.println("用户的数据："+ ShiroUtils.getCurrentUser());
		if (ShiroUtils.getCurrentUser() != null) {
			Map<String,Object> auctionAssets = RequestUtil.getParameterMap(logger);
			auctionAssets.put("auction_assets_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			varList = auctionAssetsService.pageList(auctionAssets);
		}
		if(ShiroUtils.getCurrentUser() != null){
			//个人地址的信息
			if(!"-1".equals(ShiroUtils.getCurrentUser().get("sys_area_id"))){
				bondSite.put("bond_site_id", ShiroUtils.getCurrentUser().get("sys_area_id"));
				siteOne = bondSiteService.find(bondSite);
				//得到市
				bondSite.clear();
				bondSite.put("bond_site_pid", siteOne.get("bond_site_pid"));
				city = bondSiteService.list(bondSite);
			}
		}
		if(ShiroUtils.getCurrentUser() != null){
			sysFile.put("sys_user_id", ShiroUtils.getCurrentUser().get("sys_user_id"));
			file = sysFileService.find(sysFile);
		}
		
		//得到省
		bondSite.clear();
		bondSite.put("bond_site_pid", "0");
		List<Object> province = bondSiteService.list(bondSite);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("sysUser", ShiroUtils.getCurrentUser());
		mv.addObject("varList", varList);
		mv.addObject("siteOne",siteOne);
		mv.addObject("province",province);
		mv.addObject("city",city);
		mv.addObject("file",file);
		mv.setViewName("sys/kj/user/user_info");
		return mv;
	}
	/**
	 * 访问注册页
	 * @return
	 */
	@RequestMapping(value="/goreg")
	public ModelAndView goreg()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sys/kj/login/reg_index");
		return mv;
	}
	/**
	 * 访问注册页
	 * @return
	 */
	@RequestMapping(value="/goreguser")
	public ModelAndView goreguser()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sys/kj/login/user_reg_add");
		return mv;
	}/**
	 * 访问注册页
	 * @return
	 */
	@RequestMapping(value="/goregcompany")
	public ModelAndView goregcompany()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sys/kj/login/company_reg_add");
		return mv;
	}
	/**
	 * 访问登录页
	 * @return
	 */
	@RequestMapping(value="/auction")
	public ModelAndView toauction()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sys/kj/Asset_auction");
		return mv;
	}
}
