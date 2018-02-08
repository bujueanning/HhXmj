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
  <script type="text/javascript" src="pages/sys/kj/js/jquery-1.8.2.min.js"></script>
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
              <h3 class="box-title">${paneltitle}</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
				<form class="form-horizontal" action="sys/user/save" name="sysuserDialogForm" id="sysuserDialogForm" method="post">
            
              
	              	<input type="hidden" name="sys_user_id" id="sys_user_id" value="${sysUser.sys_user_id}"/>
	              	<input type="hidden" name="sys_user_createuid" id="sys_user_createuid" value="${sysUser.sys_user_createuid}"/>
	              	<input type="hidden" name="sys_user_updateuid" id="sys_user_updateuid" value="${sysUser.sys_user_updateuid}"/>
	              	<input type="hidden" name="sys_file1_addr" id="sys_file1_addr" value=""/>
	              	<input type="hidden" name="sys_file2_addr" id="sys_file2_addr" value=""/>
	              	<input type="hidden" name="siteId" id="siteId" value="${sysUser.sys_area_id}"/>
			
              <div class="box-body">
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="sys_user_name" class="col-sm-2 control-label">姓名:</label>
								                  <div class="col-sm-10">
								                    <input name="sys_user_name" id="sys_user_name" type="text" class="form-control"  placeholder="姓名" title="姓名" value="${sysUser.sys_user_name}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="sys_user_account" class="col-sm-2 control-label">手机号:</label>
								                  <div class="col-sm-10">
								                    <input name="sys_user_account" id="sys_user_account" type="text" class="form-control"  placeholder="帐号" title="帐号" value="${sysUser.sys_user_account}" readonly="readonly">
								                  </div>
								                </div>
								         </div>
					                </div>
			              			 <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_location" class="col-sm-2 control-label">
									<c:if test="${sysUser.sys_user_reg_type_d == 'a55c6e261e774082bbd5521130c5c1e6'}">加盟方</c:if>
                            		<c:if test="${sysUser.sys_user_reg_type_d == '37b73a43f23a42edb6bef45a96628217'}">用户</c:if>
                            		<c:if test="${sysUser.sys_user_reg_type_d == 'a77fda4f171f45f1b089f0dd18221e22'}">发布方</c:if>所在地:</label>
                            <div class="col-sm-10">
                                <select class="inpt w200" id="bond_site" name="bond_site"
                                        style="float: left;">
                                    <c:if test="${paneltitle == '加盟方添加'}"> <option value="">请选择省份</option></c:if>  
                                    <c:forEach items="${siteList}" var="varMap">
                                         <option value="${varMap.bond_site_id}" 
                                          		 <c:if test="${varMap.bond_site_id== siteOne.bond_site_pid}">selected </c:if>>
                                                 ${varMap.bond_location_name}
                                         </option>
                                    </c:forEach>
                                </select>
                                <input id="siteId" type="hidden" value="${siteOne.bond_site_id}"/>
                                <input id="sitePid"type="hidden" value="${siteOne.bond_site_pid }"/>
                                <input id="location" type="hidden" value="${location }"/>
                                <input id="reg_type" type="hidden" value="${sysUser.sys_user_reg_type_d  }"/>
                                <select class="inpt w200" id="sys_area_id" name="sys_area_id"
                                        style="float: left;">
                                        <c:forEach items="${city}" var="varMap">
                                         <option value="${varMap.bond_site_id}" 
                                          		 <c:if test="${varMap.bond_site_id== siteOne.bond_site_id}">selected </c:if>>
                                                 ${varMap.bond_location_name}
                                         </option>
                                    	</c:forEach>
                                </select>
                                <c:if test="${sysUser.sys_user_reg_type_d =='a55c6e261e774082bbd5521130c5c1e6' }"><a id="join">加盟方地区唯一性</a></c:if>
                            </div>
                        </div>
                    </div>
                </div>
<!-- 全国的地址 -->
<script type="text/javascript">
$(function(){
	var bond_site_pid = $("#sitePid").val();
	var bond_site_nid = $("#siteId").val();
    var location = $("#location").val();
	var reg_type=$("#reg_type").val();
	if(location == "-1"){
		console.log("这是个没有完善地址信息的用户");
		var select = $("#sys_area_id");
		select.empty(); 
		select.append('<option value="">请选择城市</option>');
	}else{
		if(reg_type == "a55c6e261e774082bbd5521130c5c1e6"){
			
			$.post("bond/site/listjson",{"bond_site":bond_site_pid},function(datas){
				console.log(JSON.stringify(datas));
				var varList = datas.resultObj.varList
				var select = $("#sys_area_id");
				select.empty(); 
				select.append('<option value="">请选择城市</option>');
					for(var i in varList){
						var bond_site_id = varList[i].bond_site_id;
						var bond_location_name =varList[i].bond_location_name;
						var join = varList[i].join_site;
						if(bond_site_nid == bond_site_id && join == '1'){
							select.append('<option value="'+bond_site_id+'"selected>'
									+bond_location_name+'</option>');
						}else if(bond_site_nid == bond_site_id){
							select.append('<option value="'+bond_site_id+'"selected>'
									+bond_location_name+'</option>');
						}else if(join == '1'){
							select.append('<option value="'+bond_site_id+'"disabled>'
									+bond_location_name+'</option>');
						}else{
							select.append('<option value="'+bond_site_id+'">'
									+bond_location_name+'</option>');
						}  
					}
			});
	  	}
	}
	
	
    
	
	
	
});
	$(function(){
		$("#bond_site").change(function(){
			debugger
			var bond_site = $("#bond_site").find("option:selected").text();
			var bond_site_pid = $("#bond_site").val();
			var reg_type = $("#reg_type").val();
			console.log(bond_site+","+bond_site_pid);
			$.post("bond/site/listjson",{"bond_site":bond_site_pid},function(map){
				console.log(JSON.stringify(map.resultObj.varList));
				var varList = map.resultObj.varList
				var select = $("#sys_area_id");
				select.empty(); 
				select.append('<option value="">请选择城市</option>');
				if(reg_type == "a55c6e261e774082bbd5521130c5c1e6"){
					for(var i in varList){
						var bond_site_id = varList[i].bond_site_id;
						var bond_location_name =varList[i].bond_location_name;
						var join = varList[i].join_site;
						if(join == '1'){
							select.append('<option value="'+bond_site_id+'"disabled>'
									+bond_location_name+'</option>');
						}else{
							select.append('<option value="'+bond_site_id+'">'
									+bond_location_name+'</option>');
						}  
					}
				}else{
					for(var i in varList){
						var bond_site_id = varList[i].bond_site_id;
						var bond_location_name =varList[i].bond_location_name;
						select.append('<option value="'+bond_site_id+'">'+bond_location_name+'</option>');
					
					}
				}
				
			});
		});
		$("#sys_area_id").change(function(){
			var location_name = $("#sys_area_id").find("option:selected").text();
			var location_id = $("#sys_area_id").val();
			console.log("name:"+location_name+",id:"+location_id);
			console.log("地址栏："+$("#sys_area_id").val());
		});
		$("#join").click(function(){
			alert("地区唯一性：当一个地区已经有加盟方时，无法添加第二个加盟方的账户。");
		});
		
	})
</script>
			              
			              
			              
					                <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="sys_user_status_d" class="col-sm-2 control-label">审核状态:</label>
								                  <div class="col-sm-10">
								                    	<select id="sys_user_status_d" name="sys_user_status_d" class="form-control select2" >
									                    	        <option value="" >请选择</option>
									                    	        <c:forEach items="${dict.sys_user_status_d}" var="var" varStatus="vs">
									                    	        	<option value="${var.sys_dict_id}" <c:if test="${sysUser.sys_user_status_d==var.sys_dict_id}"> selected </c:if> >${var.sys_dict_name}</option>
									                    	        </c:forEach>
										                </select>
								                  </div>
								                </div>
								         </div>
					                </div>       
			              
			              
					               <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
									                <label for="sys_user_reg_date" class="col-sm-2 control-label">注册时间:</label>
									                <div class="col-sm-10">
									                   <div class="input-group date">
								                          <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
								                  		  <input name="sys_user_reg_date" id="sys_user_reg_date"  type="text" class="form-control datepicker" placeholder="注册时间" title="注册时间" value="<fmt:formatDate value="${sysUser.sys_user_reg_date}" pattern="yyyy-MM-dd HH:mm:ss" />">
								                	   </div>
								                
									                </div>
									                <!-- /.input group -->
									              </div>
								         </div>
					                </div>
			              
					                <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="sys_user_reg_type_d" class="col-sm-2 control-label">用户类型:</label>
								                  <div class="col-sm-10">
								                    	<select id="sys_user_reg_type_d" name="sys_user_reg_type_d" class="form-control select2" >
									                    	        <option value="" >请选择</option>
									                    	        <c:forEach items="${dict.sys_user_reg_type_d}" var="var" varStatus="vs">
									                    	        	<option value="${var.sys_dict_id}" <c:if test="${sysUser.sys_user_reg_type_d==var.sys_dict_id}"> selected </c:if> >${var.sys_dict_name}</option>
									                    	        </c:forEach>
										                </select>
								                  </div>
								                </div>
								         </div>
					                </div>
						               	 <div class="row">
						            		<div class="col-md-8">
									                <div class="form-group">
									                  <label for="sys_file1_addr" class="col-sm-2 control-label">用户资料:</label>
									                  <input id="sys_file_1" name="sys_file_1" type="file" class="inpt w200" onchange="companyclickfile1();"/>
									                  <div class="col-sm-10">
									                    	<img id="image1" width="200px" height="200px" src="${file.sys_file1_addr}" alt="" />
									                  </div>
									                </div>
									         </div>
						                </div>    
						                
						               	 <div class="row">
						            		<div class="col-md-8">
									                <div class="form-group">
									                  <label for="sys_file2_addr" class="col-sm-2 control-label">用户资料:</label>
									                   <input id="sys_file_2" name="sys_file_2" type="file" class="inpt w200" onchange="companyclickfile2();"/>
									                  <div class="col-sm-10">
									                    	<img id="image2" width="200px" height="200px" src="${file.sys_file2_addr}" alt="" />
									                  </div>
									                </div>
									         </div>
						                </div>
						                <script type="text/javascript">
								             function companyclickfile1(){
								       			 var r= new FileReader();
								       			 f=$(".col-md-8").find("#sys_file_1").get(0).files[0]
								       			 r.readAsDataURL(f);
								       			 r.onload=function  (e) {
								       				 $(".col-md-8").find("#image1").attr("src",this.result);
								       			 }
								       		}
								             function companyclickfile2(){
								       			 var r= new FileReader();
								       			 f=$(".col-md-8").find("#sys_file_2").get(0).files[0]
								       			 r.readAsDataURL(f);
								       			 r.onload=function  (e) {
								       				 $(".col-md-8").find("#image2").attr("src",this.result);
								       			 }
								       		}
						                
						                </script>
						                
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
				 $('#sys_user_id').require();//主键
				 $('#sys_user_name').require();//姓名
				 $('#sys_user_account').require();//帐号
				 $('#sys_user_password').require();//密码
				 $('#sys_user_login_date').require();//最后登陆时间
				 $('#sys_user_login_ip').require();//登陆ip地址
				 $('#sys_user_status_d').require();//用户状态:0_有效用户,1_无效用户
				 $('#sys_user_card').require();//身份证号
				 $('#sys_user_flag_c').require();//用户标记:0_系统用户,1_注册用户,2_双身份
				 $('#sys_user_reg_date').require();//注册时间
				 $('#sys_user_reg_type_d').require();//用户来源:0_pc端,1_iso端,2_android端
				 $('#sys_area_id').require();//所在地主键
				 $('#sys_org_id').require();//组织机构主键
				 $('#sys_user_createdate').require();//创建时间
				 $('#sys_user_updatedate').require();//更新时间
				 $('#sys_user_createuid').require();//创建人id
				 $('#sys_user_updateuid').require();//修改人id
    });
  });
function validateInputs() {
          $.validity.start();
		//$('#sys_user_id').require();//主键
		//$('#sys_user_name').require();//姓名
		//$('#sys_user_account').require();//帐号
		//$('#sys_user_password').require();//密码
		//$('#sys_user_login_date').require();//最后登陆时间
		//$('#sys_user_login_ip').require();//登陆ip地址
		//$('#sys_user_status_d').require();//用户状态:0_有效用户,1_无效用户
		//$('#sys_user_card').require();//身份证号
		//$('#sys_user_flag_c').require();//用户标记:0_系统用户,1_注册用户,2_双身份
		//$('#sys_user_reg_date').require();//注册时间
		//$('#sys_user_reg_type_d').require();//用户来源:0_pc端,1_iso端,2_android端
		//$('#sys_area_id').require();//所在地主键
		//$('#sys_org_id').require();//组织机构主键
		//$('#sys_user_createdate').require();//创建时间
		//$('#sys_user_updatedate').require();//更新时间
		//$('#sys_user_createuid').require();//创建人id
		//$('#sys_user_updateuid').require();//修改人id
	     var result = $.validity.end();
	     return result.valid;
}    
function formSubmit(){
	  var formData = new FormData($( "#sysuserDialogForm" )[0]);
	  $.ajax({
			type: "POST",
			url:$('#sysuserDialogForm').attr('action'),
			data:formData,// 你的formid
			cache: false,
			contentType: false,
			processData: false,
			async: false,
			error: function(request) {
				alert("Connection error");
			},
			success: function(data) {
				debugger
				if(data.resultCode==1){
					window.location.href='sys/login/index';
					alert("注册成功");
					
				}else{
					alert(data.resultMsg);
				}
			}
		});
}
</script>
</body>
</html>
