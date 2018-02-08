package com.adminlte.sys.login.controller;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.adminlte.sys.file.service.SysFileService;
import com.adminlte.sys.menu.service.SysMenuService;
import com.adminlte.sys.role.menu.service.SysRoleMenuService;
import com.adminlte.sys.role.service.SysRoleService;
import com.adminlte.sys.user.role.service.SysUserRoleService;
import com.adminlte.sys.user.service.SysUserService;
import com.adminlte.utils.EndecryptUtils;
import com.adminlte.utils.IDUtil;
import com.adminlte.utils.PathUtil;
import com.adminlte.utils.RequestUtil;
import com.adminlte.utils.ResponseUtil;
import com.adminlte.utils.ShiroUtils;
import com.adminlte.utils.VerifyCodeUtil;

@Controller
@RequestMapping(value = "/sys/login")
public class LoginController {
	private Log logger = LogFactory.getLog(LoginController.class);
	@Resource(name = "sysUserService")
	private SysUserService sysUserService;
	@Resource(name = "sysRoleService")
	private SysRoleService sysRoleService;
	@Resource(name = "sysMenuService")
	private SysMenuService sysMenuService;
	@Resource(name = "sysUserRoleService")
	private SysUserRoleService sysUserRoleService;
	@Resource(name = "sysRoleMenuService")
	private SysRoleMenuService sysRoleMenuService;
	@Resource(name="sysFileService")
	private SysFileService sysFileService;

	@RequestMapping(value = "/dologin")
	@ResponseBody
	public Object login(String verifyCode) throws Exception {
		Map<String, Object> sysUser = RequestUtil.getParameterMap(logger);
		String sysUserAccount = sysUser.get("sys_user_account").toString();
		String sysUserPassword = sysUser.get("sys_user_password").toString();
		// 获取HttpSession中的验证码
		String sessionVerifyCode = (String) ShiroUtils.getAttr("verifyCode");
		// 获取用户请求表单中输入的验证码
		System.out.println("用户[" + sysUserAccount + "]登录时输入的验证码为[" + verifyCode + "],HttpSession中的验证码为["
				+ sessionVerifyCode + "]");
		if (!StringUtils.equalsIgnoreCase(verifyCode, sessionVerifyCode)) {
			return ResponseUtil.resultMap(2, "验证码不正确");
		}
		UsernamePasswordToken token = new UsernamePasswordToken(sysUserAccount,
				EndecryptUtils.passwordMd5(sysUserPassword, sysUserAccount));
		// token.setRememberMe(true);
		System.out.println(
				"为了验证登录用户而封装的token为" + ReflectionToStringBuilder.toString(token, ToStringStyle.MULTI_LINE_STYLE));
		// 获取当前的Subject
		try {
			// 在调用了login方法后,SecurityManager会收到AuthenticationToken,并将其发送给已配置的Realm执行必须的认证检查
			// 每个Realm都能在必要时对提交的AuthenticationTokens作出反应
			// 所以这一步在调用login(token)方法时,它会走到MyRealm.doGetAuthenticationInfo()方法中,具体验证方式详见此方法
			System.out.println("对用户[" + sysUserAccount + "]进行登录验证..验证开始");
			SecurityUtils.getSubject().login(token);
			System.out.println("对用户[" + sysUserAccount + "]进行登录验证..验证通过");
		} catch (UnknownAccountException uae) {
			System.out.println("对用户[" + sysUserAccount + "]进行登录验证..验证未通过,未知账户");
			return ResponseUtil.resultMap(2, "未知账户");
		} catch (IncorrectCredentialsException ice) {
			System.out.println("对用户[" + sysUserAccount + "]进行登录验证..验证未通过,错误的凭证");
			return ResponseUtil.resultMap(2, "密码不正确");
		} catch (LockedAccountException lae) {
			System.out.println("对用户[" + sysUserAccount + "]进行登录验证..验证未通过,账户已锁定");
			return ResponseUtil.resultMap(2, "账户已锁定");
		} catch (ExcessiveAttemptsException eae) {
			System.out.println("对用户[" + sysUserAccount + "]进行登录验证..验证未通过,错误次数过多");
			return ResponseUtil.resultMap(2, "用户名或密码错误次数过多");
		} catch (AuthenticationException ae) {
			// 通过处理Shiro的运行时AuthenticationException就可以控制用户登录失败或密码错误时的情景
			System.out.println("对用户[" + sysUserAccount + "]进行登录验证..验证未通过,堆栈轨迹如下");
			ae.printStackTrace();
			return ResponseUtil.resultMap(2, "用户名或密码不正确");
		}
		// 验证是否登录成功
		if (SecurityUtils.getSubject().isAuthenticated()) {
			System.out.println("用户[" + sysUserAccount + "]登录认证通过(这里可以进行一些认证通过后的一些系统参数初始化操作)");
		} else {
			token.clear();
		}
		return ResponseUtil.resultMap(1, "成功");
	}

	/**
	 * 获取验证码图片和文本(验证码文本会保存在HttpSession中)
	 */
	@RequestMapping("/getVerifyCodeImage")
	public void getVerifyCodeImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 设置页面不缓存
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		String verifyCode = VerifyCodeUtil.generateTextCode(VerifyCodeUtil.TYPE_NUM_ONLY, 4, null);
		// 将验证码放到HttpSession里面
		ShiroUtils.setAttr("verifyCode", verifyCode);
		System.out.println("本次生成的验证码为[" + verifyCode + "],已存放到HttpSession中");
		// 设置输出的内容的类型为JPEG图像
		response.setContentType("image/jpeg");
		BufferedImage bufferedImage = VerifyCodeUtil.generateImageCode(verifyCode, 90, 30, 3, true, Color.WHITE,
				Color.BLACK, null);
		// 写给浏览器
		ImageIO.write(bufferedImage, "JPEG", response.getOutputStream());
	}

	/**
	 * 访问登录页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login")
	public ModelAndView toLogin() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sys/login/login");
		return mv;
	}

	/**
	 * 用户登出
	 */
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request) {
		SecurityUtils.getSubject().logout();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sys/login/login");
		return mv;
	}

	/**
	 * 用户登出
	 */
	@RequestMapping("/logoutjs")
	public ModelAndView logoutjs(HttpServletRequest request) {
		SecurityUtils.getSubject().logout();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sys/kj/login/login");
		return mv;
	}

	/**
	 * 访问首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/index")
	public ModelAndView toIndex() throws Exception {
		// 查找用户菜单
		List<String> menuIds = new ArrayList<String>();
		ModelAndView mv = new ModelAndView();
		if (ShiroUtils.getCurrentUser() != null) {
			List<Object> sysMenuList = new ArrayList<Object>();
			if (StringUtils.equals(ShiroUtils.getCurrentUser().get("sys_user_account").toString(), "admin")) {
				sysMenuList = sysMenuService.findAll();
			} else {
				Map<String, Object> paramMap = new HashMap<String, Object>();
				paramMap.put("sys_user_id", ShiroUtils.getCurrentUser().get("sys_user_id"));
				sysMenuList = sysUserRoleService.listMenuIdByUserId(paramMap);
			}
			for (int i = 0; i < sysMenuList.size(); i++) {
				menuIds.add(((Map<String, Object>) sysMenuList.get(i)).get("sys_menu_id").toString());
			}
			List<Object> sysMenuTrees = new ArrayList<Object>();
			if (menuIds.size() > 0) {
				sysMenuTrees = sysMenuService.findAllTreeNodesByIds("root", menuIds);
			}
			mv.setViewName("sys/index/index");
			mv.addObject("sysMenuTrees", sysMenuTrees);
		} else {
			mv.setViewName("sys/login/login");
		}

		return mv;
	}

	/**
	 * 访问首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/topnav")
	public ModelAndView toTopnav() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sys/topnav/topnav");
		return mv;
	}

	/**
	 * 访问注册页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/goreg")
	public ModelAndView goReg(Map<String, Object> sysUser, String paneltitle) {
		logger.info("start----------------去新增sysUser页面");
		ModelAndView mv = new ModelAndView();
		mv.addObject("sysUser", sysUser);
		mv.addObject("paneltitle", paneltitle);
		mv.setViewName("sys/login/sysuser_reg_dialog");
		return mv;
	}

	/**
	 * 修改密码
	 */
	@RequestMapping(value = "/modifyPassword")
	@ResponseBody
	public Object modifyPassword() throws Exception {
		logger.info("start----------------新增sysUser");
		Map<String, Object> sysUser = RequestUtil.getParameterMap(logger);
		String oldPassword = EndecryptUtils.passwordMd5(sysUser.get("sys_user_password_old").toString(),
				sysUser.get("sys_user_account").toString());
		String newPassword = EndecryptUtils.passwordMd5(sysUser.get("sys_user_password").toString(),
				sysUser.get("sys_user_account").toString());
		Map<String, Object> sysUserQuery = new HashMap<String, Object>();
		sysUserQuery.put("sys_user_id", sysUser.get("sys_user_id"));
		sysUserQuery = sysUserService.find(sysUserQuery);

		if (StringUtils.equals(oldPassword, sysUserQuery.get("sys_user_password").toString())) {
			sysUser.put("sys_user_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			sysUser.put("sys_user_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			sysUser.put("sys_user_password", newPassword);
			sysUserService.updateById(sysUser);
			return ResponseUtil.resultMap(1, "成功");
		} else {
			return ResponseUtil.resultMap(2, "密码错误");
		}

	}

	/**
	 * 保存注册用户
	 */
	@RequestMapping(value = "/savereg")
	@ResponseBody
	public Object saveReg() throws Exception {
		logger.info("start----------------新增sysUser");
		Map<String, Object> sysUser = RequestUtil.getParameterMap(logger);
		Map<String, Object> sysUserOld = new HashMap<String, Object>();
		sysUserOld.put("sys_user_account", sysUser.get("sys_user_account"));
		sysUserOld = sysUserService.find(sysUserOld);
		if (StringUtils.isEmpty(sysUser.get("sys_user_id").toString())) {
			if (sysUserOld != null) {
				return ResponseUtil.resultMap(2, "帐号已存在");
			} else {
				sysUser.put("sys_user_id", IDUtil.get32UUID());
				sysUser.put("sys_user_password", EndecryptUtils.passwordMd5(sysUser.get("sys_user_password").toString(),
						sysUser.get("sys_user_account").toString()));
				sysUser.put("sys_user_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
//				sysUser.put("sys_user_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
				sysUserService.save(sysUser);
			}
		} else {
			sysUser.put("sys_user_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			sysUser.put("sys_user_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			sysUserService.updateById(sysUser);
		}
		return ResponseUtil.resultMap(1, "成功");

	}

	/**
	 * 保存注册用户
	 */
	@RequestMapping(value = "/saveregfile")
	@ResponseBody
	public Object saveregfile(@RequestParam(value = "sys_file_1", required = false) MultipartFile sys_file_1,
			@RequestParam(value = "sys_file_2", required = false) MultipartFile sys_file_2, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("start----------------新增sysUser");
		Map<String, Object> sysUser = new HashMap<String, Object>();
		Map<String, String[]> sysUsers = request.getParameterMap();
		for (String key : sysUsers.keySet()) {
			System.out.println("key= " + key + " and value= " + sysUsers.get(key));
			sysUser.put(key, sysUsers.get(key)[0]);
		}

		Map<String, Object> sysUserOld = new HashMap<String, Object>();
		sysUserOld.put("sys_user_account", sysUser.get("sys_user_account"));
		sysUserOld = sysUserService.find(sysUserOld);
		if (StringUtils.isEmpty(sysUser.get("sys_user_id").toString())) {
			if (sysUserOld != null) {
				return ResponseUtil.resultMap(2, "帐号已存在");
			} else {
				String newUUID = IDUtil.get32UUID();
				String filePath = PathUtil.getWebPath("dist/sysfiles/" + newUUID + "/");
				if (sys_file_1 != null) {
					FileUtils.copyToFile(sys_file_1.getInputStream(),
							new File(filePath + "1" + sys_file_1.getOriginalFilename()));
					sysUser.put("sys_file_1", "dist/sysfiles/" + sysUser.get("sys_user_id").toString() + "/" + "1"
							+ sys_file_1.getOriginalFilename());
				}
				if (sys_file_2 != null) {
					FileUtils.copyToFile(sys_file_2.getInputStream(),
							new File(filePath + "2" + sys_file_2.getOriginalFilename()));
					sysUser.put("sys_file_2", "dist/sysfiles/" + sysUser.get("sys_user_id").toString() + "/" + "2"
							+ sys_file_2.getOriginalFilename());
				}
				sysUser.put("sys_user_id", newUUID);
				sysUser.put("sys_user_password",
						EndecryptUtils.passwordMd5(sysUser.get("sys_user_password").toString(),
								sysUser.get("sys_user_account").toString()));
				sysUser.put("sys_user_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
				sysUser.put("sys_user_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
				sysUserService.save(sysUser);
			}
		} else {
			Map<String, Object> sysFile = RequestUtil.getParameterMap(logger);
			String sys_user_id = (String) sysUser.get("sys_user_id");
			String filePath = PathUtil.getWebPath("dist/sysfiles/" + sysUser.get("sys_user_id").toString() + "/");
			sysFile.put("sys_user_id", sys_user_id);
			Map<String,Object> testFile = sysFileService.find(sysFile);
			if (sys_file_1 != null) {
				FileUtils.copyToFile(sys_file_1.getInputStream(),
						new File(filePath + "1" + sys_file_1.getOriginalFilename()));
				//sysUser.put("sys_file_1", "dist/sysfiles/" + sysUser.get("sys_user_id").toString() + "/" + "1"
					//	+ sys_file_1.getOriginalFilename());
				sysFile.put("sys_file1_name", sys_file_1.getOriginalFilename());
				sysFile.put("sys_file1_addr", "dist/sysfiles/" + sysUser.get("sys_user_id").toString() + "/" + "1"
						+ sys_file_1.getOriginalFilename());
			}
			if (sys_file_2 != null) {
				FileUtils.copyToFile(sys_file_2.getInputStream(),
						new File(filePath + "2" + sys_file_2.getOriginalFilename()));
				//sysUser.put("sys_file_2", "dist/sysfiles/" + sysUser.get("sys_user_id").toString() + "/" + "2"
					//	+ sys_file_2.getOriginalFilename());
				
				sysFile.put("sys_file2_name", sys_file_2.getOriginalFilename());
				sysFile.put("sys_file2_addr", "dist/sysfiles/" + sysUser.get("sys_user_id").toString() + "/" + "2"
						+ sys_file_2.getOriginalFilename());
				
			}
			if(testFile!=null){
				sysFile.put("sys_file_id", testFile.get("sys_file_id"));
				sysFile.put("sys_file_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			    sysFile.put("sys_file_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			    sysFileService.updateById(sysFile);
			}else{
				sysFile.put("sys_file_id", IDUtil.get32UUID());
				sysFile.put("sys_file_createdate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			    sysFile.put("sys_file_createuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			    sysFileService.save(sysFile);
			}
			
			
			sysUser.put("sys_user_updatedate", new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
			sysUser.put("sys_user_updateuid", ShiroUtils.getCurrentUser().get("sys_user_id"));
			sysUserService.updateById(sysUser);
			Map <String,Object> use = sysUserService.find(sysUser);
			System.out.println("修改的用户："+use);
			ShiroUtils.setAttr("currentUser", use);
			System.out.println("用户的信息："+ShiroUtils.getCurrentUser());
			
		}
		return ResponseUtil.resultMap(1, "成功");

	}
}
