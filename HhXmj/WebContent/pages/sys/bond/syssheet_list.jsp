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
</head>
<body class="hold-transition skin-blue layout-top-nav">
<div class="wrapper">
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <form class="form-horizontal" action="sys/bond/sheetList" name="sysbondListForm" id="sysbondListForm"
                          method="post">
                        <input type="hidden" name="pageIndex" id="pageIndex" value="${bondSheet.pageIndex}"/>
                        <input type="hidden" name="pageSize" id="pageSize" value="${bondSheet.pageSize}"/>
                        <input type="hidden" name="total" id="total" value="${bondSheet.total}"/>

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
                                    <label for="bond_sheet_time" class="col-sm-2 control-label">接单时间</label>
                                    <div class="input-group date col-sm-3">
                                        <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                        <input name="bond_sheet_time" id="bond_sheet_time" type="text"
                                               class="form-control datepicker" placeholder="接单时间" title="接单时间"
                                               value="<fmt:formatDate value="${bond_sheet_time}" pattern="yyyy-MM-dd HH:mm:ss" />">
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
                                <table class="table table-hover">
                                    <tr>
                                        <th style="word-break: keep-all;white-space:nowrap;width: 40px;"><input
                                                name='checkAll' id='checkAll' type="checkbox" class="flat-red"></th>
                                        <th style="word-break: keep-all;white-space:nowrap;width: 40px;">项目名称</th>
                                        <th style="word-break: keep-all;white-space:nowrap;width: 80px;">项目编号</th>
                                        <th style="word-break: keep-all;white-space:nowrap;width: 80px;">接单时间</th>
                                        <th style="word-break: keep-all;white-space:nowrap;width: 80px;">接单处置方</th>
                                        <th style="word-break: keep-all;white-space:nowrap;width: 40px;">处置方性质</th>
                                        <th style="word-break: keep-all;white-space:nowrap;width: 80px;">联系人</th>
                                        <th style="word-break: keep-all;white-space:nowrap;width: 80px;">联系方式</th>
                                        <th style="word-break: keep-all;white-space:nowrap;width: 80px;">订单状态</th>
                                        <th style="width: 100px;">操 作</th>
                                    </tr>
            <c:choose>
            <c:when test="${not empty varList}">
            <c:forEach items="${varList}" var="var" varStatus="vs">
            	<tr>
            		 <td>
                         <input name='bond_sheet_ids' id='bond_sheet_ids'  type="checkbox" class="flat-red"
                            value="${var.bond_sheet_id}">
                     </td>
					 <td>${var.bond_company_name}</a></td>
					 <td>${var.bond_asset_number}</td>
					 <td> <fmt:formatDate value="${var.bond_sheet_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					 <td>${var.bond_accept_name}</td>
					 <td>${var.bond_accept_property}</td>
					 <td>${var.bond_deal_name}</td>
					 <td>${var.bond_deal_phone}</td>
					 <c:if  test="${var.bond_unable==0}"><td>待签约</td></c:if>
					 <c:if  test="${var.bond_unable==1}"><td style="color:red;">等待审核</td></c:if>
					 <c:if  test="${var.bond_unable==2}"><td>已签约</td></c:if>
					 <td>
                                                       
                                                        <shiro:hasPermission name="sysGoods:goedit">
                                                            <a style="cursor:pointer;" title="编辑"
                                                               onclick="edit('sys/bond/gosheet?bond_sheet_id='+'${var.bond_sheet_id}',800);"
                                                               class="btn btn-social-icon btn-info btn-xs"><i
                                                                    class="fa fa-edit"></i></a>
                                                        </shiro:hasPermission>
                                                        <shiro:hasPermission name="sysGoods:del">
                                                            <a style="cursor:pointer;" title="删除"
                                                               onclick="del('sys/bond/godel?bond_sheet_id='+'${var.bond_sheet_id}',800);"
                                                               class="btn btn-social-icon btn-primary btn-xs"><i
                                                                    class="fa fa-trash"></i></a>
                                                        </shiro:hasPermission>
                                                    </td>
                </tr>
            
            
            </c:forEach>
            </c:when>
            <c:otherwise>
               <tr class="main_info">
                   <td colspan="100" class="center">没有相关数据</td>
               </tr>
           </c:otherwise>
          </c:choose>
                                </table>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer clearfix">
                                <div class="pull-left">
                                    <shiro:hasPermission name="sysGoods:goadd">
                                        <a style="cursor:pointer;" title="新增" onclick="add('sys/bond/sheet/goadd',800);"
                                           class="btn btn-social-icon btn-info"><i class="fa fa-plus-square"></i></a>
                                    </shiro:hasPermission>
                                    <shiro:hasPermission name="sysGoods:delall">
                                        <a style="cursor:pointer;" title="删除"
                                           onclick="delArray('sys/bond/sheet/delall',800);"
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
<!-- bootstrap datepicker -->
<script src="plugins/datepicker/bootstrap-datepicker.js"></script>

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
        window.top.loadClose();
        //Initialize Select2 Elements
        $(".select2").select2();
        //Flat red color scheme for iCheck
        $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
            checkboxClass: 'icheckbox_flat-green',
            radioClass: 'iradio_flat-green'
        });

        $('#checkAll').on('ifChecked', function (event) {
            $('input[name="bond_sheet_ids"]').iCheck('check');
        });
        $('#checkAll').on('ifUnchecked', function (event) {
            $('input[name="bond_sheet_ids"]').iCheck('uncheck');
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
        var bond_sheet_ids = new Array();
        $("#bond_sheet_ids:checked").each(function () {
        	bond_sheet_ids.push($(this).val());
        });
        window.top.delArrayDialog(url, bond_sheet_ids);
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
</body>
</html>
