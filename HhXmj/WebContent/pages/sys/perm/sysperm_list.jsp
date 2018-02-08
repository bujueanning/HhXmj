<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>  
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html>
<html>
<head>
  <base href="<%=basePath%>">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Simple Tables</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
  <link href="plugins/Font-Awesome-master/css/font-awesome.min.css" rel="stylesheet">
  <!-- Ionicons -->
  <link href="plugins/ionicons-master/css/ionicons.min.css" rel="stylesheet">
  <!-- Pagination-master -->
  <link href="plugins/Pagination-master/mricode.pagination.css" rel="stylesheet" />
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="plugins/icheck-1.x/skins/all.css">
    <!-- Select2 -->
  <link rel="stylesheet" href="plugins/select2/select2.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue layout-top-nav">
<div class="wrapper">
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <form class="form-horizontal" action="sys/perm/list" name="syspermListForm" id="syspermListForm" method="post">
        	  <input type="hidden" name="pageIndex" id="pageIndex" value="${sysPerm.pageIndex}"/>
			  <input type="hidden" name="pageSize" id="pageSize" value="${sysPerm.pageSize}"/>
			  <input type="hidden" name="total" id="total" value="${sysPerm.total}"/>
			  
			  <div class="box box-info">
	            <div class="box-header with-border">
	              <h3 class="box-title">查询</h3>
	            </div>
	            <!-- /.box-header -->
	            <!-- form start -->
	              <div class="box-body">
	                <div class="form-group">
	                  <label for="conditionName" class="col-sm-1 control-label">选项</label>
	                  <div class="col-sm-3">
	                    <select id="conditionName" name="conditionName" class="form-control select2" >
	                    	        <option value="" <c:if test="${conditionName==''}"> selected </c:if> >请选择</option>
									<option value="sys_perm_id" <c:if test="${conditionName=='sys_perm_id'}"> selected </c:if> >主键</option>
									<option value="sys_perm_pid" <c:if test="${conditionName=='sys_perm_pid'}"> selected </c:if> >父主键</option>
									<option value="sys_perm_name" <c:if test="${conditionName=='sys_perm_name'}"> selected </c:if> >权限名称</option>
									<option value="sys_perm_flag" <c:if test="${conditionName=='sys_perm_flag'}"> selected </c:if> >权限标识</option>
									<option value="sys_perm_url" <c:if test="${conditionName=='sys_perm_url'}"> selected </c:if> >权限地址</option>
									<option value="sys_perm_createdate" <c:if test="${conditionName=='sys_perm_createdate'}"> selected </c:if> >创建时间</option>
									<option value="sys_perm_updatedate" <c:if test="${conditionName=='sys_perm_updatedate'}"> selected </c:if> >更新时间</option>
									<option value="sys_perm_createuid" <c:if test="${conditionName=='sys_perm_createuid'}"> selected </c:if> >创建人</option>
									<option value="sys_perm_updateuid" <c:if test="${conditionName=='sys_perm_updateuid'}"> selected </c:if> >更新人</option>
		                </select>
	                  </div>
	                  <label for="conditionValue" class="col-sm-1 control-label">内容</label>
	                  <div class="col-sm-3">
	                    <input id="conditionValue" name="conditionValue" type="text" class="form-control" placeholder="内容"  value="${conditionValue}">
	                  </div>
	                </div>
	              </div>
	              <!-- /.box-body -->
	              <div class="box-footer">
	                <button type="button" class="btn btn-info pull-right" onclick="resetSearch();" >重置</button>
	                <button type="button" class="btn btn-info pull-right" onclick="formSubmit();" style="margin-right: 5px;">查询</button>
	              </div>
	              <!-- /.box-footer -->
	          </div>
			  
			  
			  
	          <div class="box">
	            <!-- /.box-header -->
	            <div class="box-body table-responsive no-padding">
	              <table class="table table-hover">
	                <tr>
	                	   <th><input name='checkAll' id='checkAll' type="checkbox" class="flat-red"></th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">父主键</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">权限名称</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">权限标识</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">权限地址</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">创建时间</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">更新时间</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">创建人</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">更新人</th>
						    <th style="width: 80px;">操作</th>
	                </tr>
	                <c:choose>
							<c:when test="${not empty varList}">
								<c:forEach items="${varList}" var="var" varStatus="vs">
									<tr>
											<td>
												<input name='sysPermIds' id='sysPermIds' type="checkbox" class="flat-red" value="${var.sys_perm_id}" >
											</td>
										    <td>${var.sys_perm_pid}</td>
										    <td>${var.sys_perm_name}</td>
										    <td>${var.sys_perm_flag}</td>
										    <td>${var.sys_perm_url}</td>
							              	<td><fmt:formatDate value="${var.sys_perm_createdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							              	<td><fmt:formatDate value="${var.sys_perm_updatedate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										    <td>${var.sys_perm_createuid}</td>
										    <td>${var.sys_perm_updateuid}</td>
											<td>
												<shiro:hasPermission name="sysPerm:goedit">
													<a style="cursor:pointer;" title="编辑" onclick="edit('sys/perm/goedit?sys_perm_id='+'${var.sys_perm_id}',800);" class="btn btn-social-icon btn-info btn-xs"><i class="fa fa-edit"></i></a>
												</shiro:hasPermission>
												<shiro:hasPermission name="sysPerm:del">
													<a style="cursor:pointer;" title="删除" onclick="del('sys/perm/del?sys_perm_id='+'${var.sys_perm_id}',800);" class="btn btn-social-icon btn-primary btn-xs"><i class="fa fa-trash"></i></a>
												</shiro:hasPermission>
												<shiro:hasPermission name="sysPerm:upload">
									              <a style="cursor:pointer;" title="导入" onclick="upload('sys/perm/upload?sys_perm_id='+'${var.sys_perm_id}',800);" class="btn btn-social-icon btn-primary btn-xs"><i class="fa fa-upload"></i></a>
									            </shiro:hasPermission>
											</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="main_info">
									<td colspan="100" class="center" >没有相关数据</td>
								</tr>
							</c:otherwise>
						</c:choose>
	              </table>
	            </div>
	            <!-- /.box-body -->
	            <div class="box-footer clearfix">
	            	<div class="pull-left">
	            		<shiro:hasPermission name="sysPerm:goadd">
	            			 <a style="cursor:pointer;" title="新增" onclick="add('sys/perm/goadd',800);" class="btn btn-social-icon btn-info"><i class="fa fa-plus-square"></i></a>
	            		</shiro:hasPermission>
	            		<shiro:hasPermission name="sysPerm:delall">
	            			<a style="cursor:pointer;" title="删除" onclick="delArray('sys/perm/delall',800);" class="btn btn-social-icon btn-primary"><i class="fa fa-trash"></i></a>
	            		</shiro:hasPermission>
	            		<shiro:hasPermission name="sysPerm:upload">
	            			<a style="cursor:pointer;" title="上传" onclick="upload('sys/perm/upload',400);" class="btn btn-social-icon btn-primary"><i class="fa fa-upload"></i></a>
	            		</shiro:hasPermission>
			            <!--<a style="cursor:pointer;" title="批量提交" onclick="postObjs('sys/perm/postall',800);" class="btn btn-social-icon btn-primary"><i class="fa fa-flag-o"></i></a>-->
	            	</div>
	            	<div id="page" class="pagination pagination-sm m-pagination no-margin pull-right"></div>
	            </div>
	          </div>
          </form>
          <!-- /.box -->
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- Slimscroll -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- Pagination-master -->
<script src="plugins/Pagination-master/mricode.pagination.js"></script>
<!-- iCheck 1.0.1 -->
<script src="plugins/icheck-1.x/icheck.min.js"></script>
<!-- Select2 -->
<script src="plugins/select2/select2.full.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>

 <script>
 
  $(function () {
  	window.top.loadClose();
  	//Initialize Select2 Elements
    $(".select2").select2();
	//Flat red color scheme for iCheck
	 $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
	   checkboxClass: 'icheckbox_flat-green',
	   radioClass: 'iradio_flat-green'
	 });
	 $('#checkAll').on('ifChecked', function(event){
	 		$('input#sysPermIds').iCheck('check');
	 	});
	 	$('#checkAll').on('ifUnchecked', function(event){
	 		$('input#sysPermIds').iCheck('uncheck');
	 	});
	 $("#page").pagination({
	     pageIndex: $("#pageIndex").val(),
	     pageSize: $("#pageSize").val(),
		 total: $("#total").val(),
	     debug: true,
	     showInfo: true,
	     showJump: false,
	     showPageSizes: false,
	     pageElementSort: ['$page', '$size', '$jump', '$info']
	 });
    $("#page").on("pageClicked", function (event, data) {
    	window.top.loadStart();
    	$("#pageIndex").val(data.pageIndex);
    	$("#syspermListForm").submit();
	});
    $("#page").on("pageSizeChanged", function (event, data) {
    	window.top.loadStart();
    	$("#pageSize").val(data.pageSize);
    	$("#syspermListForm").submit();
	});
  });
 	function del(url,height){
    	window.top.delDialog(url,height);
    }
    function delArray(url,height){
 		var sysPermIds = new Array();
 		 $("#sysPermIds:checked").each(function() {
 			sysPermIds.push($(this).val()); 
 		 });
    	window.top.delArrayDialog(url,sysPermIds);
    }
    function postObjs(url,height){
 		var objs = new Array();
 		 $("#sysPermIds:checked").each(function() {
 			var obj = {};
 			obj.sysPerm_id = $(this).val();
 			objs.push(obj); 
 		 });
    	window.top.postObjsDialog(url,objs);
    }
	function edit(url,height){
    	window.top.editDialog(url,height);
    }
    function add(url,height){
    	window.top.editDialog(url,height);
    }
    function formSubmit(){
		  $("#syspermListForm").submit();
	}
	function resetSearch(){
    	$("#conditionValue").val("");
    	//alert($("#conditionName").val()); value 值
    	//alert($('#conditionName  option:selected').text()); text 值
    	$("#conditionName").val("").trigger("change");
    }
    </script>
</body>
</html>
