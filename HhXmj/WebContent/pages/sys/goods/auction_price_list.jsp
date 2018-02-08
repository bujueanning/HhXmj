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
        <!-- Main content -->
        <section class="content">
            <div class="box box-info">
                    <form class="form-horizontal" action="sys/goods/list" name="sysgoodsListForm" id="sysgoodsListForm"
                          method="post">
                        <input type="hidden" name="pageIndex" id="pageIndex" value="${auctionAssets.pageIndex}"/>
                        <input type="hidden" name="pageSize" id="pageSize" value="${auctionAssets.pageSize}"/>
                        <input type="hidden" name="total" id="total" value="${auctionAssets.total}"/>
                            <!-- /.box-header -->
                            <div class="box-body table-responsive no-padding">
                                <table class="table table-hover col-md-8">
                                    <tr>
                                        <th style="word-break: keep-all;white-space:nowrap;width: 50px;">出价</th>
                                        <th style="word-break: keep-all;white-space:nowrap;width: 50px;">出价人</th>
                                        <th style="word-break: keep-all;white-space:nowrap;width: 80px;">出价时间</th>
                                    </tr>
                                    <c:choose>
                                        <c:when test="${not empty varList}">
                                            <c:forEach items="${varList}" var="var" varStatus="vs">
                                                <tr>
                                                    <td>${var.auction_current_price}</td>
                                                    <td>${var.auction_current_people1}</td>
                                                    <td><fmt:formatDate value="${var.auction_price_createtime}"
                                                                        pattern="yyyy-MM-dd"/></td>
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
                    </form>
                    <!-- /.box -->
                </div>
        </section>
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
</body>
</html>
