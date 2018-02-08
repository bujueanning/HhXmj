<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${objectName}CommonMapper" >
  <sql id="Update_Sql" >
    <trim prefix="set" suffixOverrides="," >
    	<#list tableColumns as var>
			<if test="${objectName}.${var["COLUMN_NAME"]} != null  and ${objectName}.${var["COLUMN_NAME"]}!= ''" >
		        ${tablename}.${var["COLUMN_NAME"]} = ${r"#{"}${objectName}.${var["COLUMN_NAME"]}${r"}"},
		    </if>
	    </#list>	
    </trim>
  </sql>
  <sql id="Inserts_Sql" >
    <trim prefix="(" suffix=")" suffixOverrides="," >
    	<#list tableColumns as var>
	         <if test="paramKey.${var["COLUMN_NAME"]} != null  and paramKey.${var["COLUMN_NAME"]}!= ''" >
	          ${var["COLUMN_NAME"]},
	        </if>
	  	</#list>
    </trim>
    values  
    <foreach collection="paramValue" item="item" index="index" separator="," >  
        (
        	 <#list tableColumns as var>
		          <if test="item.${var["COLUMN_NAME"]} != null and item.${var["COLUMN_NAME"]}!= ''" >
			      	${r"#{item."}${var["COLUMN_NAME"]}${r"}"},
			      </if>
	      	 </#list>
        )  
    </foreach> 
  </sql>
  <sql id="Insert_Sql" >
    <trim prefix="(" suffix=")" suffixOverrides="," >
    	<#list tableColumns as var>
    		<if test="${var["COLUMN_NAME"]} != null  and ${var["COLUMN_NAME"]}!= ''" >
	          ${var["COLUMN_NAME"]},
	        </if>
	  	</#list>
    </trim>
    <trim prefix="values (" suffix=")" suffixOverrides="," >
	    <#list tableColumns as var>
	      <if test="${var["COLUMN_NAME"]} != null and ${var["COLUMN_NAME"]}!= ''" >
	      	${r"#{"}${var["COLUMN_NAME"]}${r"}"},
	      </if>
	     </#list>
    </trim>
  </sql>
  <sql id="Where_Update_Sql" >
    <trim prefix="where" prefixOverrides="and">
    	 <choose>
	    <#list tableColumns as var>
	      <when test="${objectName}Query.${var["COLUMN_NAME"]} != null and ${objectName}Query.${var["COLUMN_NAME"]}!= ''" >
	      	and ${tablename}.${var["COLUMN_NAME"]}=${r"#{"}${objectName}Query.${var["COLUMN_NAME"]}${r"}"}
	      </when>
	     </#list>
	      <otherwise> 
	      1!=1 
            </otherwise>
	     </choose>
    </trim>
  </sql>
    <sql id="Where_Del_Sql" >
    <trim prefix="where" prefixOverrides="and">
    	 <choose>
	    <#list tableColumns as var>
	      <when test="${var["COLUMN_NAME"]} != null and ${var["COLUMN_NAME"]}!= ''" >
	      	and ${tablename}.${var["COLUMN_NAME"]}=${r"#{"}${var["COLUMN_NAME"]}${r"}"}
	      </when>
	     </#list>
	     <when test="ids != null and ids!= ''" >
	      		and ${tablename}.${tablenameLower}_id in 
	      		<foreach collection="ids" item="id" index="index"
		            open="(" close=")" separator=",">
		           ${r"#{"}id${r"}"}
		        </foreach>
	      </when>
	      <otherwise> 
	      1!=1 
            </otherwise>
	     </choose>
    </trim>
  </sql>
  <sql id="Where_Select_Sql" >
    <trim prefix="where" prefixOverrides="and">
	    <#list tableColumns as var>
	      <if test="${var["COLUMN_NAME"]} != null and ${var["COLUMN_NAME"]}!= ''" >
	      	and ${tablename}.${var["COLUMN_NAME"]}=${r"#{"}${var["COLUMN_NAME"]}${r"}"}
	      </if>
	     </#list>
	     <if test="ids != null and ids!= ''" >
	      	and ${tablename}.${tablenameLower}_id in 
	      		<foreach collection="ids" item="id" index="index"
		            open="(" close=")" separator=",">
		            ${r"#{"}id${r"}"}
		        </foreach>
	      </if>
    </trim>
    <if test="startNu != null and pageSize != null" >
      <![CDATA[ limit ${r"#{"}startNu${r"}"}, ${r"#{"}pageSize${r"}"} ]]>
    </if>
  </sql>
  
  <sql id="Where_SelectTree_Sql" >
    <trim prefix="where" prefixOverrides="and">
	    <#list tableColumns as var>
	      <if test="${var["COLUMN_NAME"]} != null and ${var["COLUMN_NAME"]}!= ''" >
	      	and parent.${var["COLUMN_NAME"]}=${r"#{"}${var["COLUMN_NAME"]}${r"}"}
	      </if>
	     </#list>
	     <if test="ids != null and ids!= ''" >
	      	and parent.${tablenameLower}_id in 
	      		<foreach collection="ids" item="id" index="index"
		            open="(" close=")" separator=",">
		            ${r"#{"}id${r"}"}
		        </foreach>
	      </if>
    </trim>
    <if test="startNu != null and pageSize != null" >
      <![CDATA[ limit ${r"#{"}startNu${r"}"}, ${r"#{"}pageSize${r"}"} ]]>
    </if>
  </sql>
</mapper>