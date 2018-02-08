<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${objectName}Mapper" >
  <select id="select" resultType="java.util.Map" parameterType="java.util.Map" >
    select ${tablename}.* 
    <#list tableColumns as var>
		<#if var["COLUMN_NAME"]?ends_with("_c")>
			,${var["COLUMN_NAME"]?replace("_","")}.sys_dict_name ${var["COLUMN_NAME"]?replace("_c$","_n","r")}  
        <#elseif var["COLUMN_NAME"]?ends_with("_d")>
        	,${var["COLUMN_NAME"]?replace("_","")}.sys_dict_name ${var["COLUMN_NAME"]?replace("_d$","_n","r")}
		<#elseif var["COLUMN_NAME"]?ends_with("_id")  && var["COLUMN_NAME"]?replace("_id","")!=tablename>
        	,${var["COLUMN_NAME"]?replace("_id","")?replace("_","")}.${var["COLUMN_NAME"]?replace("_id","")}_name
		</#if>
    </#list>
    from ${tablename} 
    <#list tableColumns as var>
		<#if var["COLUMN_NAME"]?ends_with("_c")>
			LEFT JOIN sys_dict ${var["COLUMN_NAME"]?replace("_","")} ON ${var["COLUMN_NAME"]?replace("_","")}.sys_dict_id=${var["COLUMN_NAME"]}  
        <#elseif var["COLUMN_NAME"]?ends_with("_d")>
        	LEFT JOIN sys_dict ${var["COLUMN_NAME"]?replace("_","")} ON ${var["COLUMN_NAME"]?replace("_","")}.sys_dict_id=${var["COLUMN_NAME"]}
		<#elseif var["COLUMN_NAME"]?ends_with("_id") && var["COLUMN_NAME"]?replace("_id","")!=tablename>
        	LEFT JOIN ${var["COLUMN_NAME"]?replace("_id","")} ${var["COLUMN_NAME"]?replace("_id","")?replace("_","")} ON ${var["COLUMN_NAME"]?replace("_id","")?replace("_","")}.${var["COLUMN_NAME"]}=${tablename}.${var["COLUMN_NAME"]}
		</#if>
    </#list>
     
    <include refid="${objectName}CommonMapper.Where_Select_Sql" />
  </select>
<#if treeTableFlag=="1" >
  <select id="selectTree" resultType="java.util.Map" parameterType="java.util.Map" >
  	select *,if(childNu=0,false,true) lazy from(
	    select
	    parent.*,
	    <#list tableColumns as var>
			<#if var["COLUMN_NAME"]?ends_with("_c")>
				${var["COLUMN_NAME"]?replace("_","")}.sys_dict_name ${var["COLUMN_NAME"]?replace("_c$","_n","r")},  
	        <#elseif var["COLUMN_NAME"]?ends_with("_d")>
	        	${var["COLUMN_NAME"]?replace("_","")}.sys_dict_name ${var["COLUMN_NAME"]?replace("_d$","_n","r")},
			<#elseif var["COLUMN_NAME"]?ends_with("_id")  && var["COLUMN_NAME"]?replace("_id","")!=tablename>
	        	${var["COLUMN_NAME"]?replace("_id","")?replace("_","")}.${var["COLUMN_NAME"]?replace("_id","")}_name,
			</#if>
	    </#list>
	    ${tablenameLower}_id  treekey,
	    ${tablenameLower}_name  treetitle,
	    (SELECT COUNT(*) FROM ${tablenameUpper} child WHERE child.${tablenameUpper}_PID=parent.${tablenameUpper}_ID) childNu
	    from ${tablename} parent
	    <#list tableColumns as var>
		<#if var["COLUMN_NAME"]?ends_with("_c")>
			LEFT JOIN sys_dict ${var["COLUMN_NAME"]?replace("_","")} ON ${var["COLUMN_NAME"]?replace("_","")}.sys_dict_id=parent.${var["COLUMN_NAME"]}  
        <#elseif var["COLUMN_NAME"]?ends_with("_d")>
        	LEFT JOIN sys_dict ${var["COLUMN_NAME"]?replace("_","")} ON ${var["COLUMN_NAME"]?replace("_","")}.sys_dict_id=parent.${var["COLUMN_NAME"]}
		<#elseif var["COLUMN_NAME"]?ends_with("_id") && var["COLUMN_NAME"]?replace("_id","")!=tablename>
        	LEFT JOIN ${var["COLUMN_NAME"]?replace("_id","")} ${var["COLUMN_NAME"]?replace("_id","")?replace("_","")} ON ${var["COLUMN_NAME"]?replace("_id","")?replace("_","")}.${var["COLUMN_NAME"]}=parent.${var["COLUMN_NAME"]}
		</#if>
    </#list>
	    <include refid="${objectName}CommonMapper.Where_SelectTree_Sql" />
	   ) tree
  </select>
  <select id="selectAllTree" resultType="java.util.Map" parameterType="java.util.Map" >
	    select
	    parent.*,
	    <#list tableColumns as var>
			<#if var["COLUMN_NAME"]?ends_with("_c")>
				${var["COLUMN_NAME"]?replace("_","")}.sys_dict_name ${var["COLUMN_NAME"]?replace("_c$","_n","r")},  
	        <#elseif var["COLUMN_NAME"]?ends_with("_d")>
	        	${var["COLUMN_NAME"]?replace("_","")}.sys_dict_name ${var["COLUMN_NAME"]?replace("_d$","_n","r")},
			<#elseif var["COLUMN_NAME"]?ends_with("_id")  && var["COLUMN_NAME"]?replace("_id","")!=tablename>
	        	${var["COLUMN_NAME"]?replace("_id","")?replace("_","")}.${var["COLUMN_NAME"]?replace("_id","")}_name,
			</#if>
	    </#list>
	    ${tablenameLower}_id  treekey,
	    ${tablenameLower}_name  treetitle,
	    (SELECT COUNT(*) FROM ${tablenameUpper} child WHERE child.${tablenameUpper}_PID=parent.${tablenameUpper}_ID) childNu
	    from ${tablename} parent
	    <#list tableColumns as var>
		<#if var["COLUMN_NAME"]?ends_with("_c")>
			LEFT JOIN sys_dict ${var["COLUMN_NAME"]?replace("_","")} ON ${var["COLUMN_NAME"]?replace("_","")}.sys_dict_id=parent.${var["COLUMN_NAME"]}  
        <#elseif var["COLUMN_NAME"]?ends_with("_d")>
        	LEFT JOIN sys_dict ${var["COLUMN_NAME"]?replace("_","")} ON ${var["COLUMN_NAME"]?replace("_","")}.sys_dict_id=parent.${var["COLUMN_NAME"]}
		<#elseif var["COLUMN_NAME"]?ends_with("_id") && var["COLUMN_NAME"]?replace("_id","")!=tablename>
        	LEFT JOIN ${var["COLUMN_NAME"]?replace("_id","")} ${var["COLUMN_NAME"]?replace("_id","")?replace("_","")} ON ${var["COLUMN_NAME"]?replace("_id","")?replace("_","")}.${var["COLUMN_NAME"]}=parent.${var["COLUMN_NAME"]}
		</#if>
    </#list>
	   <include refid="${objectName}CommonMapper.Where_SelectTree_Sql" />
  </select>
</#if>
  
  <delete id="delete" parameterType="java.util.Map" >
    delete from ${tablename}
    <include refid="${objectName}CommonMapper.Where_Del_Sql" />
  </delete>
  <insert id="insert" parameterType="java.util.Map" >
    insert into ${tablename} <include refid="${objectName}CommonMapper.Insert_Sql" />
  </insert>
  <insert id="inserts" parameterType="java.util.List" >
    insert into ${tablename} <include refid="${objectName}CommonMapper.Inserts_Sql" />
  </insert>
  <update id="update" parameterType="java.util.Map" >
    update ${tablename} 
    <include refid="${objectName}CommonMapper.Update_Sql" />
    <include refid="${objectName}CommonMapper.Where_Update_Sql" />
  </update>
  <select id="count" parameterType="java.util.Map" resultType="java.lang.Integer" >
    select count(*) from ${tablename} 
    <if test="_parameter != null" >
      <include refid="${objectName}CommonMapper.Where_Select_Sql" />
    </if>
  </select>	
</mapper>