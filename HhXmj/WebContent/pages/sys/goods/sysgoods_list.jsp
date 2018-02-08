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
                    <form class="form-horizontal" action="sys/goods/list" name="sysgoodsListForm" id="sysgoodsListForm"
                          method="post">
                        <input type="hidden" name="pageIndex" id="pageIndex" value="${auctionAssets.pageIndex}"/>
                        <input type="hidden" name="pageSize" id="pageSize" value="${auctionAssets.pageSize}"/>
                        <input type="hidden" name="total" id="total" value="${auctionAssets.total}"/>

                        <div class="box box-info">
                            <div class="box-header with-border">
                                <h3 class="box-title">查询</h3>
                            </div>
                            <!-- /.box-header -->
                            <!-- form start -->
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="auction_project_name" class="col-sm-2 control-label">项目名称:</label>
                                    <div class="col-sm-3">
                                        <input id="auction_project_name" name="auction_project_name" type="text"
                                               class="form-control" placeholder="项目名称" value="">
                                    </div>
                                    <label for="auction_project_number" class="col-sm-1 control-label">项目编号</label>
                                    <div class="col-sm-3">
                                        <input id="auction_project_number" name="auction_project_number" type="text"
                                               class="form-control" placeholder="项目编号" value="">
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="auction_verify" class="col-sm-2 control-label">状态:</label>
                                    <div class="col-sm-3">
                                        <select id="auction_verify" name="auction_verify" class="form-control select2">
                                            <option value="">请选择</option>
                                            <c:forEach items="${dictList}" var="varMap" varStatus="vs">
                                                <c:if test="${varMap.dict_assets_pid == 'auction_verify'}">
                                                    <option value="${varMap.dict_assets_key}">
                                                            ${varMap.dict_assets_name}
                                                    </option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <label for="auction_assets_createtime" class="col-sm-1 control-label">发布时间</label>
                                    <div class="input-group date col-sm-3">
                                        <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                        <input name="auction_assets_createtime" id="auction_assets_createtime" type="text"
                                               class="form-control datepicker" placeholder="挂牌开始时间" title="挂牌开始时间"
                                               value="<fmt:formatDate value="${auction_assets_createtime}" pattern="yyyy-MM-dd HH:mm:ss" />">
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
                                        <th style="word-break: keep-all;white-space:nowrap;width: 80px;">产品类</th>
                                        <th style="word-break: keep-all;white-space:nowrap;width: 80px;">分类</th>
                                        <th style="word-break: keep-all;white-space:nowrap;width: 40px;">保证金</th>
                                        <th style="word-break: keep-all;white-space:nowrap;width: 80px;">所在地</th>
                                        <th style="word-break: keep-all;white-space:nowrap;width: 80px;">起拍价</th>
                                        <th style="word-break: keep-all;white-space:nowrap;width: 80px;">挂牌起始时间</th>
                                        <th style="word-break: keep-all;white-space:nowrap;width: 80px;">挂牌结束时间</th>
                                        <th style="word-break: keep-all;white-space:nowrap;width: 100px;">发布时间</th>
                                        <th style="word-break: keep-all;white-space:nowrap;width: 80px;">是否审核</th>
                                        <th style="width: 100px;">操 作</th>
                                    </tr>
                                    <c:choose>
                                        <c:when test="${not empty varList}">
                                            <c:forEach items="${varList}" var="var" varStatus="vs">
                                                <tr>
                                                    <td>
                                                        <input name='auction_assets_ids' id='auction_assets_ids'
                                                               type="checkbox" class="flat-red"
                                                               value="${var.auction_assets_id}">
                                                    </td>
                                                    <td>${var.auction_project_name}</td>
                                                    <td>${var.auction_project_number}</td>
                                                    <td>${var.auction_product_solutions1}</td>
                                                    <td>${var.auction_classify1}</td>
                                                    <td>${var.auction_bail}</td>
                                                    <c:forEach items="${siteList }" var="site" varStatus="vs"> 
														<c:if test="${site.bond_site_id == var.auction_location}">
															<td>${site.bond_location_name }</td>
														</c:if>
													 </c:forEach>
                                                    <td>${var.auction_starting_price}</td>
                                                    <td><fmt:formatDate value="${var.auction_listing_start_time}"
                                                                        pattern="yyyy-MM-dd"/></td>
                                                    <td><fmt:formatDate value="${var.auction_listing_end_time}"
                                                                        pattern="yyyy-MM-dd"/></td>
                                                    <td><fmt:formatDate value="${var.auction_assets_createtime}"
                                                                        pattern="yyyy-MM-dd"/></td>
                                                    <td>${var.auction_verify1}</td>
                                                    <td>
                                                        <%--<shiro:hasPermission name="sysGoods:check">--%>
                                                            <a style="cursor:pointer;" title="查看拍卖情况" onclick="check('sys/goods/auPrice?auction_assets_id='+'${var.auction_assets_id}',600);"
                                                                class="btn btn-social-icon btn-info btn-xs">
                                                                <i class="fa fa-asterisk"></i>
                                                            </a>
                                                        <%--</shiro:hasPermission>--%>
                                                        <shiro:hasPermission name="sysGoods:goedit">
                                                            <a style="cursor:pointer;" title="编辑"
                                                               onclick="edit('sys/goods/goedit?auction_assets_id='+'${var.auction_assets_id}',800);"
                                                               class="btn btn-social-icon btn-info btn-xs"><i
                                                                    class="fa fa-edit"></i></a>
                                                        </shiro:hasPermission>
                                                        <shiro:hasPermission name="sysGoods:del">
                                                            <a style="cursor:pointer;" title="删除"
                                                               onclick="del('sys/goods/del?auction_assets_id='+'${var.auction_assets_id}',800);"
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
                                        <a style="cursor:pointer;" title="新增" onclick="add('sys/goods/goadd',800);"
                                           class="btn btn-social-icon btn-info"><i class="fa fa-plus-square"></i></a>
                                    </shiro:hasPermission>
                                    <shiro:hasPermission name="sysGoods:delall">
                                        <a style="cursor:pointer;" title="删除"
                                           onclick="delArray('sys/goods/delall',800);"
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
            $('input[name="auction_assets_ids"]').iCheck('check');
        });
        $('#checkAll').on('ifUnchecked', function (event) {
            $('input[name="auction_assets_ids"]').iCheck('uncheck');
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
            $("#sysgoodsListForm").submit();
        });
        $("#page").on("pageSizeChanged", function (event, data) {
            window.top.loadStart();
            $("#pageSize").val(data.pageSize);
            $("#sysgoodsListForm").submit();
        });
    });
    function del(url, height) {
        window.top.delDialog(url, height);
    }
    function delArray(url, height) {
        var auction_assets_ids = new Array();
        $("#auction_assets_ids:checked").each(function () {
            auction_assets_ids.push($(this).val());
        });
        window.top.delArrayDialog(url, auction_assets_ids);
    }
    function postObjs(url, height) {
        var objs = new Array();
        $("#sysGoodsIds:checked").each(function () {
            var obj = {};
            obj.sysGoods_id = $(this).val();
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
        $("#sysgoodsListForm").submit();
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
