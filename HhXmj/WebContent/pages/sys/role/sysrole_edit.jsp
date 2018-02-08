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
  <title>AdminLTE 2 | Advanced form elements</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link href="plugins/Font-Awesome-master/css/font-awesome.min.css" rel="stylesheet">
  <!-- Ionicons -->
  <link href="plugins/ionicons-master/css/ionicons.min.css" rel="stylesheet">
  <!-- daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="plugins/icheck-1.x/skins/all.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="plugins/colorpicker/bootstrap-colorpicker.min.css">
  <!-- Bootstrap time Picker -->
  <link rel="stylesheet" href="plugins/timepicker/bootstrap-timepicker.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="plugins/select2/select2.min.css">
  <!-- jquery.validity -->
  <link rel="stylesheet" href="plugins/validity-master/build/jquery.validity.css" />
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
      <!-- SELECT2 EXAMPLE -->
      <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">${paneltitle}</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal" action="sys/role/save" name="sysroleForm" id="sysroleForm" method="post">
              
	              	<input type="hidden" name="sys_role_id" id="sys_role_id" value="${sysRole.sys_role_id}"/>
	              	<input type="hidden" name="sys_role_pid" id="sys_role_pid" value="${sysRole.sys_role_pid}"/>
	              	<input type="hidden" name="sys_role_createuid" id="sys_role_createuid" value="${sysRole.sys_role_createuid}"/>
	              	<input type="hidden" name="sys_role_updateuid" id="sys_role_updateuid" value="${sysRole.sys_role_updateuid}"/>
			
              <div class="box-body">
			              
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="sys_role_name" class="col-sm-2 control-label">角色名称:</label>
								                  <div class="col-sm-10">
								                    <input name="sys_role_name" id="sys_role_name" type="text" class="form-control"  placeholder="角色名称" title="角色名称" value="${sysRole.sys_role_name}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="sys_role_flag" class="col-sm-2 control-label">角色标识:</label>
								                  <div class="col-sm-10">
								                    <input name="sys_role_flag" id="sys_role_flag" type="text" class="form-control"  placeholder="角色标识" title="角色标识" value="${sysRole.sys_role_flag}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
					               <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
									                <label for="sys_role_createdate" class="col-sm-2 control-label">创建时间:</label>
									                <div class="col-sm-10">
									                   <div class="input-group date">
								                          <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
								                  		  <input name="sys_role_createdate" id="sys_role_createdate"  type="text" class="form-control datepicker" placeholder="创建时间" title="创建时间" value="<fmt:formatDate value="${sysRole.sys_role_createdate}" pattern="yyyy-MM-dd HH:mm:ss" />">
								                	   </div>
								                
									                </div>
									                <!-- /.input group -->
									              </div>
								         </div>
					                </div>
			              
					               <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
									                <label for="sys_role_updatedate" class="col-sm-2 control-label">更新时间:</label>
									                <div class="col-sm-10">
									                   <div class="input-group date">
								                          <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
								                  		  <input name="sys_role_updatedate" id="sys_role_updatedate"  type="text" class="form-control datepicker" placeholder="更新时间" title="更新时间" value="<fmt:formatDate value="${sysRole.sys_role_updatedate}" pattern="yyyy-MM-dd HH:mm:ss" />">
								                	   </div>
								                
									                </div>
									                <!-- /.input group -->
									              </div>
								         </div>
					                </div>
			              
			              
			              
					                <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="sys_role_testd_d" class="col-sm-2 control-label">测试d:0_test0,1_test1:</label>
								                  <div class="col-sm-10">
								                    	<select id="sys_role_testd_d" name="sys_role_testd_d" class="form-control select2" >
									                    	        <option value="" >请选择</option>
									                    	        <c:forEach items="${dict.sys_role_testd_d}" var="var" varStatus="vs">
									                    	        	<option value="${var.sys_dict_id}" <c:if test="${sysRole.sys_role_testd_d==var.sys_dict_id}"> selected </c:if> >${var.sys_dict_name}</option>
									                    	        </c:forEach>
										                </select>
								                  </div>
								                </div>
								         </div>
					                </div> 
			              
					                <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="sys_role_testc_c" class="col-sm-2 control-label">测试c:0_test0,1_test1:</label>
								                  <div class="col-sm-10">
								                    	<select id="sys_role_testc_c" name="sys_role_testc_c" class="form-control select2" >
									                    	        <option value="" >请选择</option>
									                    	        <c:forEach items="${dict.testc_c}" var="var" varStatus="vs">
									                    	        	<option value="${var.sys_dict_id}" <c:if test="${sysRole.sys_role_testc_c==var.sys_dict_id}"> selected </c:if> >${var.sys_dict_name}</option>
									                    	        </c:forEach>
										                </select>
								                  </div>
								                </div>
								         </div>
					                </div>
			              
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <button type="button" class="btn btn-default pull-right">Cancel</button>
                <shiro:hasPermission name="sysRole:save">
                	<button type="button" class="btn btn-info pull-right" style="margin-right: 5px;" onclick="formSubmit()">Sign in</button>
                </shiro:hasPermission>
              </div>
              <!-- /.box-footer -->
            </form>
          </div>
      <!-- /.box -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- Select2 -->
<script src="plugins/select2/select2.full.min.js"></script>
<!-- InputMask -->
<script src="plugins/input-mask/jquery.inputmask.js"></script>
<script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="plugins/daterangepicker/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- bootstrap color picker -->
<script src="plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap time picker -->
<script src="plugins/timepicker/bootstrap-timepicker.min.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="plugins/icheck-1.x/icheck.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- jquery.validity -->
<script src="plugins/validity-master/build/jquery.validity.min.js"></script>
<script src="plugins/validity-master/build/jquery.validity.lang.zh.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- Page script -->
<script>
  $(function () {
    //Initialize Select2 Elements
    $(".select2").select2();

    //Datemask dd/mm/yyyy
    $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
    //Datemask2 mm/dd/yyyy
    $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
    //Money Euro
    $("[data-mask]").inputmask();

    //Date range picker
    $('#reservation').daterangepicker();
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
    //Date range as a button
    $('#daterange-btn').daterangepicker(
        {
          ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          },
          startDate: moment().subtract(29, 'days'),
          endDate: moment()
        },
        function (start, end) {
          $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
    );

    //Date picker
    $('.datepicker').datepicker({
      format: 'yyyy-mm-dd',
      autoclose: true
    });

    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass: 'iradio_minimal-blue'
    });
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass: 'iradio_minimal-red'
    });
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass: 'iradio_flat-green'
    });

    //Colorpicker
    $(".my-colorpicker1").colorpicker();
    //color picker with addon
    $(".my-colorpicker2").colorpicker();

    //Timepicker
    $(".timepicker").timepicker({
      showInputs: false
    });
     //validity-master
    $("form").validity(function() {
				 $('#sys_role_id').require();//主键
				 $('#sys_role_pid').require();//父主键
				 $('#sys_role_name').require();//角色名称
				 $('#sys_role_flag').require();//角色标识
				 $('#sys_role_createdate').require();//创建时间
				 $('#sys_role_updatedate').require();//更新时间
				 $('#sys_role_createuid').require();//创建人
				 $('#sys_role_updateuid').require();//更新人
				 $('#sys_role_testd_d').require();//测试d:0_test0,1_test1
				 $('#sys_role_testc_c').require();//测试c:0_test0,1_test1
    });
  });
function validateInputs() {
          $.validity.start();
		//$('#sys_role_id').require();//主键
		//$('#sys_role_pid').require();//父主键
		//$('#sys_role_name').require();//角色名称
		//$('#sys_role_flag').require();//角色标识
		//$('#sys_role_createdate').require();//创建时间
		//$('#sys_role_updatedate').require();//更新时间
		//$('#sys_role_createuid').require();//创建人
		//$('#sys_role_updateuid').require();//更新人
		//$('#sys_role_testd_d').require();//测试d:0_test0,1_test1
		//$('#sys_role_testc_c').require();//测试c:0_test0,1_test1
	     var result = $.validity.end();
	     return result.valid;
}    
function formSubmit(){
	  $.ajax({
			type: "POST",
			url:$('#sysroleForm').attr('action'),
			data:$('#sysroleForm').serialize(),// 你的formid
			cache: false,
			async: false,
			error: function(request) {
				alert("Connection error");
			},
			success: function(data) {
				//alert(data);
			}
		});
}
</script>
</body>
</html>
