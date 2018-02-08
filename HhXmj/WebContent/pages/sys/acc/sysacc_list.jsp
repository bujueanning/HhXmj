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
          <form class="form-horizontal" action="sys/acc/list" name="sysaccListForm" id="sysaccListForm" method="post">
        	  <input type="hidden" name="pageIndex" id="pageIndex" value="${sysAcc.pageIndex}"/>
			  <input type="hidden" name="pageSize" id="pageSize" value="${sysAcc.pageSize}"/>
			  <input type="hidden" name="total" id="total" value="${sysAcc.total}"/>
	          <div class="box">
	            <div class="box-header-1">
	            		<shiro:hasPermission name="orgParty:delall">
	            			 ${sysAcc.day_activity_id}<a style="cursor:pointer;" title="上传" onclick="upload('sys/acc/upload?fid=${sysAcc.sys_acc_fid}',400);" class="btn btn-social btn-bitbucket"> <i class="fa fa-bitbucket"></i>上传</a>
	            		</shiro:hasPermission>
	           		</div>
	            <div class="box-body table-responsive no-padding">
	              <table class="table table-hover">
	                <tr>
	                	   <th><input name='checkAll' id='checkAll' type="checkbox" class="flat-red"></th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">外键id</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">附件名</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">附件地址</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">更新时间</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">创建时间</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">修改人</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">创建人</th>
						    <th style="width: 80px;">操作</th>
	                </tr>
	                <c:choose>
							<c:when test="${not empty varList}">
								<c:forEach items="${varList}" var="var" varStatus="vs">
									<tr>
											<td>
												<input name='sysAccIds' id='sysAccIds' type="checkbox" class="flat-red" value="${var.sys_acc_id}" >
											</td>
										    <td>${var.sys_acc_fid}</td>
										    <td>${var.sys_acc_name}</td>
										    <td>${var.sys_acc_addr}</td>
							              	<td><fmt:formatDate value="${var.sys_acc_updatedate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							              	<td><fmt:formatDate value="${var.sys_file_createdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										    <td>${var.sys_file_updateuid}</td>
										    <td>${var.sys_file_createuid}</td>
											<td>
												<shiro:hasPermission name="sysAcc:del">
													<a style="cursor:pointer;" title="删除" onclick="del('sys/acc/del?sys_acc_id='+'${var.sys_acc_id}',800);" class="btn btn-social-icon btn-primary btn-xs"><i class="fa fa-trash"></i></a>
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
	 		$('input#sysAccIds').iCheck('check');
	 	});
	 	$('#checkAll').on('ifUnchecked', function(event){
	 		$('input#sysAccIds').iCheck('uncheck');
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
    	$("#sysaccListForm").submit();
	});
    $("#page").on("pageSizeChanged", function (event, data) {
    	window.top.loadStart();
    	$("#pageSize").val(data.pageSize);
    	$("#sysaccListForm").submit();
	});
  });
 	function del(url,height){
    	window.top.delDialog(url,height);
    }
    function delArray(url,height){
 		var sysAccIds = new Array();
 		 $("#sysAccIds:checked").each(function() {
 			sysAccIds.push($(this).val()); 
 		 });
    	window.top.delArrayDialog(url,sysAccIds);
    }
    function postObjs(url,height){
 		var objs = new Array();
 		 $("#sysAccIds:checked").each(function() {
 			var obj = {};
 			obj.sysAcc_id = $(this).val();
 			objs.push(obj); 
 		 });
    	window.top.postObjsDialog(url,objs);
    }
    function upload(url,height){
    	window.top.uploadDialog(url,height);
    }
	function edit(url,height){
    	window.top.editDialog(url,height);
    }
    function add(url,height){
    	window.top.editDialog(url,height);
    }
    function formSubmit(){
		  $("#sysaccListForm").submit();
	}
    function upload(url,height){
    	window.top.uploadDialog(url,height);
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
