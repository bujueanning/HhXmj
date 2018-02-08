package com.adminlte.auction.bond.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.adminlte.base.dao.DaoSupport;
import com.adminlte.utils.PropertiesUtil;

@Service("bondDisposalService")
public class BondDisposalService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(Map<String,Object> bondDisposal)throws Exception{
		dao.save("bondDisposalMapper.insert", bondDisposal);
	}
	/*
	* 批量新增
	*/
	public void saveList(List<Map<String,Object>> bondDisposals,Map<String,Object> bondDisposalKey)throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("paramKey", bondDisposalKey);
		paramMap.put("paramValue", bondDisposals);
		dao.save("bondDisposalMapper.inserts", paramMap);
	}
	/*
	* 删除
	*/
	public void delete(Map<String,Object> bondDisposal)throws Exception{
		dao.delete("bondDisposalMapper.delete", bondDisposal);
	}
	
	/*
	* 修改
	*/
	public void updateById(Map<String,Object> bondDisposal)throws Exception{
		Map<String,Object> bondDisposalQuery = new HashMap<String,Object>();
		bondDisposalQuery.put("bond_disposal_id",bondDisposal.get("bond_disposal_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("bondDisposal",bondDisposal);
		paramMap.put("bondDisposalQuery",bondDisposalQuery);
		System.out.println("业务层中的存放两个Map的paramMap:"+paramMap);
		dao.update("bondDisposalMapper.update", paramMap);
	}
	
	/*
	*列表
	*/
	public List<Object> list(Map<String,Object> bondDisposal)throws Exception{
		return (List<Object>)dao.findForList("bondDisposalMapper.select", bondDisposal);
	}
	/*
	 *列表map的list集合
	 */
	public List<Map<String,Object>> listMap(Map<String,Object> bondDisposal)throws Exception{
		return (List<Map<String, Object>>) dao.findForList("bondDisposalMapper.select", bondDisposal);
	}
	
	/*
	*分页列表
	*/
	public List<Object> pageList(Map<String,Object> bondDisposal) throws Exception{
		Integer total = (Integer)dao.findForObject("bondDisposalMapper.count", bondDisposal);
		bondDisposal.put("total",total);
		int pageSize=Integer.parseInt((String) PropertiesUtil.getProperties("setting.properties").get("pageSize"));	//当前页展示记录
		if(bondDisposal.get("pageIndex")==null){
			bondDisposal.put("pageIndex",0);
			bondDisposal.put("startNu",0);
			bondDisposal.put("pageSize",pageSize);
			
		}else{
			bondDisposal.put("startNu",Integer.valueOf(bondDisposal.get("pageIndex").toString())*pageSize);
			bondDisposal.put("pageSize",pageSize);
		}
		
		return (List<Object>)dao.findForList("bondDisposalMapper.select", bondDisposal);
	}
	
	/*
	*查找所有
	*/
	public List<Object> findAll()throws Exception{
		return (List<Object>)dao.findForList("bondDisposalMapper.select", null);
	}
	
	/*
	* 查找数据
	*/
	public Map<String,Object> find(Map<String,Object> bondDisposal)throws Exception{
		return (Map<String,Object>)dao.findForObject("bondDisposalMapper.select", bondDisposal);
	}
	
	/*
	 * 获得资产编号
	 */
	public Map<String,Object> findNum(Map<String,Object> bondNumber)throws Exception{
		return (Map<String,Object>)dao.findForObject("bondDisposalMapper.selectNum", bondNumber);
	}
	
	
	/*
	 * 修改资产编号
	 */
	public void updateByIdNum(Map<String,Object> bondNumber)throws Exception{
		Map<String,Object> bondNumberQuery = new HashMap<String,Object>();
		bondNumberQuery.put("bond_asset_number_id",bondNumber.get("bond_asset_number_id"));	
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("bondNumber",bondNumber);
		paramMap.put("bondNumberQuery",bondNumberQuery);
		System.out.println("业务层中的存放两个Map的paramMap:"+paramMap);
		dao.update("bondDisposalMapper.updateNum", paramMap);
	}
	
	
	
}

