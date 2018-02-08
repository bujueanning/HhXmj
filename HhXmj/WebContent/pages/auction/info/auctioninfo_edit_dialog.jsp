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
				<form class="form-horizontal" action="auction/info/save" name="auctioninfoDialogForm" id="auctioninfoDialogForm" method="post">
            
              
	              	<input type="hidden" name="auction_info_id" id="auction_info_id" value="${auctionInfo.auction_info_id}"/>
			
              <div class="box-body">
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="projectName" class="col-sm-2 control-label">项目名称:</label>
								                  <div class="col-sm-10">
								                    <input name="projectName" id="projectName" type="text" class="form-control"  placeholder="项目名称" title="项目名称" value="${auctionInfo.projectName}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="projectNO" class="col-sm-2 control-label">项目编号:</label>
								                  <div class="col-sm-10">
								                    <input name="projectNO" id="projectNO" type="text" class="form-control"  placeholder="项目编号" title="项目编号" value="${auctionInfo.projectNO}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="industryOwned" class="col-sm-2 control-label">所属行业:</label>
								                  <div class="col-sm-10">
								                    <input name="industryOwned" id="industryOwned" type="text" class="form-control"  placeholder="所属行业" title="所属行业" value="${auctionInfo.industryOwned}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="projectLocation" class="col-sm-2 control-label">项目所在地:</label>
								                  <div class="col-sm-10">
								                    <input name="projectLocation" id="projectLocation" type="text" class="form-control"  placeholder="项目所在地" title="项目所在地" value="${auctionInfo.projectLocation}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="underlyingAssetName" class="col-sm-2 control-label">标的资产名称:</label>
								                  <div class="col-sm-10">
								                    <input name="underlyingAssetName" id="underlyingAssetName" type="text" class="form-control"  placeholder="标的资产名称" title="标的资产名称" value="${auctionInfo.underlyingAssetName}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="businessNature" class="col-sm-2 control-label">标的企业性质:</label>
								                  <div class="col-sm-10">
								                    <input name="businessNature" id="businessNature" type="text" class="form-control"  placeholder="标的企业性质" title="标的企业性质" value="${auctionInfo.businessNature}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="projectAmount" class="col-sm-2 control-label">项目金额(万元):</label>
								                  <div class="col-sm-10">
								                    <input name="projectAmount" id="projectAmount" type="text" class="form-control"  placeholder="项目金额(万元)" title="项目金额(万元)" value="${auctionInfo.projectAmount}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="operation" class="col-sm-2 control-label">拟采用操作方式:</label>
								                  <div class="col-sm-10">
								                    <input name="operation" id="operation" type="text" class="form-control"  placeholder="拟采用操作方式" title="拟采用操作方式" value="${auctionInfo.operation}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="listingQuantity" class="col-sm-2 control-label">挂牌数量:</label>
								                  <div class="col-sm-10">
								                    <input name="listingQuantity" id="listingQuantity" type="text" class="form-control"  placeholder="挂牌数量" title="挂牌数量" value="${auctionInfo.listingQuantity}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="unitPrice" class="col-sm-2 control-label">单价（元）:</label>
								                  <div class="col-sm-10">
								                    <input name="unitPrice" id="unitPrice" type="text" class="form-control"  placeholder="单价（元）" title="单价（元）" value="${auctionInfo.unitPrice}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="bond" class="col-sm-2 control-label">保证金:</label>
								                  <div class="col-sm-10">
								                    <input name="bond" id="bond" type="text" class="form-control"  placeholder="保证金" title="保证金" value="${auctionInfo.bond}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="stockRight" class="col-sm-2 control-label">股权（万元）:</label>
								                  <div class="col-sm-10">
								                    <input name="stockRight" id="stockRight" type="text" class="form-control"  placeholder="股权（万元）" title="股权（万元）" value="${auctionInfo.stockRight}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="biddingCycle" class="col-sm-2 control-label">竞价周期(天):</label>
								                  <div class="col-sm-10">
								                    <input name="biddingCycle" id="biddingCycle" type="text" class="form-control"  placeholder="竞价周期(天)" title="竞价周期(天)" value="${auctionInfo.biddingCycle}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="floorPrice" class="col-sm-2 control-label">最低价格（万元）:</label>
								                  <div class="col-sm-10">
								                    <input name="floorPrice" id="floorPrice" type="text" class="form-control"  placeholder="最低价格（万元）" title="最低价格（万元）" value="${auctionInfo.floorPrice}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="creditorPrincipal" class="col-sm-2 control-label">债权本金（万元）:</label>
								                  <div class="col-sm-10">
								                    <input name="creditorPrincipal" id="creditorPrincipal" type="text" class="form-control"  placeholder="债权本金（万元）" title="债权本金（万元）" value="${auctionInfo.creditorPrincipal}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="ensurePrincipal" class="col-sm-2 control-label">其中保证本金（万元）:</label>
								                  <div class="col-sm-10">
								                    <input name="ensurePrincipal" id="ensurePrincipal" type="text" class="form-control"  placeholder="其中保证本金（万元）" title="其中保证本金（万元）" value="${auctionInfo.ensurePrincipal}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="mortgagePrincipal" class="col-sm-2 control-label">其中抵押本金（万元）:</label>
								                  <div class="col-sm-10">
								                    <input name="mortgagePrincipal" id="mortgagePrincipal" type="text" class="form-control"  placeholder="其中抵押本金（万元）" title="其中抵押本金（万元）" value="${auctionInfo.mortgagePrincipal}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="pledgePrincipal" class="col-sm-2 control-label">其中质押本金（万元）:</label>
								                  <div class="col-sm-10">
								                    <input name="pledgePrincipal" id="pledgePrincipal" type="text" class="form-control"  placeholder="其中质押本金（万元）" title="其中质押本金（万元）" value="${auctionInfo.pledgePrincipal}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="creditorInterest" class="col-sm-2 control-label">债权利息（万元）:</label>
								                  <div class="col-sm-10">
								                    <input name="creditorInterest" id="creditorInterest" type="text" class="form-control"  placeholder="债权利息（万元）" title="债权利息（万元）" value="${auctionInfo.creditorInterest}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="creditorInterest2" class="col-sm-2 control-label">债权孳生息（万元）:</label>
								                  <div class="col-sm-10">
								                    <input name="creditorInterest2" id="creditorInterest2" type="text" class="form-control"  placeholder="债权孳生息（万元）" title="债权孳生息（万元）" value="${auctionInfo.creditorInterest2}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="importantInfo" class="col-sm-2 control-label">重要信息:</label>
								                  <div class="col-sm-10">
								                    <input name="importantInfo" id="importantInfo" type="text" class="form-control"  placeholder="重要信息" title="重要信息" value="${auctionInfo.importantInfo}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
					               <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
									                <label for="listingStart" class="col-sm-2 control-label">挂牌开始时间:</label>
									                <div class="col-sm-10">
									                   <div class="input-group date">
								                          <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
								                  		  <input name="listingStart" id="listingStart"  type="text" class="form-control datepicker" placeholder="挂牌开始时间" title="挂牌开始时间" value="<fmt:formatDate value="${auctionInfo.listingStart}" pattern="yyyy-MM-dd HH:mm:ss" />">
								                	   </div>
								                
									                </div>
									                <!-- /.input group -->
									              </div>
								         </div>
					                </div>
			              
					               <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
									                <label for="listingEnd" class="col-sm-2 control-label">挂牌结束日时间:</label>
									                <div class="col-sm-10">
									                   <div class="input-group date">
								                          <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
								                  		  <input name="listingEnd" id="listingEnd"  type="text" class="form-control datepicker" placeholder="挂牌结束日时间" title="挂牌结束日时间" value="<fmt:formatDate value="${auctionInfo.listingEnd}" pattern="yyyy-MM-dd HH:mm:ss" />">
								                	   </div>
								                
									                </div>
									                <!-- /.input group -->
									              </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="contacts" class="col-sm-2 control-label">联系人:</label>
								                  <div class="col-sm-10">
								                    <input name="contacts" id="contacts" type="text" class="form-control"  placeholder="联系人" title="联系人" value="${auctionInfo.contacts}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="contactInformation" class="col-sm-2 control-label">联系方式:</label>
								                  <div class="col-sm-10">
								                    <input name="contactInformation" id="contactInformation" type="text" class="form-control"  placeholder="联系方式" title="联系方式" value="${auctionInfo.contactInformation}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="notice" class="col-sm-2 control-label">項目公告:</label>
								                  <div class="col-sm-10">
								                    <input name="notice" id="notice" type="text" class="form-control"  placeholder="項目公告" title="項目公告" value="${auctionInfo.notice}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="idCardFrontImg" class="col-sm-2 control-label">图片地址:</label>
								                  <div class="col-sm-10">
								                    <input name="idCardFrontImg" id="idCardFrontImg" type="text" class="form-control"  placeholder="图片地址" title="图片地址" value="${auctionInfo.idCardFrontImg}">
								                  </div>
								                </div>
								         </div>
					                </div>
			              
						            <div class="row">
					            		<div class="col-md-8">
								                <div class="form-group">
								                  <label for="status" class="col-sm-2 control-label">是否审核：0 否，1 是:</label>
								                  <div class="col-sm-10">
								                    <input name="status" id="status" type="text" class="form-control"  placeholder="是否审核：0 否，1 是" title="是否审核：0 否，1 是" value="${auctionInfo.status}">
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
    $("form").validity(function() {
				 $('#auction_info_id').require();//
				 $('#projectName').require();//项目名称
				 $('#projectNO').require();//项目编号
				 $('#industryOwned').require();//所属行业
				 $('#projectLocation').require();//项目所在地
				 $('#underlyingAssetName').require();//标的资产名称
				 $('#businessNature').require();//标的企业性质
				 $('#projectAmount').require();//项目金额(万元)
				 $('#operation').require();//拟采用操作方式
				 $('#listingQuantity').require();//挂牌数量
				 $('#unitPrice').require();//单价（元）
				 $('#bond').require();//保证金
				 $('#stockRight').require();//股权（万元）
				 $('#biddingCycle').require();//竞价周期(天)
				 $('#floorPrice').require();//最低价格（万元）
				 $('#creditorPrincipal').require();//债权本金（万元）
				 $('#ensurePrincipal').require();//其中保证本金（万元）
				 $('#mortgagePrincipal').require();//其中抵押本金（万元）
				 $('#pledgePrincipal').require();//其中质押本金（万元）
				 $('#creditorInterest').require();//债权利息（万元）
				 $('#creditorInterest2').require();//债权孳生息（万元）
				 $('#importantInfo').require();//重要信息
				 $('#listingStart').require();//挂牌开始时间
				 $('#listingEnd').require();//挂牌结束日时间
				 $('#contacts').require();//联系人
				 $('#contactInformation').require();//联系方式
				 $('#notice').require();//項目公告
				 $('#idCardFrontImg').require();//图片地址
				 $('#status').require();//是否审核：0 否，1 是
    });
  });
function validateInputs() {
          $.validity.start();
		//$('#auction_info_id').require();//
		//$('#projectName').require();//项目名称
		//$('#projectNO').require();//项目编号
		//$('#industryOwned').require();//所属行业
		//$('#projectLocation').require();//项目所在地
		//$('#underlyingAssetName').require();//标的资产名称
		//$('#businessNature').require();//标的企业性质
		//$('#projectAmount').require();//项目金额(万元)
		//$('#operation').require();//拟采用操作方式
		//$('#listingQuantity').require();//挂牌数量
		//$('#unitPrice').require();//单价（元）
		//$('#bond').require();//保证金
		//$('#stockRight').require();//股权（万元）
		//$('#biddingCycle').require();//竞价周期(天)
		//$('#floorPrice').require();//最低价格（万元）
		//$('#creditorPrincipal').require();//债权本金（万元）
		//$('#ensurePrincipal').require();//其中保证本金（万元）
		//$('#mortgagePrincipal').require();//其中抵押本金（万元）
		//$('#pledgePrincipal').require();//其中质押本金（万元）
		//$('#creditorInterest').require();//债权利息（万元）
		//$('#creditorInterest2').require();//债权孳生息（万元）
		//$('#importantInfo').require();//重要信息
		//$('#listingStart').require();//挂牌开始时间
		//$('#listingEnd').require();//挂牌结束日时间
		//$('#contacts').require();//联系人
		//$('#contactInformation').require();//联系方式
		//$('#notice').require();//項目公告
		//$('#idCardFrontImg').require();//图片地址
		//$('#status').require();//是否审核：0 否，1 是
	     var result = $.validity.end();
	     return result.valid;
}    
function formSubmit(){
	  $.ajax({
			type: "POST",
			url:$('#auctioninfoDialogForm').attr('action'),
			data:$('#auctioninfoDialogForm').serialize(),// 你的formid
			cache: false,
			async: false,
			error: function(request) {
				alert("Connection error");
			},
			success: function(data) {
			}
		});
}
</script>
</body>
</html>
