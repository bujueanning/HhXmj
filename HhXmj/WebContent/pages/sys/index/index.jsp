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
  <title>后台管理</title>
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
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <!-- iCheck -->
  <!-- 
  <link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
   -->
  <!-- Morris chart -->
  <link rel="stylesheet" href="plugins/morris/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- fakeLoader -->
  <link rel="stylesheet" href="plugins/fakeLoadermaster/fakeLoader.css">
  <!-- jquery-confirm -->
  <link rel="stylesheet" href="plugins/jqueryConfirmv2.5.0/dist/jquery-confirm.min.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini" onload="bodyFinish()">
<div class="fakeloader"></div>
<div id="indexWrapper" class="wrapper" style="display:none;">
  <%@ include  file="header.jsp"%>
  <%@ include  file="leftaside.jsp"%>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <%@ include  file="contentheader.jsp"%>
<%--   	<%@ include  file="maincontent.jsp"%> --%>
  	<%@ include  file="maincontentiframe.jsp"%>
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.3.5
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights
    reserved.
  </footer>

  <%@ include  file="controlsidebar.jsp"%>
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jQueryUI/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- fakeLoader -->
<script src="plugins/fakeLoadermaster/fakeLoader.js"></script>
<!-- Morris.js charts -->
<script src="//cdn.bootcss.com/raphael/2.2.0/raphael-min.js"></script>
<script src="plugins/morris/morris.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="plugins/knob/jquery.knob.js"></script>
<!-- daterangepicker -->
<script src="plugins/daterangepicker/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- jquery-confirm -->
<script src="plugins/jqueryConfirmv2.5.0/dist/jquery-confirm.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<script type="text/javascript">
//判断是否为登录页
function onIFrameLoaded(iframe) {
    var hrefstr = iframe.contentWindow.location.href;
    if(hrefstr.indexOf("login.jsp") > 0){
    	//时登录页就父页面跳转
    	window.top.location.href=hrefstr;
    }
}

//加载遮罩层
function loadStart(){
// 	$(".fakeloader").fadeIn();
}
function loadClose(){
// 	$(".fakeloader").fadeOut();
}
function bodyFinish(){
	$(".fakeloader").fadeOut();
	$("#indexWrapper").removeAttr("style");
}
function confirmDialog(url,confirmText,data){
	$.confirm({
		content: confirmText,
        confirmButton: true,
        cancelButton: true,
        confirmButton: '确认',
        cancelButton: '取消',
        confirmButtonClass: 'btn-info',
        cancelButtonClass: 'btn-danger',
        animation: 'zoom',
//         columnClass: 'col-md-12',
        closeIcon: true,
        closeIconClass: 'fa fa-close', // or 'glyphicon glyphicon-remove'
        title: false, // hides the title.
        backgroundDismiss: false,
        cancel: function(){
            //$.alert('canceled');
        },
        confirm: function(){
        	loadStart();
        	$.ajax({
        		type: "POST",
        		url:url,
        		data:data,// 你的formid
        		cache: false,
        		async: false,
        		error: function(request) {
        			loadClose();
        			return false;
        		},
        		success: function(data) {
        			loadClose();
        			return true;
        		}
        	});
        }
    });
}
function openDialog(url,height,funName){
	$.confirm({
		content: "<iframe name='dialogFrame' id='dialogFrame' style='height: "+height+"px;width: 100%;'  src='"+url+"' frameborder='0' ></iframe>",
        confirmButton: true,
        cancelButton: true,
        confirmButton: '确认',
        cancelButton: '取消',
        confirmButtonClass: 'btn-info',
        cancelButtonClass: 'btn-danger',
        animation: 'zoom',
//         columnClass: 'col-md-12',
        closeIcon: true,
        closeIconClass: 'fa fa-close', // or 'glyphicon glyphicon-remove'
        title: false, // hides the title.
        backgroundDismiss: false,
        cancel: function(){
            //$.alert('canceled');
        },
        confirm: function(){
        	self.dialogFrame.callback(funName);
        }
    });
}
function checkDialog(url,height){
    $.confirm({
        content: "<iframe name='dialogFrame' id='dialogFrame' style='height: "+height+"px;width: 100%;'  src='"+url+"' frameborder='0' ></iframe>",
        confirmButton: true,
        cancelButton: true,
        confirmButton: '确认',
        cancelButton: '取消',
        confirmButtonClass: 'btn-info',
        cancelButtonClass: 'btn-danger',
        animation: 'zoom',
         columnClass: 'col-md-6',
        closeIcon: true,
        closeIconClass: 'fa fa-close', // or 'glyphicon glyphicon-remove'
        title: false, // hides the title.
        backgroundDismiss: false,
        cancel: function(){
            //$.alert('canceled');
        }
    });
}
function uploadDialog(url,height){
	
	$.confirm({
		content: "<iframe name='dialogFrame' id='dialogFrame' style='height: "+height+"px;width: 100%;'  src='pages/sys/index/upload.jsp?url="+url+"' frameborder='0' ></iframe>",
        confirmButton: true,
        cancelButton: true,
        confirmButton: '确认',
        confirmButtonClass: 'btn-info',
        cancelButtonClass: 'btn-danger',
        animation: 'zoom',
        columnClass: 'col-md-12',
        closeIcon: true,
        closeIconClass: 'fa fa-close', // or 'glyphicon glyphicon-remove'
        title: false, // hides the title.
        backgroundDismiss: false,
        cancel: function(){
            //$.alert('canceled');
        },
        confirm: function(){
        	if(self.dialogFrame.validateInputs()){
            	return true;
        	}else{
        		return false;
        	}
        }
    });
}
function editDialog(url,height){
	$.confirm({
		content: "<iframe name='dialogFrame' id='dialogFrame' style='height: "+height+"px;width: 100%;'  src='"+url+"' frameborder='0' ></iframe>",
        confirmButton: true,
        cancelButton: true,
        confirmButton: '确认',
        cancelButton: '取消',
        confirmButtonClass: 'btn-info',
        cancelButtonClass: 'btn-danger',
        animation: 'zoom',
        columnClass: 'col-md-12',
        closeIcon: true,
        closeIconClass: 'fa fa-close', // or 'glyphicon glyphicon-remove'
        title: false, // hides the title.
        backgroundDismiss: false,
        cancel: function(){
            //$.alert('canceled');
        },
        confirm: function(){
        	if(self.dialogFrame.validateInputs()){
        		loadStart();
        		self.dialogFrame.formSubmit();
        		if(self.indexFrame.listFrame){
        			self.indexFrame.listFrame.formSubmit();
        		}else{
        			self.indexFrame.formSubmit();
        		}
            	return true;
        	}else{
        		return false;
        	}
        }
    });
}
function saveTreeDialog(url,height,flag){
	$.confirm({
		content: "<iframe name='treeDialogFrame' id='treeDialogFrame' style='height: "+height+"px;width: 100%;'  src='"+url+"' frameborder='0' ></iframe>",
        confirmButton: true,
        cancelButton: true,
        confirmButton: '确认',
        cancelButton: '取消',
        confirmButtonClass: 'btn-info',
        cancelButtonClass: 'btn-danger',
        animation: 'zoom',
        columnClass: 'col-md-12',
        closeIcon: true,
        closeIconClass: 'fa fa-close', // or 'glyphicon glyphicon-remove'
        title: false, // hides the title.
        backgroundDismiss: false,
        cancel: function(){
            //$.alert('canceled');
        },
        confirm: function(){
        	if(self.treeDialogFrame.validateInputs()){
        		loadStart();
        		self.treeDialogFrame.formSubmit(flag);
            	return true;
        	}else{
        		return false;
        	}
        }
    });
}
function delTreeDialog(url,height){
	$.confirm({
		content: "确认删除吗?",
        confirmButton: true,
        cancelButton: true,
        confirmButton: '确认',
        cancelButton: '取消',
        confirmButtonClass: 'btn-warning',
        cancelButtonClass: 'btn-success',
        animation: 'zoom',
        closeIcon: true,
        closeIconClass: 'fa fa-close', // or 'glyphicon glyphicon-remove'
        title: false, // hides the title.
        backgroundDismiss: false,
        cancel: function(){
            //$.alert('canceled');
        },
        confirm: function(){
			loadStart();
			$.post(url,{},function (text, status) {
				window.top.indexFrame.nodeDel();
			});
        }
    });
}
function delDialog(url,height){
	$.confirm({
		content: "确认删除吗?",
        confirmButton: true,
        cancelButton: true,
        confirmButton: '确认',
        cancelButton: '取消',
        confirmButtonClass: 'btn-warning',
        cancelButtonClass: 'btn-success',
        animation: 'zoom',
        closeIcon: true,
        closeIconClass: 'fa fa-close', // or 'glyphicon glyphicon-remove'
        title: false, // hides the title.
        backgroundDismiss: false,
        cancel: function(){
            //$.alert('canceled');
        },
        confirm: function(){
			loadStart();
			$.post(url,{},function (text, status) {
				if(window.top.indexFrame.listFrame){
					window.top.indexFrame.listFrame.formSubmit();
        		}else{
        			window.top.indexFrame.formSubmit();
        		}
			});
        }
    });
}
function startDialog(url,height){
	$.confirm({
		content: "确认启动吗?",
        confirmButton: true,
        cancelButton: true,
        confirmButton: '确认',
        cancelButton: '取消',
        confirmButtonClass: 'btn-warning',
        cancelButtonClass: 'btn-success',
        animation: 'zoom',
        closeIcon: true,
        closeIconClass: 'fa fa-close', // or 'glyphicon glyphicon-remove'
        title: false, // hides the title.
        backgroundDismiss: false,
        cancel: function(){
            //$.alert('canceled');
        },
        confirm: function(){
			loadStart();
			$.post(url,{},function (text, status) {
				if(window.top.indexFrame.listFrame){
					window.top.indexFrame.listFrame.formSubmit();
        		}else{
        			window.top.indexFrame.formSubmit();
        		}
			});
        }
    });
}
function postObjsDialog(url,objs){
	if(objs.length==0){
		showDialog("至少选择一项");
	}else{
		$.confirm({
			content: "确认提交吗?",
	        confirmButton: true,
	        cancelButton: true,
	        confirmButton: '确认',
	        cancelButton: '取消',
	        confirmButtonClass: 'btn-warning',
	        cancelButtonClass: 'btn-success',
	        animation: 'zoom',
	        closeIcon: true,
	        closeIconClass: 'fa fa-close', // or 'glyphicon glyphicon-remove'
	        title: false, // hides the title.
	        backgroundDismiss: false,
	        cancel: function(){
	            //$.alert('canceled');
	        },
	        confirm: function(){
				loadStart();
				$.ajax({
					type: "POST",
					url: url,
				   	data: JSON.stringify(objs),//将对象序列化成JSON字符串
				   	dataType:"json",
				   	contentType : 'application/json;charset=utf-8', //设置请求头信息
					success: function(data){
						if(window.top.indexFrame.listFrame){
							window.top.indexFrame.listFrame.formSubmit();
		        		}else{
		        			window.top.indexFrame.formSubmit();
		        		}
					},
					error: function(res){
						window.top.loadClose();
						alert('error');
					}
				});
	        }
	    });
	}
}
function showDialog(content){
	$.alert({
		content: content,
        confirmButton: true,
        cancelButton: false,
        confirmButton: '确认',
        cancelButton: '取消',
        confirmButtonClass: 'btn-warning',
        cancelButtonClass: 'btn-success',
        animation: 'zoom',
        closeIcon: true,
        closeIconClass: 'fa fa-close', // or 'glyphicon glyphicon-remove'
        title: false, // hides the title.
        backgroundDismiss: false
    });
}
function delArrayDialog(url,objs){
	if(objs.length==0){
		showDialog("至少选择一项");
	}else{
		$.confirm({
			content: "确认提交吗?",
	        confirmButton: true,
	        cancelButton: true,
	        confirmButton: '确认',
	        cancelButton: '取消',
	        confirmButtonClass: 'btn-warning',
	        cancelButtonClass: 'btn-success',
	        animation: 'zoom',
	        closeIcon: true,
	        closeIconClass: 'fa fa-close', // or 'glyphicon glyphicon-remove'
	        title: false, // hides the title.
	        backgroundDismiss: false,
	        cancel: function(){
	            //$.alert('canceled');
	        },
	        confirm: function(){
				loadStart();
				$.ajax({
					type: "POST",
					url: url,
				   	data: {"ids":objs},
				   	dataType:"json",
					success: function(data){
						if(window.top.indexFrame.listFrame){
							window.top.indexFrame.listFrame.formSubmit();
		        		}else{
		        			window.top.indexFrame.formSubmit();
		        		}
					},
					error: function(res){
						window.top.loadClose();
						alert('error');
					}
				});
	        }
	    });
	}
}
</script>
</body>
</html>
