<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<!--   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css"> -->
<link href="//cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
  <!-- Ionicons -->
<!--   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"> -->
<link href="//cdn.bootcss.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet">
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
	        <div class="col-md-4">
	        	<div class="box box-info">
			            <div class="box-header with-border">
			              <h3 class="box-title">树</h3>
			            </div>
			              <div class="box-body">
						            <div id="tree" class="panel-body fancytree-colorize-hover fancytree-fade-expander"></div>  
			              </div>
			          </div>
	        </div>
	         <!-- right column -->
	        <div class="col-md-4">
			      <div class="box box-info">
			            <div class="box-header with-border">
			              <h3 class="box-title">菜单树</h3>
			            </div>
			              <div class="box-body">
						            <div id="menutree" class="panel-body fancytree-colorize-hover fancytree-fade-expander"></div>  
			              </div>
			              <div class="box-footer">
			                <a style="cursor:pointer;" title="更新" onclick="saverolemenu();" class="btn btn-social-icon btn-info btn-xs"><i class="fa fa-exchange"></i></a>
			              </div>
			       </div>
	        	</div>
	        	 <!-- right column -->
	        <div class="col-md-4">
			      <div class="box box-info">
			            <div class="box-header with-border">
			              <h3 class="box-title">权限树</h3>
			            </div>
			              <div class="box-body">
						            <div id="permtree" class="panel-body fancytree-colorize-hover fancytree-fade-expander"></div>  
			              </div>
			              <div class="box-footer">
			                <a style="cursor:pointer;" title="更新" onclick="saveroleperm();" class="btn btn-social-icon btn-info btn-xs"><i class="fa fa-exchange"></i></a>
			              </div>
			       </div>
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
        source: {url: "sys/role/treenode?sys_role_pid=root"},
        wide: {
          iconWidth: "1em",     // Adjust this if @fancy-icon-width != "16px"
          iconSpacing: "0.5em", // Adjust this if @fancy-icon-spacing != "3px"
          levelOfs: "1.5em"     // Adjust this if ul padding != "16px"
        },
		activate: function(event, data) {
			 $.ajax({
					type: "POST",
					url: 'sys/role/getmenupermtree',
				   	data: {sys_role_id:data.node.data.sys_role_id},
				   	dataType:"json",
					success: function(data){
						$("#permtree").fancytree("getTree").visit(function(node){
					        node.setSelected(false);
					      });
						$("#menutree").fancytree("getTree").visit(function(node){
					        node.setSelected(false);
					      });
						$.each(data.permtree, function(index,item){ 
							var permnode = $("#permtree").fancytree("getTree").getNodeByKey(item.sys_perm_id).setSelected(true);
					    }); 
						$.each(data.menutree, function(index,item){
							var menunode = $("#menutree").fancytree("getTree").getNodeByKey(item.sys_menu_id).setSelected(true);
					    }); 
					},
					error: function(res){
						alert(res);
					}
				});

			
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
  //fancytree
    $("#permtree").fancytree({
        extensions: ["glyph", "filter","wide"],
        checkbox: true,
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
        selectMode: 3,
        source: {url: "sys/perm/treenodeall?sys_perm_pid=root"},
        loadChildren: function(event, ctx) {
            ctx.node.fixSelection3AfterClick();
          },
        wide: {
          iconWidth: "1em",     // Adjust this if @fancy-icon-width != "16px"
          iconSpacing: "0.5em", // Adjust this if @fancy-icon-spacing != "3px"
          levelOfs: "1.5em"     // Adjust this if ul padding != "16px"
        },
		activate: function(event, data) {
			
        },
        icon: function(event, data){
          // if( data.node.isFolder() ) {
          //   return "glyphicon glyphicon-book";
          // }
        },
        lazyLoad: function(event, data) {
            data.result = {url: "sys/perm/treenode?sys_perm_pid="+data.node.key};
          }
      });
  //fancytree
    $("#menutree").fancytree({
        extensions: ["glyph", "filter","wide"],
        checkbox: true,
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
        selectMode: 3,
        source: {url: "sys/menu/treenodeall?sys_menu_pid=root"},
        loadChildren: function(event, ctx) {
            ctx.node.fixSelection3AfterClick();
          },
        wide: {
          iconWidth: "1em",     // Adjust this if @fancy-icon-width != "16px"
          iconSpacing: "0.5em", // Adjust this if @fancy-icon-spacing != "3px"
          levelOfs: "1.5em"     // Adjust this if ul padding != "16px"
        },
		activate: function(event, data) {
        },
        icon: function(event, data){
          // if( data.node.isFolder() ) {
          //   return "glyphicon glyphicon-book";
          // }
        },
        lazyLoad: function(event, data) {
            data.result = {url: "sys/menu/treenode?sys_menu_pid="+data.node.key};
         }
      });
     //validity-master
    $("form").validity(function() {
				 $('#sys_role_pid').require();//父主键
				 $('#sys_role_name').require();//角色名称
    });
  });
function validateInputs() {
          $.validity.start();
		//$('#sysRolePid').require();//父主键
		//$('#sysRoleName').require();//角色名称
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
function formSubmit(){
	var node = $("#tree").fancytree("getActiveNode");
	if(node){
	  window.parent.loadStart();
	  $.ajax({
			type: "POST",
			url:$('#sysroleForm').attr('action'),
			data:$('#sysroleForm').serialize(),// 你的formid
			cache: false,
			async: false,
			error: function(request) {
				window.parent.loadClose();
				alert("Connection error");
			},
			success: function(data) {
				window.parent.loadClose();
			}
		});
	 }else{
		 window.parent.showDialog("至少选择一项");
	 }
}
function del(url,height){
    	window.parent.delDialog(url,height);
}
function deltree(url,height){
	var node = $("#tree").fancytree("getActiveNode");
	if(node){
		url=url+"?sysRolePid="+node.key+"&sysRoleId="+node.key;
	    window.parent.delTreeDialog(url,height);
	 }else{
		window.parent.showDialog("至少选择一项");
	 }
	
}
function saveroleperm(){
	var node = $("#tree").fancytree("getActiveNode");
	if(node){
		window.parent.loadStart();
		var rolepermList = [];
		$.each($("#permtree").fancytree("getTree").getPartselNodes(false), function(i, value) {
		    var roleperm = {};
		    if(value.selected&&value.partsel){
		    	roleperm.sys_role_perm_type = "selected";
		    }else{
		    	roleperm.sys_role_perm_type = "partsel";
		    }
		    roleperm.sys_perm_id=value.key;
		    rolepermList.push(roleperm);
		});
		
		  $.ajax({
				type: "POST",
				url:'sys/role/saveroleperm?sys_role_id='+node.key,
				dataType:"json",      
				contentType : 'application/json;charset=utf-8', //设置请求头信息
	            data:JSON.stringify(rolepermList), 
				cache: false,
				async: false,
				error: function(data) {
					window.parent.loadClose();
					alert("Connection error");
				},
				success: function(data) {
					window.parent.loadClose();
				}
			});
	 }else{
		window.parent.showDialog("至少选择一项");
	 }
}
function saverolemenu(){
	var node = $("#tree").fancytree("getActiveNode");
	if(node){
		window.parent.loadStart();
		var rolemenuList = [];
		$.each($("#menutree").fancytree("getTree").getPartselNodes(false), function(i, value) {
		    var rolemenu = {};
		    if(value.selected&&value.partsel){
		    	rolemenu.sys_role_menu_type = "selected";
		    }else{
		    	rolemenu.sys_role_menu_type = "partsel";
		    }
		    rolemenu.sys_menu_id=value.key;
		    rolemenuList.push(rolemenu);
		});
		  $.ajax({
				type: "POST",
				url:'sys/role/saverolemenu?sys_role_id='+node.key,
				dataType:"json", 
				contentType : 'application/json;charset=utf-8', //设置请求头信息
	            data:JSON.stringify(rolemenuList), 
				cache: false,
				async: false,
				error: function(data) {
					window.parent.loadClose();
					alert("Connection error");
				},
				success: function(data) {
					window.parent.loadClose();
				}
			});
	 }else{
		window.parent.showDialog("至少选择一项");
	 }
}
function edit(url,height){
	 var node = $("#tree").fancytree("getActiveNode");
	 if(node){
	  	url=url+"?sysRoleId="+node.key;
	  	window.parent.saveTreeDialog(url,height,'edit');
	 }else{
		 window.parent.showDialog("选择一项");
	 }
	
} 
function add(url,height){
	 var node = $("#tree").fancytree("getActiveNode");
	 if(node){
	  	url=url+"?sys_role_pid="+node.key;
	 }else{
		url=url+"?sys_role_pid=root";
	 }
	window.parent.saveTreeDialog(url,height,'add');
}
function nodeDel(){
	$("#tree").fancytree("getActiveNode").remove();
}
</script>
</body>
</html>
