package com.adminlte.base.test;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.adminlte.sys.perm.service.SysPermService;
import com.adminlte.utils.IDUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext-test.xml")
public class BaseTest {
	@Resource(name = "sysPermService")
	private SysPermService sysPermService;
	//sys_filex替换auctionSheet,/auction/info/
	@Test
    public void saveTest() throws Exception {
		Map<String,Object> sysDelRoot = new HashMap<String,Object>();
		 sysDelRoot.put("sys_perm_flag","perms[auctionInfo:all]");	
		 sysDelRoot = sysPermService.find(sysDelRoot);
		
		 if(sysDelRoot!=null) {
			 Map<String,Object> sysDelParam = new HashMap<String,Object>();
			 List<String> ids = new ArrayList<String>();
			 ids.add(sysDelRoot.get("sys_perm_id").toString());
			 sysPermService.findAllTreeNodeIds(sysDelRoot.get("sys_perm_id").toString(),ids);
			 sysDelParam.put("ids", ids.toArray());
			 sysPermService.delete(sysDelParam);
		 }
		
		
		String rootId = IDUtil.get32UUID();
		 Map<String,Object> sysPermRoot = new HashMap<String,Object>();
		 sysPermRoot.put("sys_perm_id",rootId);	
		 sysPermRoot.put("sys_perm_pid","root");	
		 sysPermRoot.put("sys_perm_name","用户管理");	
		 sysPermRoot.put("sys_perm_flag","perms[auctionInfo:all]");	
		 sysPermRoot.put("sys_perm_url","/auction/info/**");	
		 sysPermRoot.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermRoot.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermService.save(sysPermRoot);
		 
		 Map<String,Object> sysPermPage = new HashMap<String,Object>();
		 sysPermPage.put("sys_perm_id",IDUtil.get32UUID());	
		 sysPermPage.put("sys_perm_pid",rootId);	
		 sysPermPage.put("sys_perm_name","页面");	
		 sysPermPage.put("sys_perm_flag","perms[auctionInfo:pages]");	
		 sysPermPage.put("sys_perm_url","/pages/auction/info/**");	
		 sysPermPage.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermPage.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermService.save(sysPermPage);
		 
		 Map<String,Object> sysPermList = new HashMap<String,Object>();
		 sysPermList.put("sys_perm_id",IDUtil.get32UUID());	
		 sysPermList.put("sys_perm_pid",rootId);	
		 sysPermList.put("sys_perm_name","列表");	
		 sysPermList.put("sys_perm_flag","perms[auctionInfo:list]");	
		 sysPermList.put("sys_perm_url","/auction/info/list");	
		 sysPermList.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermList.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermService.save(sysPermList);
		 
		 Map<String,Object> sysPermListTree = new HashMap<String,Object>();
		 sysPermListTree.put("sys_perm_id",IDUtil.get32UUID());	
		 sysPermListTree.put("sys_perm_pid",rootId);	
		 sysPermListTree.put("sys_perm_name","树列表");	
		 sysPermListTree.put("sys_perm_flag","perms[auctionInfo:listtree]");	
		 sysPermListTree.put("sys_perm_url","/auction/info/listtree");	
		 sysPermListTree.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermListTree.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermService.save(sysPermListTree);
//		 
//		 
		 Map<String,Object> sysPermSavePage = new HashMap<String,Object>();
		 sysPermSavePage.put("sys_perm_id",IDUtil.get32UUID());	
		 sysPermSavePage.put("sys_perm_pid",rootId);	
		 sysPermSavePage.put("sys_perm_name","增加页面");	
		 sysPermSavePage.put("sys_perm_flag","perms[auctionInfo:goadd]");	
		 sysPermSavePage.put("sys_perm_url","/auction/info/goadd");	
		 sysPermSavePage.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermSavePage.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermService.save(sysPermSavePage);
		 
		 Map<String,Object> sysPermSave = new HashMap<String,Object>();
		 sysPermSave.put("sys_perm_id",IDUtil.get32UUID());	
		 sysPermSave.put("sys_perm_pid",rootId);	
		 sysPermSave.put("sys_perm_name","增加");	
		 sysPermSave.put("sys_perm_flag","perms[auctionInfo:save]");	
		 sysPermSave.put("sys_perm_url","/auction/info/save");	
		 sysPermSave.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermSave.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermService.save(sysPermSave);
		 
		 
		 Map<String,Object> sysPermUpload = new HashMap<String,Object>();
		 sysPermUpload.put("sys_perm_id",IDUtil.get32UUID());	
		 sysPermUpload.put("sys_perm_pid",rootId);	
		 sysPermUpload.put("sys_perm_name","上传");	
		 sysPermUpload.put("sys_perm_flag","perms[auctionInfo:upload]");	
		 sysPermUpload.put("sys_perm_url","/auction/info/upload");	
		 sysPermUpload.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermUpload.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermService.save(sysPermUpload);
		 
		 Map<String,Object> sysPermDownload = new HashMap<String,Object>();
		 sysPermDownload.put("sys_perm_id",IDUtil.get32UUID());	
		 sysPermDownload.put("sys_perm_pid",rootId);	
		 sysPermDownload.put("sys_perm_name","上传");	
		 sysPermDownload.put("sys_perm_flag","perms[auctionInfo:download]");	
		 sysPermDownload.put("sys_perm_url","/auction/info/upload");	
		 sysPermDownload.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermDownload.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermService.save(sysPermDownload);
		 
		 Map<String,Object> sysPermEditPage = new HashMap<String,Object>();
		 sysPermEditPage.put("sys_perm_id",IDUtil.get32UUID());	
		 sysPermEditPage.put("sys_perm_pid",rootId);	
		 sysPermEditPage.put("sys_perm_name","修改页面");	
		 sysPermEditPage.put("sys_perm_flag","perms[auctionInfo:goedit]");	
		 sysPermEditPage.put("sys_perm_url","/auction/info/goedit");	
		 sysPermEditPage.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermEditPage.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		sysPermService.save(sysPermEditPage);
		
		Map<String,Object> sysPermEdit = new HashMap<String,Object>();
		 sysPermEdit.put("sys_perm_id",IDUtil.get32UUID());	
		 sysPermEdit.put("sys_perm_pid",rootId);	
		 sysPermEdit.put("sys_perm_name","修改");	
		 sysPermEdit.put("sys_perm_flag","perms[auctionInfo:edit]");	
		 sysPermEdit.put("sys_perm_url","/auction/info/edit");	
		 sysPermEdit.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermEdit.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		sysPermService.save(sysPermEdit);
		
		
		 Map<String,Object> sysPermDel = new HashMap<String,Object>();
		 sysPermDel.put("sys_perm_id",IDUtil.get32UUID());	
		 sysPermDel.put("sys_perm_pid",rootId);	
		 sysPermDel.put("sys_perm_name","删除");	
		 sysPermDel.put("sys_perm_flag","perms[auctionInfo:del]");	
		 sysPermDel.put("sys_perm_url","/auction/info/del");	
		 sysPermDel.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermDel.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermService.save(sysPermDel);
		
		Map<String,Object> sysPermDelAll = new HashMap<String,Object>();
		 sysPermDelAll.put("sys_perm_id",IDUtil.get32UUID());	
		 sysPermDelAll.put("sys_perm_pid",rootId);	
		 sysPermDelAll.put("sys_perm_name","批量删除");	
		 sysPermDelAll.put("sys_perm_flag","perms[auctionInfo:delall]");	
		 sysPermDelAll.put("sys_perm_url","/auction/info/delall");	
		 sysPermDelAll.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermDelAll.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		sysPermService.save(sysPermDelAll);
    }
	@Test
    public void saveTestTree() throws Exception {
		Map<String,Object> sysDelRoot = new HashMap<String,Object>();
		 sysDelRoot.put("sys_perm_flag","perms[auctionInfo:all]");	
		 sysDelRoot = sysPermService.find(sysDelRoot);
		
		 if(sysDelRoot!=null) {
			 Map<String,Object> sysDelParam = new HashMap<String,Object>();
			 List<String> ids = new ArrayList<String>();
			 ids.add(sysDelRoot.get("sys_perm_id").toString());
			 sysPermService.findAllTreeNodeIds(sysDelRoot.get("sys_perm_id").toString(),ids);
			 sysDelParam.put("ids", ids.toArray());
			 sysPermService.delete(sysDelParam);
		 }
		
		
		String rootId = IDUtil.get32UUID();
		 Map<String,Object> sysPermRoot = new HashMap<String,Object>();
		 sysPermRoot.put("sys_perm_id",rootId);	
		 sysPermRoot.put("sys_perm_pid","root");	
		 sysPermRoot.put("sys_perm_name","用户管理");	
		 sysPermRoot.put("sys_perm_flag","perms[auctionInfo:all]");	
		 sysPermRoot.put("sys_perm_url","/auction/info/**");	
		 sysPermRoot.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermRoot.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermService.save(sysPermRoot);
		 
		 Map<String,Object> sysPermPage = new HashMap<String,Object>();
		 sysPermPage.put("sys_perm_id",IDUtil.get32UUID());	
		 sysPermPage.put("sys_perm_pid",rootId);	
		 sysPermPage.put("sys_perm_name","页面");	
		 sysPermPage.put("sys_perm_flag","perms[auctionInfo:pages]");	
		 sysPermPage.put("sys_perm_url","/pages/auction/info/**");	
		 sysPermPage.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermPage.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermService.save(sysPermPage);
		 
		 Map<String,Object> sysPermSavePage = new HashMap<String,Object>();
		 sysPermSavePage.put("sys_perm_id",IDUtil.get32UUID());	
		 sysPermSavePage.put("sys_perm_pid",rootId);	
		 sysPermSavePage.put("sys_perm_name","保存页面");	
		 sysPermSavePage.put("sys_perm_flag","perms[auctionInfo:goadd]");	
		 sysPermSavePage.put("sys_perm_url","/auction/info/goadd");	
		 sysPermSavePage.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermSavePage.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermService.save(sysPermSavePage);
		 
		 Map<String,Object> sysPermSave = new HashMap<String,Object>();
		 sysPermSave.put("sys_perm_id",IDUtil.get32UUID());	
		 sysPermSave.put("sys_perm_pid",rootId);	
		 sysPermSave.put("sys_perm_name","保存");	
		 sysPermSave.put("sys_perm_flag","perms[auctionInfo:save]");	
		 sysPermSave.put("sys_perm_url","/auction/info/save");	
		 sysPermSave.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermSave.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermService.save(sysPermSave);
		 
		 
		 Map<String,Object> sysPermEditPage = new HashMap<String,Object>();
		 sysPermEditPage.put("sys_perm_id",IDUtil.get32UUID());	
		 sysPermEditPage.put("sys_perm_pid",rootId);	
		 sysPermEditPage.put("sys_perm_name","修改页面");	
		 sysPermEditPage.put("sys_perm_flag","perms[auctionInfo:goedit]");	
		 sysPermEditPage.put("sys_perm_url","/auction/info/goedit");	
		 sysPermEditPage.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermEditPage.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		sysPermService.save(sysPermEditPage);
		
		Map<String,Object> sysPermEdit = new HashMap<String,Object>();
		 sysPermEdit.put("sys_perm_id",IDUtil.get32UUID());	
		 sysPermEdit.put("sys_perm_pid",rootId);	
		 sysPermEdit.put("sys_perm_name","修改");	
		 sysPermEdit.put("sys_perm_flag","perms[auctionInfo:edit]");	
		 sysPermEdit.put("sys_perm_url","/auction/info/edit");	
		 sysPermEdit.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermEdit.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		sysPermService.save(sysPermEdit);
		
		
		 Map<String,Object> sysPermDel = new HashMap<String,Object>();
		 sysPermDel.put("sys_perm_id",IDUtil.get32UUID());	
		 sysPermDel.put("sys_perm_pid",rootId);	
		 sysPermDel.put("sys_perm_name","删除");	
		 sysPermDel.put("sys_perm_flag","perms[auctionInfo:del]");	
		 sysPermDel.put("sys_perm_url","/auction/info/del");	
		 sysPermDel.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermDel.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermService.save(sysPermDel);
		
		Map<String,Object> sysPermDelAll = new HashMap<String,Object>();
		 sysPermDelAll.put("sys_perm_id",IDUtil.get32UUID());	
		 sysPermDelAll.put("sys_perm_pid",rootId);	
		 sysPermDelAll.put("sys_perm_name","批量删除");	
		 sysPermDelAll.put("sys_perm_flag","perms[auctionInfo:delall]");	
		 sysPermDelAll.put("sys_perm_url","/auction/info/delall");	
		 sysPermDelAll.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermDelAll.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		sysPermService.save(sysPermDelAll);
		
		Map<String,Object> sysPermTree = new HashMap<String,Object>();
		 sysPermTree.put("sys_perm_id",IDUtil.get32UUID());	
		 sysPermTree.put("sys_perm_pid",rootId);	
		 sysPermTree.put("sys_perm_name","树页面");	
		 sysPermTree.put("sys_perm_flag","perms[auctionInfo:tree]");	
		 sysPermTree.put("sys_perm_url","/auction/info/tree");	
		 sysPermTree.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermTree.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		sysPermService.save(sysPermTree);
		
		Map<String,Object> sysPermSaveTree = new HashMap<String,Object>();
		 sysPermSaveTree.put("sys_perm_id",IDUtil.get32UUID());	
		 sysPermSaveTree.put("sys_perm_pid",rootId);	
		 sysPermSaveTree.put("sys_perm_name","保存树");	
		 sysPermSaveTree.put("sys_perm_flag","perms[auctionInfo:savetree]");	
		 sysPermSaveTree.put("sys_perm_url","/auction/info/savetree");	
		 sysPermSaveTree.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermSaveTree.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		sysPermService.save(sysPermSaveTree);
		Map<String,Object> sysPermTreenode = new HashMap<String,Object>();
		 sysPermTreenode.put("sys_perm_id",IDUtil.get32UUID());	
		 sysPermTreenode.put("sys_perm_pid",rootId);	
		 sysPermTreenode.put("sys_perm_name","查询树节点");	
		 sysPermTreenode.put("sys_perm_flag","perms[auctionInfo:treenode]");	
		 sysPermTreenode.put("sys_perm_url","/auction/info/treenode");	
		 sysPermTreenode.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermTreenode.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		sysPermService.save(sysPermTreenode);
		
		
		Map<String,Object> sysPermTreenodeall = new HashMap<String,Object>();
		 sysPermTreenodeall.put("sys_perm_id",IDUtil.get32UUID());	
		 sysPermTreenodeall.put("sys_perm_pid",rootId);	
		 sysPermTreenodeall.put("sys_perm_name","查询所有树节点");	
		 sysPermTreenodeall.put("sys_perm_flag","perms[auctionInfo:treenodeall]");	
		 sysPermTreenodeall.put("sys_perm_url","/auction/info/treenodeall");	
		 sysPermTreenodeall.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermTreenodeall.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		sysPermService.save(sysPermTreenodeall);
		
		Map<String,Object> sysPermDeltree = new HashMap<String,Object>();
		 sysPermDeltree.put("sys_perm_id",IDUtil.get32UUID());	
		 sysPermDeltree.put("sys_perm_pid",rootId);	
		 sysPermDeltree.put("sys_perm_name","删除树节点");	
		 sysPermDeltree.put("sys_perm_flag","perms[auctionInfo:deltree]");	
		 sysPermDeltree.put("sys_perm_url","/auction/info/deltree");	
		 sysPermDeltree.put("sys_perm_updatedate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		 sysPermDeltree.put("sys_perm_createdate",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));	
		sysPermService.save(sysPermDeltree);
    }
	
}
