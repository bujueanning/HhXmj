<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
    <link href="plugins/Pagination-master/mricode.pagination.css" rel="stylesheet"/>
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="plugins/icheck-1.x/skins/all.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="plugins/select2/select2.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
    <!-- daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery 2.2.3 -->
	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="pages/sys/kj/js/IMGUP/jquery-migrate-1.2.1.min.js"></script>
	<link href="pages/sys/kj/js/IMGUP/IMGUP.css" rel="stylesheet">
	<style type="text/css">
		body{
		    background: url(../kj/img/1.jpg) no-repeat fixed;
		    /* set background tensile */
		    background-size: 100% 100%;
		    -moz-background-size: 100% 100%;
		    margin: 0;
		    padding: 0;
		    color:#000;
			}
		
	</style>
</head>
<body class="hold-transition skin-blue layout-top-nav">
<div class="wrapper">
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <form class="form-horizontal" action="sys/bond/acceptList" name="sysbondListForm" id="sysbondListForm"
                          method="post">
                        <input type="hidden" name="pageIndex" id="pageIndex" value="${bondAccept.pageIndex}"/>
                        <input type="hidden" name="pageSize" id="pageSize" value="${bondAccept.pageSize}"/>
                        <input type="hidden" name="total" id="total" value="${bondAccept.total}"/>

                        <div class="box box-info">
                            <div class="box-header with-border">
                                <h3 class="box-title">查询</h3>
                            </div>
                            <!-- /.box-header -->
                            <!-- form start -->
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="bond_company_name" class="col-sm-2 control-label">企业名称:</label>
                                    <div class="col-sm-3">
                                        <input id="bond_company_name" name="bond_company_name" type="text"
                                               class="form-control" placeholder="项目名称" value="">
                                    </div>
                                    <label for="bond_asset_number" class="col-sm-1 control-label">资产编号</label>
                                    <div class="col-sm-3">
                                        <input id="bond_asset_number" name="bond_asset_number" type="text"
                                               class="form-control" placeholder="项目编号" value="">
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="bond_accept_time" class="col-sm-2 control-label">报名时间</label>
                                    <div class="input-group date col-sm-3">
                                        <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                        <input name="bond_accept_time" id="bond_accept_time" type="text"
                                               class="form-control datepicker" placeholder="报名时间" title="报名时间"
                                               value="<fmt:formatDate value="${bond_accept_time}" pattern="yyyy-MM-dd " />">
                                    </div>
                                </div>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                <button type="button" class="btn btn-info pull-right" onclick="resetSearch();">重置
                                </button>
                                <button type="button" class="btn btn-info pull-right" onclick="formSubmit();"
                                        style="margin-right: 5px;">查询
                                </button>
                            </div>
                            <!-- /.box-footer -->
                        </div>


                        <div class="box">
                            <!-- /.box-header -->
                            <div class="box-body table-responsive no-padding">
                                
                                <div id="div_imgfile">选择图片</div>
                                <div id="div_imglook">
                                	<div style="clear:both;"></div>
                                </div>
                                <input id="btn_ImgUpStart" type="button" value="确认上传"/>
                                
                            </div>
                            
                           
                            <input id="sum" type="button" value="显示" onclick="f1();"/>
                            <!-- /.box-body -->
                            <div class="box-footer clearfix">
                                <div class="pull-left">
                                    <shiro:hasPermission name="sysGoods:goadd">
                                        <a style="cursor:pointer;" title="新增" onclick="add('sys/bond/accept/goadd',800);"
                                           class="btn btn-social-icon btn-info"><i class="fa fa-plus-square"></i></a>
                                    </shiro:hasPermission>
                                    <shiro:hasPermission name="sysGoods:delall">
                                        <a style="cursor:pointer;" title="删除"
                                           onclick="delArray('sys/bond/accept/delall',800);"
                                           class="btn btn-social-icon btn-primary"><i class="fa fa-trash"></i></a>
                                    </shiro:hasPermission>
                                    <%--<shiro:hasPermission name="sysGoods:upload">--%>
                                    <%--<a style="cursor:pointer;" title="上传" onclick="upload('sys/goods/upload',400);" class="btn btn-social-icon btn-primary"><i class="fa fa-upload"></i></a>--%>
                                    <%--</shiro:hasPermission>--%>
                                    <%--<shiro:hasPermission name="sysGoods:download">--%>
                                    <%--<a style="cursor:pointer;" title="下载" href="sys/goods/download" class="btn btn-social-icon btn-primary"><i class="fa fa-download"></i></a>--%>
                                    <%--</shiro:hasPermission>--%>
                                    <!--<a style="cursor:pointer;" title="批量提交" onclick="postObjs('sys/goods/postall',800);" class="btn btn-social-icon btn-primary"><i class="fa fa-flag-o"></i></a>-->
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
<!-- bootstrap datepicker -->
<script src="plugins/datepicker/bootstrap-datepicker.js"></script>

<script src="pages/sys/kj/js/IMGUP/IMGUP.js"></script>
<!-- 将表中的数据以插件的形式显示 -->
<script type="text/javascript">
	$(function(){
		
		 $.post("bond/imgup/listjson",{"imgup_createuid":"da8c252c6672450db9a4af267aa5e6ad"},function(data){
      	   //console.log("图片的json数据："+JSON.stringify(data));
      	   total = parseInt(data.resultObj.bondImgup.total);
      	   list = data.resultObj.varList;
      		 for(var i in list){
      		 	url = list[i].imgup_path;
        	   //console.log("共"+total+"条,编码为："+url);
        	 	num = list[i].imgup_index;
        	   imgup(url,num);
      	  	 }
      		console.log("条目数："+total);
      	    
         });
	});
	
	function imgup(url,num){
		
		//创建预览外层
        var _prevdiv = document.createElement("div");
        _prevdiv.setAttribute("class", "lookimg");
        //创建内层img对象
        var preview = document.createElement("img");
        $(_prevdiv).append(preview);
        //创建删除按钮
        var IMG_DELBTN = document.createElement("div");
        IMG_DELBTN.setAttribute("class", "lookimg_delBtn");
        IMG_DELBTN.innerHTML = "移除";
        $(_prevdiv).append(IMG_DELBTN);
        //创建进度条
        var IMG_PROGRESS = document.createElement("div");
        IMG_PROGRESS.setAttribute("class", "lookimg_progress");
        $(IMG_PROGRESS).append(document.createElement("div"));
        $(_prevdiv).append(IMG_PROGRESS);
        //记录此对象对应编号
        _prevdiv.setAttribute("num",num);
        //对象注入界面
        $("#div_imglook").children("div:last").before(_prevdiv);
		
        //预览功能 start
        preview.setAttribute("src", url);//读取加载，将图片编码绑定到元素
    
        //预览功能 end
	}
</script>
<script type="text/javascript">
function f1(){
	var len = $(".lookimg").length;
	alert(len);
}
</script>
<script type="text/javascript">
function del(){
	console.log("先调用删除");
	$.post("bond/imgup/listjson",{"imgup_createuid":"da8c252c6672450db9a4af267aa5e6ad"},function(data){
		var list = data.resultObj.varList;
		for(var i in list){
			var num = list[i].imgup_index;
			var nums = one();
			console.log("最后数组中的数据:"+nums);
			Array.prototype.contains = function(obj) {  
		    var i = this.length;  
		    while (i--) {  
		        if (this[i] == obj) {  
		         return true;  
		        }  
		    }  
	    	return false;  
		}  		
			if(!nums.contains(num)){
				console.log("将"+num+"删除");
				$("bond/imgup/del",{"imgup_index":num},function(){});
			}
		}
	});
}
</script>
<script type="text/javascript">
function one(){
		debugger
		var nums = new Array();
        var obj = $(".lookimg");
		for(var i in obj){
		var num = $(".lookimg:eq("+i+")").attr("num");
			if(num != null){
				nums.push(num);
			}
		}
	return nums;
}
</script>
 <!-- 
 <script>
//刷新页面实时显示数据
setTimeout(function(){
    history.go(0);
},600000);
    $(function () {
        //Date picker
        $('.datepicker').datepicker({
            format: 'yyyy-mm-dd',
            autoclose: true
        });
        //window.top.loadClose();
        //Initialize Select2 Elements
        $(".select2").select2();
        //Flat red color scheme for iCheck
        $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
            checkboxClass: 'icheckbox_flat-green',
            radioClass: 'iradio_flat-green'
        });
        $('#checkAll').on('ifChecked', function (event) {
            $('input#sysBondIds').iCheck('check');
        });
        $('#checkAll').on('ifUnchecked', function (event) {
            $('input#sysBondIds').iCheck('uncheck');
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
            $("#sysbondListForm").submit();
            console.log("请问data是什么："+data);
            console.log("请问event是什么："+event);
            console.log("在这，修改了当前页，pageIndex:"+$("#pageIndex").val());
        });
        $("#page").on("pageSizeChanged", function (event, data) {
            window.top.loadStart();
            $("#pageSize").val(data.pageSize);
            $("#sysbondListForm").submit();
        });
    });
    function del(url, height) {
        window.top.delDialog(url, height);
    }
    function delArray(url, height) {
        var bond_accept_ids = new Array();
        $("#bond_accept_ids:checked").each(function () {
        	bond_accept_ids.push($(this).val());
        });
        window.top.delArrayDialog(url, bond_accept_ids);
    }
    function postObjs(url, height) {
        var objs = new Array();
        $("#sysBondsIds:checked").each(function () {
            var obj = {};
            obj.sysBonds_id = $(this).val();
            objs.push(obj);
        });
        window.top.postObjsDialog(url, objs);
    }
    function upload(url, height) {
        window.top.uploadDialog(url, height);
    }
    function edit(url, height) {
        window.top.editDialog(url, height);
    }
    function add(url, height) {
        window.top.editDialog(url, height);
    }
    function check(url,height){
        window.top.checkDialog(url,height);
    }
    function formSubmit() {
        $("#sysbondListForm").submit();
    }
    function resetSearch() {
        $("#conditionValue").val("");
        //alert($("#conditionName").val()); value 值
        //alert($('#conditionName  option:selected').text()); text 值
        $("#conditionName").val("").trigger("change");
    }
</script>
 	-->
</body>
</html>
