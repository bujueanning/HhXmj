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
    <link rel="stylesheet" href="plugins/validity-master/build/jquery.validity.css"/>
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

    <script type="text/javascript" charset="utf-8" src="<%=basePath%>ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>ueditor/ueditor.all.min.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
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
        <form class="form-horizontal" action="sys/bond/sheet/save" name="sysbondDialogForm" id="sysbondDialogForm"
              method="post" enctype="multipart/form-data">
            <input type="hidden" name="bond_sheet_id" id="bond_sheet_id" value="${bond_sheet_id}"/>
            <input type="hidden" name="bond_disposal_id" id="bond_disposal_id" value="${disposal.bond_disposal_id}"/>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_company_name" class="col-sm-2 control-label">企业名称:</label>
                            <div class="col-sm-10">
                                <input name="bond_company_name" id="bond_company_name" type="text"
                                       class="form-control"
                                       placeholder="企业名称" title="企业名称" value="${bondSheet.bond_company_name}">
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_asset_number" class="col-sm-2 control-label">资产编号:</label>
                            <div class="col-sm-10">
                                <input name="bond_asset_number" id="bond_asset_number" type="text"
                                       class="form-control"
                                       placeholder="资产编号" title="资产编号" value="${bondSheet.bond_asset_number}">
                            </div>
                        </div>
                    </div>
                </div>

				<div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_sheet_time" class="col-sm-2 control-label">接单时间:</label>
                            <div class="col-sm-10">
                                <div class="input-group date">
                                    <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                    <input name="bond_sheet_time" id="bond_sheet_time" type="text"
                                           class="form-control datepicker" placeholder="接单时间" title="接单时间"
                                           value="<fmt:formatDate value="${bondSheet.bond_sheet_time}" pattern="yyyy-MM-dd HH:mm:ss" />">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_lose_efficacy_time" class="col-sm-2 control-label">资产逾期时间:</label>
                            <div class="col-sm-10">
                                <div class="input-group date">
                                    <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                    <input name="bond_lose_efficacy_time" id="bond_lose_efficacy_time" type="text"
                                           class="form-control datepicker" placeholder="资产逾期时间" title="资产逾期时间"
                                           value="<fmt:formatDate value="${bondSheet.bond_lose_efficacy_time}" pattern="yyyy-MM-dd HH:mm:ss" />">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_asset_number" class="col-sm-2 control-label">接单处置方（公司名）:</label>
                            <div class="col-sm-10">
                                <input name="bond_accept_name" id="bond_accept_name" type="text"
                                       class="form-control"
                                       placeholder="接单处置方" title="接单处置方" value="${bondSheet.bond_accept_name}">
                            </div>
                        </div>
                    </div>
                </div>

                

                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_accept_property" class="col-sm-2 control-label">处置方性质:</label>
                            <div class="col-sm-10">
                                <input name="bond_accept_property" id="bond_accept_property" type="text"
                                       class="form-control" placeholder="处置方性质" title="处置方性质"
                                       value="${bondSheet.bond_accept_property}">
                            </div>
                        </div>
                    </div>
                </div>
                
                <c:if test="${not empty disposal}">
					<div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_contacts" class="col-sm-2 control-label">发布方联系人:</label>
                            <div class="col-sm-10">
                                <input name="bond_contacts" id="bond_contacts" type="text"
                                       class="form-control" placeholder="联系人" title="联系人"
                                       value="${disposal.bond_contacts}">
                            </div>
                        </div>
                    </div>
                </div>

                

                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_contact_number" class="col-sm-2 control-label">发布方联系人电话:</label>
                            <div class="col-sm-10">
                                <input name="bond_contact_number" id="bond_contact_number" type="text"
                                       class="form-control" placeholder="联系人电话" title="联系人电话"
                                       value="${disposal.bond_contact_number}">
                            </div>
                        </div>
                    </div>
                </div>
				
			</c:if>
                

                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_deal_name" class="col-sm-2 control-label">处置方联系人:</label>
                            <div class="col-sm-10">
                                <input name="bond_deal_name" id="bond_deal_name" type="text"
                                       class="form-control" placeholder="联系人" title="联系人"
                                       value="${bondSheet.bond_deal_name}">
                            </div>
                        </div>
                    </div>
                </div>

                

                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_deal_phone" class="col-sm-2 control-label">处置方联系人电话:</label>
                            <div class="col-sm-10">
                                <input name="bond_deal_phone" id="bond_deal_phone" type="text"
                                       class="form-control" placeholder="联系人电话" title="联系人电话"
                                       value="${bondSheet.bond_deal_phone}">
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_deal_type" class="col-sm-2 control-label">处置方式:</label>
                            <div class="col-sm-10">
                                <input name="bond_deal_type" id="bond_deal_type" type="text"
                                       class="form-control" placeholder="处置方式" title="处置方式"
                                       value="${bondSheet.bond_deal_type}">
                            </div>
                        </div>
                    </div>
                </div>
                
                

                

                

                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_sheet_information" class="col-sm-2 control-label">重要信息:</label>
                            <div class="col-sm-10">
                                <textarea class="textarea" id="bond_sheet_information" name="bond_sheet_information"
                                          placeholder="重要信息"
                                          style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">${bondSheet.bond_sheet_information}</textarea>

                            </div>
                        </div>
                    </div>
                </div>

                
                
                
				<!-- 
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_sheet_announcement" class="col-sm-2 control-label">项目公告:</label>
                            <div class="col-sm-10">
                                <script id="bond_sheet_announcement" name="bond_sheet_announcement"
                                        type="text/plain">${bondSheet.auction_project_announcement}</script>
                            </div>
                        </div>
                    </div>
                </div>
				 -->
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                        <label for="bond_deal_img" class="col-sm-2 control-label">上传图片:</label>
                            <img id="image" width="200px" height="200px" src="${bondSheet.bond_deal_img}">
                            <input type="file" id="bond_deal_img" name="bond_deal_img"
                                   value="${bondSheet.bond_deal_img}" onchange="companyclickfile()">
                        </div>
                    </div>
                </div>
                
                
                 <c:if test="${not empty disposal}">
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_unable" class="col-sm-2 control-label">订单审核:</label>
                            <div class="col-sm-10">
                                <select id="bond_unable" name="bond_unable" class="form-control select2">
                                    <option value="">请选择</option>
                                    <c:forEach items="${dictList}" var="varMap" varStatus="vs">
                                        <c:if test="${varMap.dict_assets_pid == 'bond_unable'}">
                                            <option value="${varMap.dict_assets_key}"
                                                    <c:if test="${varMap.dict_assets_key == disposal.bond_unable}">selected </c:if>>
                                                    ${varMap.dict_assets_name}
                                            </option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
               </c:if>

                
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
       // $("form").validity(function () {
       //     $('#sys_goods_id').require();//商品编号
       //     $('#sys_goods_name').require();//商品名称
       //     $('#sys_goods_description').require();//商品描述
       //     $('#sys_goods_price').require();//起始价
       //     $('#sys_goods_imagepath').require();//图片路径
       //     $('#sys_goods_amount').require();//数量
       //     $('#sys_goods_stime').require();//开始时间
       //     $('#sys_goods_etime').require();//结束时间
       //     $('#sys_goods_type_d').require();//产品类型:1_金融,2_国资
        //    $('#sys_goods_addr').require();//商品地址
        //    $('#sys_user_id').require();//拍卖者id
       //     $('#sys_goods_audit_d').require();//资产审核:1_通过,2_不通过
        //    $('#sys_goods_createdate').require();//创建时间
       //     $('#sys_goods_updatedate').require();//更新时间
       //     $('#sys_goods_createuid').require();//创建人id
       //     $('#sys_goods_updateuid').require();//修改人id
       // });
    });
    function validateInputs() {
        $.validity.start();
        //$('#sys_goods_id').require();//商品编号
        //$('#sys_goods_name').require();//商品名称
        //$('#sys_goods_description').require();//商品描述
        //$('#sys_goods_price').require();//起始价
        //$('#sys_goods_imagepath').require();//图片路径
        //$('#sys_goods_amount').require();//数量
        //$('#sys_goods_stime').require();//开始时间
        //$('#sys_goods_etime').require();//结束时间
        //$('#sys_goods_type_d').require();//产品类型:1_金融,2_国资
        //$('#sys_goods_addr').require();//商品地址
        //$('#sys_user_id').require();//拍卖者id
        //$('#sys_goods_audit_d').require();//资产审核:1_通过,2_不通过
        //$('#sys_goods_createdate').require();//创建时间
        //$('#sys_goods_updatedate').require();//更新时间
        //$('#sys_goods_createuid').require();//创建人id
        //$('#sys_goods_updateuid').require();//修改人id
        var result = $.validity.end();
        return result.valid;
    }
    function formSubmit() {
        var formData = new FormData($('#sysbondDialogForm')[0]);
        $.ajax({
            type: "POST",
            url: $('#sysbondDialogForm').attr('action'),
            data: formData,// 你的formid
            processData: false,
            cache: false,
            async: false,
            contentType: false,
            error: function (request) {
                alert("Connection error");
            },
            success: function (data) {
            }
        });
    }
    function companyclickfile(){
			 var r= new FileReader();
			 f=$("#sysbondDialogForm").find("#bond_deal_img").get(0).files[0]
			 r.readAsDataURL(f);
			 r.onload=function  (e) {
				 $("#sysbondDialogForm").find("#image").attr("src",this.result);
			 }
	}
    
</script>

<script type="text/javascript">
    //Date picker
    $('.datepicker').datepicker({
        format: 'yyyy-mm-dd',
        autoclose: true
    });
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('auction_project_announcement');
</script>
</body>
</html>
