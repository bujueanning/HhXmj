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
  <!-- Select2 -->
  <link rel="stylesheet" href="plugins/select2/select2.min.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="plugins/colorpicker/bootstrap-colorpicker.min.css">
  <!-- Bootstrap time Picker -->
  <link rel="stylesheet" href="plugins/timepicker/bootstrap-timepicker.min.css">
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="plugins/icheck-1.x/skins/all.css">
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
    <!-- Main content -->
    <section class="content">
      <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">${r"${"}paneltitle${r"}"}</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <#if treeTableFlag=="1" >
				<form class="form-horizontal" action="${packagePath}/savetree" name="${objectNameLower}DialogForm" id="${objectNameLower}DialogForm" method="post">
			<#else>
				<form class="form-horizontal" action="${packagePath}/save" name="${objectNameLower}DialogForm" id="${objectNameLower}DialogForm" method="post">
			</#if>
            
              
              <#list tableColumns as var>
	              <#if var["COLUMN_NAME"]?ends_with("_id") && var["COLUMN_NAME"]?replace("_id","")==tablename>
	              	<input type="hidden" name="${var["COLUMN_NAME"]}" id="${var["COLUMN_NAME"]}" value="${r"${"}${objectName}.${var["COLUMN_NAME"]}${r"}"}"/>
	              	<#elseif var["COLUMN_NAME"]?ends_with("pid")?string=='true'>
	              	<input type="hidden" name="${var["COLUMN_NAME"]}" id="${var["COLUMN_NAME"]}" value="${r"${"}${objectName}.${var["COLUMN_NAME"]}${r"}"}"/>
				  </#if>
			  </#list>
			
              <div class="box-body">
						<#list tableColumns as var>
							<#if var["COLUMN_NAME"]?contains("pid") >
							<#elseif var["COLUMN_NAME"]?replace("_id","")==tablename>
							<#elseif var["COLUMN_NAME"]?ends_with("_c")>
					                <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="${var["COLUMN_NAME"] }" class="col-sm-2 control-label">${var["COLUMN_COMMENT"]?replace(':.*', '', 'r')}:</label>
								                  <div class="col-sm-10">
								                    	<select id="${var["COLUMN_NAME"]}" name="${var["COLUMN_NAME"]}" class="form-control select2" >
									                    	        <option value="" >请选择</option>
									                    	        <c:forEach items="${r"${"}dict.${var["COLUMN_NAME"]?replace(tablenameLower+'_','')}${r"}"}" var="var" varStatus="vs">
									                    	        	<option value="${r"${"}var.sys_dict_id${r"}"}" <c:if test="${r"${"}${objectName}.${var["COLUMN_NAME"]}==var.sys_dict_id${r"}"}"> selected </c:if> >${r"${"}var.sys_dict_name${r"}"}</option>
									                    	        </c:forEach>
										                </select>
								                  </div>
								                </div>
								         </div>
					                </div>
					         <#elseif  var["COLUMN_NAME"]?ends_with("_d")>
					                <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="${var["COLUMN_NAME"] }" class="col-sm-2 control-label">${var["COLUMN_COMMENT"]?replace(':.*', '', 'r')}:</label>
								                  <div class="col-sm-10">
								                    	<select id="${var["COLUMN_NAME"]}" name="${var["COLUMN_NAME"]}" class="form-control select2" >
									                    	        <option value="" >请选择</option>
									                    	        <c:forEach items="${r"${"}dict.${var["COLUMN_NAME"]}${r"}"}" var="var" varStatus="vs">
									                    	        	<option value="${r"${"}var.sys_dict_id${r"}"}" <c:if test="${r"${"}${objectName}.${var["COLUMN_NAME"]}==var.sys_dict_id${r"}"}"> selected </c:if> >${r"${"}var.sys_dict_name${r"}"}</option>
									                    	        </c:forEach>
										                </select>
								                  </div>
								                </div>
								         </div>
					                </div>       
							<#elseif  var["COLUMN_NAME"]?ends_with("_id") && var["COLUMN_NAME"]?replace("_id","")!=tablename>
					                <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="${var["COLUMN_NAME"]?replace("_id","_name")}" class="col-sm-2 control-label">${var["COLUMN_COMMENT"] }:</label>
								                  <div class="col-sm-10">
								                    
								                    <select id="${var["COLUMN_NAME"]}" name="${var["COLUMN_NAME"]}" class="form-control select2" >
									                    	        <option value="" >请选择</option>
									                    	        <c:forEach items="${var["COLUMN_NAME"]?replace("_id","")?replace("_.*","","r")}${var["COLUMN_NAME"]?replace("_id","")?replace(".*_","","r")?cap_first}" var="var" varStatus="vs">
									                    	        	<option value="${r"${"}var.${var["COLUMN_NAME"]}${r"}"}" <c:if test="${r"${"}${objectName}.${var["COLUMN_NAME"]}==var.${var["COLUMN_NAME"]}${r"}"}"> selected </c:if> >${r"${"}var.${var["COLUMN_NAME"]?replace("_id","_name")}${r"}"}</option>
									                    	        </c:forEach>
										                </select>
								                    
								                  </div>
								                </div>
								         </div>
					                </div>      
							<#elseif var["DATA_TYPE"] == 'datetime'>
					               <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
									                <label for="${var["COLUMN_NAME"] }" class="col-sm-2 control-label">${var["COLUMN_COMMENT"] }:</label>
									                <div class="col-sm-10">
									                   <div class="input-group date">
								                          <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
								                  		  <input name="${var["COLUMN_NAME"] }" id="${var["COLUMN_NAME"] }"  type="text" class="form-control datepicker" placeholder="${var["COLUMN_COMMENT"] }" title="${var["COLUMN_COMMENT"] }" value="<fmt:formatDate value="${r"${"}${objectName}.${var["COLUMN_NAME"]}${r"}"}" pattern="yyyy-MM-dd HH:mm:ss" />">
								                	   </div>
								                
									                </div>
									                <!-- /.input group -->
									              </div>
								         </div>
					                </div>
					         <#else>
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="${var["COLUMN_NAME"] }" class="col-sm-2 control-label">${var["COLUMN_COMMENT"] }:</label>
								                  <div class="col-sm-10">
								                    <input name="${var["COLUMN_NAME"] }" id="${var["COLUMN_NAME"] }" type="text" class="form-control"  placeholder="${var["COLUMN_COMMENT"] }" title="${var["COLUMN_COMMENT"] }" value="${r"${"}${objectName}.${var["COLUMN_NAME"]}${r"}"}">
								                  </div>
								                </div>
								         </div>
					                </div>
							</#if>
			              
					</#list>
              </div>
              <!-- /.box-body -->
            </form>
          </div>
      <!-- /.box -->
    </section>
    <!-- /.content -->
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
<!-- Select2 -->
<script src="plugins/select2/select2.full.min.js"></script>
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
        <#list tableColumns as var>
			<#if var["COLUMN_NAME"]=="${objectName}Id" >
			<#elseif var["COLUMN_NAME"]?contains("Id")>		
			<#else>
				 ${r"$('#"}${var["COLUMN_NAME"]}${r"')"}.require();//${var["COLUMN_COMMENT"]}
			</#if>
		</#list>
    });
  });
function validateInputs() {
          $.validity.start();
<#list tableColumns as var>
	<#if var["COLUMN_NAME"]=="${objectName}Id" >
	<#elseif var["COLUMN_NAME"]?contains("Id")>		
	<#else>
		//${r"$('#"}${var["COLUMN_NAME"]}${r"')"}.require();//${var["COLUMN_COMMENT"]}
	</#if>
</#list>
	     var result = $.validity.end();
	     return result.valid;
}    
function formSubmit(<#if treeTableFlag=="1" >flag</#if>){
	  $.ajax({
			type: "POST",
			url:${r"$('#"}${objectNameLower}${r"DialogForm')"}.attr('action'),
			data:${r"$('#"}${objectNameLower}${r"DialogForm')"}.serialize(),// 你的formid
			cache: false,
			async: false,
			error: function(request) {
				alert("Connection error");
			},
			success: function(data) {
				<#if treeTableFlag=="1" >
				if(flag=='edit'){
					window.top.indexFrame.nodeEdit(data);
				}
				if(flag=='add'){
					window.top.indexFrame.nodeAdd(data);
				}
				if(flag=='addroot'){
					window.top.indexFrame.nodeAddRoot(data);
				}
				
				</#if>
			}
		});
}
</script>
</body>
</html>
