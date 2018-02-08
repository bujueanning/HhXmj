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
	<script type="text/javascript" src="pages/sys/kj/js/jquery-1.8.2.min.js"></script>
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
        <form class="form-horizontal" action="sys/bond/save" name="sysbondDialogForm" id="sysbondDialogForm"
              method="post" enctype="multipart/form-data">
            <input type="hidden" name="bond_disposal_id" id="bond_disposal_id" value="${bond_disposal_id}"/>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_company_name" class="col-sm-2 control-label">名称:</label>
                            <div class="col-sm-10">
                                <input name="bond_company_name" id="bond_company_name" type="text"
                                       class="form-control"
                                       placeholder="资产名称" title="资产名称" value="${bondDisposal.bond_company_name}" required/>
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
                                       placeholder="资产编号" title="资产编号" value="${bondDisposal.bond_asset_number}"required/>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_deal" class="col-sm-2 control-label">交易类型:</label>
                            <div class="col-sm-10">
                                <select class="inpt w200" id="bond_deal"
                                        name="bond_deal" style="float: left;">
                                    <c:forEach items="${dictList}" var="varMap" varStatus="vs">
                                        <c:if test="${varMap.dict_assets_pid == 'bond_deal'}">
                                            <option value="${varMap.dict_assets_key}"
                                                    <c:if test="${varMap.dict_assets_key == bondDisposal.bond_deal}">selected </c:if>>
                                                    ${varMap.dict_assets_name}
                                            </option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_case" class="col-sm-2 control-label">资产包案件数量:</label>
                            <div class="col-sm-10">
                                <input name="bond_case" id="bond_case" type="text"
                                       class="form-control"
                                       placeholder="单笔资产：1份" title="资产包案件数量" value="${bondDisposal.bond_case}"required/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_product_solutions" class="col-sm-2 control-label">债权类型:</label>
                            <div class="col-sm-10">
                                <select class="inpt w200" id="bond_product_solutions"
                                        name="bond_product_solutions" style="float: left;">
                                    <c:forEach items="${dictList}" var="varMap" varStatus="vs">
                                        <c:if test="${varMap.dict_assets_pid == 'bond_product_solutions'}">
                                            <option value="${varMap.dict_assets_key}"
                                                    <c:if test="${varMap.dict_assets_key == bondDisposal.bond_product_solutions}">selected </c:if>>
                                                    ${varMap.dict_assets_name}
                                            </option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_location" class="col-sm-2 control-label">债权人所在地:</label>
                            <div class="col-sm-10">
                                <select class="inpt w200" id="bond_site" name="bond_site"
                                        style="float: left;">
                                    <c:if test="${paneltitle == '资产委外添加'}"> <option value="">请选择省份</option></c:if>  
                                    <c:forEach items="${siteList}" var="varMap">
                                         <option value="${varMap.bond_site_id}" 
                                          		 <c:if test="${varMap.bond_site_id== siteOne.bond_site_pid}">selected </c:if>>
                                                 ${varMap.bond_location_name}
                                         </option>
                                    </c:forEach>
                                </select>
                                <select class="inpt w200" id=bond_location name="bond_location"
                                        style="float: left;">
                                         <c:if test="${paneltitle == '资产委外添加'}"> <option value="">请选择城市</option></c:if>  
                                         <c:forEach items="${city}" var="varMap">
                                         <option value="${varMap.bond_site_id}" 
                                          		 <c:if test="${varMap.bond_site_id== bondDisposal.bond_location}">selected </c:if>>
                                                 ${varMap.bond_location_name}
                                         </option>
                                    	</c:forEach>
                                </select><span id="bond_right" style="display:none;color:red;">债权人所在地没有选择</span>
                            </div>
                        </div>
                    </div>
                </div>
<!-- 全国的债权人的地址 -->
<script type="text/javascript">
	$(function(){
		$("#bond_site").change(function(){
			var bond_site = $("#bond_site").find("option:selected").text();
			var bond_site_pid = $("#bond_site").val();
			console.log(bond_site+","+bond_site_pid);
			$.post("bond/site/listjson",{"bond_site":bond_site_pid},function(map){
				console.log(JSON.stringify(map.resultObj.varList));
				var varList = map.resultObj.varList
				var select = $("#bond_location");
				select.empty(); 
				select.append('<option value="">请选择城市</option>');
				for(var i in varList){
					var bond_site_id = varList[i].bond_site_id;
					var bond_location_name =varList[i].bond_location_name;
					select.append('<option value="'+bond_site_id+'">'+bond_location_name+'</option>');  
				}
			});
		});
		$("#bond_location").change(function(){
			var location_name = $("#bond_location").find("option:selected").text();
			var location_id = $("#bond_location").val();
			console.log("name:"+location_name+",id:"+location_id);
			console.log("地址栏："+$("#bond_location").val());
		});
		
	})
</script>
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_debt_location" class="col-sm-2 control-label">债务人所在地:</label>
                            <div class="col-sm-10">
                                <select class="inpt w200" id="bond_debt_site" name="bond_debt_site"
                                        style="float: left;">
                                    <c:if test="${paneltitle == '资产委外添加'}"> <option value="">请选择省份</option></c:if>  
                                    <c:forEach items="${debtPro}" var="varMap">
                                         <option value="${varMap.bond_site_id}" 
                                          		 <c:if test="${varMap.bond_site_id== debtSite.bond_site_pid}">selected </c:if>>
                                                 ${varMap.bond_location_name}
                                         </option>
                                    </c:forEach>
                                </select>
                                <select class="inpt w200" id=bond_debt_location name="bond_debt_location"
                                        style="float: left;">
                                         <c:if test="${paneltitle == '资产委外添加'}"> <option value="">请选择城市</option></c:if>  
                                         <c:forEach items="${debtCity}" var="varMap">
                                         <option value="${varMap.bond_site_id}" 
                                          		 <c:if test="${varMap.bond_site_id== debtSite.bond_site_id}">selected </c:if>>
                                                 ${varMap.bond_location_name}
                                         </option>
                                    	</c:forEach>
                                </select><span id="bond_debt" style="display:none;color:red;">债务人所在地没有选择</span>
                            </div>
                        </div>
                    </div>
                </div>
<!-- 全国的债务人的地址 -->
<script type="text/javascript">
	$(function(){
		$("#bond_debt_site").change(function(){
			var bond_site = $("#bond_debt_site").find("option:selected").text();
			var bond_site_pid = $("#bond_debt_site").val();
			console.log(bond_site+","+bond_site_pid);
			$.post("bond/site/listjson",{"bond_site":bond_site_pid},function(map){
				console.log(JSON.stringify(map.resultObj.varList));
				var varList = map.resultObj.varList
				var select = $("#bond_debt_location");
				select.empty(); 
				select.append('<option value="">请选择城市</option>');
				for(var i in varList){
					var bond_site_id = varList[i].bond_site_id;
					var bond_location_name =varList[i].bond_location_name;
					select.append('<option value="'+bond_site_id+'">'+bond_location_name+'</option>');  
				}
			});
		});
		$("#bond_debt_location").change(function(){
			var location_name = $("#bond_debt_location").find("option:selected").text();
			var location_id = $("#bond_debt_location").val();
			console.log("name:"+location_name+",id:"+location_id);
			console.log("地址栏："+$("#bond_debt_location").val());
		});
		
	})
</script>

                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_classify" class="col-sm-2 control-label">处置模式:</label>
                            <div class="col-sm-10">
                                <select class="inpt w200" id="bond_classify" name="bond_classify"
                                        style="float: left;">
                                    <c:forEach items="${dictList}" var="varMap">
                                        <c:if test="${varMap.dict_assets_pid == 'bond_classify'}">
                                            <option value="${varMap.dict_assets_key}"
                                                    <c:if test="${varMap.dict_assets_key == bondDisposal.bond_classify}">selected </c:if>>
                                                    ${varMap.dict_assets_name}
                                            </option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

             

                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_ownership_amount" class="col-sm-2 control-label">权属金额:</label>
                            <div class="col-sm-10">
                                <select class="inpt w200" id="bond_ownership_amount" name="bond_ownership_amount"
                                        style="float: left;">
                                    <c:forEach items="${dictList}" var="varMap">
                                        <c:if test="${varMap.dict_assets_pid == 'bond_ownership_amount'}">
                                            <option value="${varMap.dict_assets_key}"
                                                    <c:if test="${varMap.dict_assets_key == bondDisposal.bond_ownership_amount}">selected </c:if>>
                                                    ${varMap.dict_assets_name}
                                            </option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_disposal_arrears" class="col-sm-2 control-label">总欠款(元):</label>
                            <div class="col-sm-10">
                                <input name="bond_disposal_arrears" id="bond_disposal_arrears" type="text"
                                       class="form-control" placeholder="欠款" title="欠款"
                                       value="${bondDisposal.bond_disposal_arrears}" pattern="[0-9]+" required/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_transfer_ratio" class="col-sm-2 control-label">佣金比例:</label>
                            <div class="col-sm-10">
                                <input name="bond_transfer_ratio" id="bond_transfer_ratio" type="text" maxlength="3"
                                       class="form-control" placeholder="佣金比例" title="佣金比例:数字+%"
                                       value="${bondDisposal.bond_transfer_ratio}" pattern="^([1-9][0-9]%)|([1-9]%)$" required/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_overdue" class="col-sm-2 control-label">逾期时间:</label>
                            <div class="col-sm-10">
                                <input name="bond_overdue" id="bond_overdue" type="text" 
                                       class="form-control" placeholder="逾期时间" title="逾期时间"
                                       value="${bondDisposal.bond_overdue}" pattern="[0-9]+" required/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_deadline" class="col-sm-2 control-label">委外期限:</label>
                            <div class="col-sm-10">
                                <input name="bond_deadline" id="bond_deadline" type="text" 
                                       class="form-control" placeholder="委外期限" title="委外期限"
                                       value="${bondDisposal.bond_deadline}" pattern="[0-9]+" required/>
                            </div>
                        </div>
                    </div>
                </div>

                
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_release_time" class="col-sm-2 control-label">发布时间:</label>
                            <div class="col-sm-10">
                                <div class="input-group date">
                                    <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                    <input name="bond_release_time" id="bond_release_time" type="text" required
                                           class="form-control datepicker" placeholder="发布时间" title="发布时间"
                                           value="<fmt:formatDate value="${bondDisposal.bond_release_time}" pattern="yyyy-MM-dd HH:mm:ss" />">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                

                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_major_issues" class="col-sm-2 control-label">重要信息:</label>
                            <div class="col-sm-10">
                                <textarea class="textarea" id="bond_major_issues" name="bond_major_issues"
                                          placeholder="重要信息"
                                          style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">${bondDisposal.bond_major_issues}</textarea>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_contacts" class="col-sm-2 control-label">处置方联系人:</label>
                            <div class="col-sm-10">
                                <input name="bond_contacts" id="bond_contacts" type="text"
                                       class="form-control" placeholder="联系人" title="联系人"
                                       value="${bondDisposal.bond_contacts}" required/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_contact_number" class="col-sm-2 control-label">处置方联系方式:</label>
                            <div class="col-sm-10">
                                <input name="bond_contact_number" id="bond_contact_number" type="text"
                                       class="form-control" placeholder="联系方式" title="联系方式"
                                       value="${bondDisposal.bond_contact_number}" pattern="^[1][3,4,5,7,8][0-9]{9}$" required>
                            </div>
                        </div>
                    </div>
                </div>
				<!-- 
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="auction_project_announcement" class="col-sm-2 control-label">项目公告:</label>
                            <div class="col-sm-10">
                                <script id="auction_project_announcement" name="auction_project_announcement"
                                        type="text/plain">${bondDisposal.auction_project_announcement}</script>
                            </div>
                        </div>
                    </div>
                </div>
				 -->
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                         <label for="bond_disposal_img" class="col-sm-2 control-label">图片上传:</label>
                            <img id="image" width="200px" height="200px" src="${bondDisposal.bond_disposal_img}">
                            <input type="file" id="bond_disposal_img" name="bond_disposal_img"
                                   value="${bondDisposal.bond_disposal_img}" onchange="companyclickfile()">
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="bond_disposal_accessory" class="col-sm-2 control-label">附件上传:</label>
                            <input type="file" id="bond_disposal_accessory" name="bond_disposal_accessory"
                                   value="${bondDisposal.bond_disposal_accessory}" onchange="">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="auction_verify" class="col-sm-2 control-label">委外审核:</label>
                            <div class="col-sm-10">
                                <select id="bond_verify" name="bond_verify" class="form-control select2">
                                    <option value="">请选择</option>
                                    <c:forEach items="${dictList}" var="varMap" varStatus="vs">
                                        <c:if test="${varMap.dict_assets_pid == 'bond_verify'}">
                                            <option value="${varMap.dict_assets_key}"
                                                    <c:if test="${varMap.dict_assets_key == bondDisposal.bond_verify}">selected </c:if>>
                                                    ${varMap.dict_assets_name}
                                            </option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
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
			 f=$("#sysbondDialogForm").find("#bond_disposal_img").get(0).files[0]
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
