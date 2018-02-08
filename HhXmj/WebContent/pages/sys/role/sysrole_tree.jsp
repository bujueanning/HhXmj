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
  <!-- fancytree -->
  <link rel="stylesheet" href="plugins/fancytree-master/dist/skin-bootstrap-n/ui.fancytree.css">
  <style type="text/css">
	ul.fancytree-container {
/* 	  width: 200px; */
/* 	  height: 100px; */
	  overflow: auto;
	  position: relative;
	  border: none;
	}
  </style>
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
	        <!-- left column -->
	        <div class="col-md-6">
	        	<div class="box box-info">
			            <div class="box-header with-border">
			              <h3 class="box-title">${paneltitle}</h3>
			            </div>
			              <div class="box-body">
						            <div id="tree" class="panel-body fancytree-colorize-hover fancytree-fade-expander"></div>  
			              </div>
			              <div class="box-footer">
			              	<shiro:hasPermission name="sysRole:goadd">
			              		<button style="cursor:pointer;" title="新增" onclick="add('sys/role/goadd',400);" class="btn btn-social-icon btn-info btn-xs"><i class="fa fa-plus-square"></i></button>
			              		<button style="cursor:pointer;" title="新增根节点" onclick="addroot('sys/role/goadd',400);" class="btn btn-social-icon btn-info btn-xs"><i class="fa fa-vimeo"></i></button>
			              	</shiro:hasPermission>
			                <shiro:hasPermission name="sysRole:deltree">
								<button style="cursor:pointer;" title="删除" onclick="deltree('sys/role/deltree',800);" class="btn btn-social-icon btn-primary btn-xs"><i class="fa fa-trash"></i></button>
							</shiro:hasPermission>
			              </div>
			          </div>
	        </div>
	         <!-- right column -->
	        <div class="col-md-6">
			      <!-- SELECT2 EXAMPLE -->
			      <div class="box box-info">
			            <div class="box-header with-border">
			              <h3 class="box-title">详情</h3>
			            </div>
			            <!-- /.box-header -->
			            <!-- form start -->
			            <form class="form-horizontal" action="sys/role/savetree" name="sysroleForm" id="sysroleForm" method="post">
			              
				              	<input type="hidden" name="sys_role_id" id="sys_role_id" value="${sysRole.sys_role_id}"/>
				              	<input type="hidden" name="sys_role_pid" id="sys_role_pid" value="${sysRole.sys_role_pid}"/>
				              	<input type="hidden" name="sys_role_createuid" id="sys_role_createuid" value="${sysRole.sys_role_createuid}"/>
				              	<input type="hidden" name="sys_role_updateuid" id="sys_role_updateuid" value="${sysRole.sys_role_updateuid}"/>
						
			              <div class="box-body">
						              
						              
									            <div class="row">
								            		<div class="col-md-12">
											                <div class="form-group">
											                  <label for="sys_role_name" class="col-sm-3 control-label">角色名称:</label>
											                  <div class="col-sm-9">
											                    <input name="sys_role_name" id="sys_role_name" type="text" class="form-control"  placeholder="角色名称" title="角色名称" value="${sysRole.sys_role_name}">
											                  </div>
											                </div>
											         </div>
								                </div>
						              
									            <div class="row">
								            		<div class="col-md-12">
											                <div class="form-group">
											                  <label for="sys_role_flag" class="col-sm-3 control-label">角色标识:</label>
											                  <div class="col-sm-9">
											                    <input name="sys_role_flag" id="sys_role_flag" type="text" class="form-control"  placeholder="角色标识" title="角色标识" value="${sysRole.sys_role_flag}">
											                  </div>
											                </div>
											         </div>
								                </div>
						              
								               <div class="row">
								            		<div class="col-md-12">
											                <div class="form-group">
												                <label for="sys_role_createdate" class="col-sm-3 control-label">创建时间:</label>
												                <div class="col-sm-9">
												                   <div class="input-group date">
											                          <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
											                  		  <input name="sys_role_createdate" id="sys_role_createdate"  type="text" class="form-control datepicker" placeholder="创建时间" title="创建时间" value="${sysRole.sys_role_createdate}">
											                	   </div>
												                </div>
												                <!-- /.input group -->
												              </div>
											         </div>
								                </div>
						              
								               <div class="row">
								            		<div class="col-md-12">
											                <div class="form-group">
												                <label for="sys_role_updatedate" class="col-sm-3 control-label">更新时间:</label>
												                <div class="col-sm-9">
												                   <div class="input-group date">
											                          <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
											                  		  <input name="sys_role_updatedate" id="sys_role_updatedate"  type="text" class="form-control datepicker" placeholder="更新时间" title="更新时间" value="${sysRole.sys_role_updatedate}">
											                	   </div>
												                </div>
												                <!-- /.input group -->
												              </div>
											         </div>
								                </div>
						              
						              
						              
			              </div>
			              <!-- /.box-body -->
			              <div class="box-footer">
			              	<shiro:hasPermission name="sysRole:savetree">
			               		<button type="button" class="btn btn-info pull-right" style="margin-right: 5px;" onclick="formSubmit();">提交</button>
			               	</shiro:hasPermission>
			              </div>
			              <!-- /.box-footer -->
			            </form>
			          </div>
			      <!-- /.box -->
		  </div>   
		 </div>
		 </section>
	<!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jQueryUI/jquery-ui.min.js"></script>
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
<!-- fancytree -->
<script src="plugins/fancytree-master/dist/jquery.fancytree-all.js"></script>
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
    //fancytree
    $("#tree").fancytree({
        extensions: ["glyph", "filter","wide"],
        checkbox: false,
//         quicksearch: true,
        glyph: {
            map: {
                doc: "glyphicon glyphicon-file",
                docOpen: "glyphicon glyphicon-file",
                checkbox: "glyphicon glyphicon-unchecked",
                checkboxSelected: "glyphicon glyphicon-check",
                checkboxUnknown: "glyphicon glyphicon-share",
                dragHelper: "glyphicon glyphicon-play",
                dropMarker: "glyphicon glyphicon-arrow-right",
                error: "glyphicon glyphicon-warning-sign",
                expanderClosed: "glyphicon glyphicon-menu-right",
                expanderLazy: "glyphicon glyphicon-menu-right",  // glyphicon-plus-sign
                expanderOpen: "glyphicon glyphicon-menu-down",  // glyphicon-collapse-down
                folder: "glyphicon glyphicon-folder-close",
                folderOpen: "glyphicon glyphicon-folder-open",
                loading: "glyphicon glyphicon-refresh glyphicon-spin"
              }
         },
//         filter: {
//             autoApply: true,  // Re-apply last filter if lazy data is loaded
//             counter: true,  // Show a badge with number of matching child nodes near parent icons
//             fuzzy: false,  // Match single characters in order, e.g. 'fb' will match 'FooBar'
//             hideExpandedCounter: true,  // Hide counter badge, when parent is expanded
//             highlight: true,  // Highlight matches by wrapping inside <mark> tags
//             mode: "dimm"  // Grayout unmatched nodes (pass "hide" to remove unmatched node instead)
//          },
        selectMode: 2,
        source: {url: "sys/role/treenodeall?sys_role_pid=root"},
        wide: {
          iconWidth: "1em",     // Adjust this if @fancy-icon-width != "16px"
          iconSpacing: "0.5em", // Adjust this if @fancy-icon-spacing != "3px"
          levelOfs: "1.5em"     // Adjust this if ul padding != "16px"
        },
		activate: function(event, data) {
			 $('#sys_role_id').val(data.node.data.sys_role_id);//主键
			 $('#sys_role_pid').val(data.node.data.sys_role_pid);//父主键
			 $('#sys_role_name').val(data.node.data.sys_role_name);//角色名称
			 $('#sys_role_flag').val(data.node.data.sys_role_flag);//角色标识
			 $('#sys_role_createdate').val(data.node.data.sys_role_createdate);//创建时间
			 $('#sys_role_updatedate').val(data.node.data.sys_role_updatedate);//更新时间
			 $('#sys_role_createuid').val(data.node.data.sys_role_createuid);//创建人
			 $('#sys_role_updateuid').val(data.node.data.sys_role_updateuid);//更新人
			 				
		         	$('#sys_role_testd_d').val(data.node.data.sys_role_testd_d);//测试d:0_test0,1_test1
		         	$('#sys_role_testd_d').trigger('change');
			 
			 				
			     	$('#sys_role_testc_c').val(data.node.data.sys_role_testc_c);//测试c:0_test0,1_test1
			     	$('#sys_role_testc_c').trigger('change');
        },
        icon: function(event, data){
          // if( data.node.isFolder() ) {
          //   return "glyphicon glyphicon-book";
          // }
        },
        lazyLoad: function(event, data) {
          data.result = {url: "sys/role/treenode?sys_role_pid="+data.node.key};
        }
      });
     //validity-master
    $("form").validity(function() {
				 $('#sys_role_name').require();//角色名称
				 $('#sys_role_flag').require();//角色标识
				 $('#sys_role_createdate').require();//创建时间
				 $('#sys_role_updatedate').require();//更新时间
				 $('#sys_role_testd_d').require();//测试d:0_test0,1_test1
				 $('#sys_role_testc_c').require();//测试c:0_test0,1_test1
    });
  });
function validateInputs() {
          $.validity.start();
		//$('#sys_role_name').require();//角色名称
		//$('#sys_role_flag').require();//角色标识
		//$('#sys_role_createdate').require();//创建时间
		//$('#sys_role_updatedate').require();//更新时间
		//$('#sys_role_testd_d').require();//测试d:0_test0,1_test1
		//$('#sys_role_testc_c').require();//测试c:0_test0,1_test1
	     var result = $.validity.end();
	     return result.valid;
} 
function nodeEdit(data){
 	$("#tree").fancytree("getActiveNode").setTitle(data.title);
} 
function nodeAdd(data){
 	var node = $("#tree").fancytree("getActiveNode");
     if(node){
 	  	node.addChildren(data);
     }else{
    	$("#tree").fancytree("getRootNode").addChildren(data);
     }
}  
function nodeAddRoot(data){
    $("#tree").fancytree("getRootNode").addChildren(data);
}
function formSubmit(){
	var node = $("#tree").fancytree("getActiveNode");
	if(node){
	  window.top.loadStart();
	  $.ajax({
			type: "POST",
			url:$('#sysroleForm').attr('action'),
			data:$('#sysroleForm').serialize(),// 你的formid
			cache: false,
			async: false,
			error: function(request) {
				window.top.loadClose();
				alert("Connection error");
			},
			success: function(data) {
				$("#tree").fancytree("getActiveNode").setTitle(data.title);
			 	$("#tree").fancytree("getActiveNode").data.sys_role_id=data.sys_role_id;
			 	$("#tree").fancytree("getActiveNode").data.sys_role_pid=data.sys_role_pid;
			 	$("#tree").fancytree("getActiveNode").data.sys_role_name=data.sys_role_name;
			 	$("#tree").fancytree("getActiveNode").data.sys_role_flag=data.sys_role_flag;
			 	$("#tree").fancytree("getActiveNode").data.sys_role_createdate=data.sys_role_createdate;
			 	$("#tree").fancytree("getActiveNode").data.sys_role_updatedate=data.sys_role_updatedate;
			 	$("#tree").fancytree("getActiveNode").data.sys_role_createuid=data.sys_role_createuid;
			 	$("#tree").fancytree("getActiveNode").data.sys_role_updateuid=data.sys_role_updateuid;
			 	$("#tree").fancytree("getActiveNode").data.sys_role_testd_d=data.sys_role_testd_d;
			 	$("#tree").fancytree("getActiveNode").data.sys_role_testc_c=data.sys_role_testc_c;
				window.top.loadClose();
			}
		});
	 }else{
		 window.top.showDialog("至少选择一项");
	 }
}
function del(url,height){
    	window.top.delDialog(url,height);
}
function deltree(url,height){
	var node = $("#tree").fancytree("getActiveNode");
	if(node){
		url=url+"?sys_role_id="+node.key;
	    window.top.delTreeDialog(url,height);
	    window.top.loadClose();
	 }else{
		window.top.showDialog("至少选择一项");
	 }
	
}

function edit(url,height){
	 var node = $("#tree").fancytree("getActiveNode");
	 if(node){
	  	url=url+"?sys_role_id="+node.key;
	  	window.top.saveTreeDialog(url,height,'edit');
	 }else{
		 window.top.showDialog("选择一项");
	 }
	
} 
function add(url,height){
	 var node = $("#tree").fancytree("getActiveNode");
	 if(node){
	  	url=url+"?sys_role_pid="+node.key;
	 }else{
		url=url+"?sys_role_pid=root";
	 }
	window.top.saveTreeDialog(url,height,'add');
} 
function addroot(url,height){
	window.top.saveTreeDialog(url+"?sys_role_pid=root",height,'addroot');
} 
function nodeDel(){
	$("#tree").fancytree("getActiveNode").remove();
} 
</script>
</body>
</html>
