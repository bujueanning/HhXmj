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
  <link href="plugins/Pagination-master/mricode.pagination.css" rel="stylesheet" />
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="plugins/icheck-1.x/skins/all.css">
    <!-- Select2 -->
  <link rel="stylesheet" href="plugins/select2/select2.min.css">
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
        <div class="col-xs-12">
          <form class="form-horizontal" action="auction/info/list" name="auctioninfoListForm" id="auctioninfoListForm" method="post">
        	  <input type="hidden" name="pageIndex" id="pageIndex" value="${auctionInfo.pageIndex}"/>
			  <input type="hidden" name="pageSize" id="pageSize" value="${auctionInfo.pageSize}"/>
			  <input type="hidden" name="total" id="total" value="${auctionInfo.total}"/>
			  
			  <div class="box box-info">
	            <div class="box-header with-border">
	              <h3 class="box-title">查询</h3>
	            </div>
	            <!-- /.box-header -->
	            <!-- form start -->
	              <div class="box-body">
	                <div class="form-group">
	                  <label for="conditionName" class="col-sm-1 control-label">选项</label>
	                  <div class="col-sm-3">
	                    <select id="conditionName" name="conditionName" class="form-control select2" >
	                    	        <option value="" <c:if test="${conditionName==''}"> selected </c:if> >请选择</option>
									<option value="auction_info_id" <c:if test="${conditionName=='auction_info_id'}"> selected </c:if> ></option>
									<option value="projectName" <c:if test="${conditionName=='projectName'}"> selected </c:if> >项目名称</option>
									<option value="projectNO" <c:if test="${conditionName=='projectNO'}"> selected </c:if> >项目编号</option>
									<option value="industryOwned" <c:if test="${conditionName=='industryOwned'}"> selected </c:if> >所属行业</option>
									<option value="projectLocation" <c:if test="${conditionName=='projectLocation'}"> selected </c:if> >项目所在地</option>
									<option value="underlyingAssetName" <c:if test="${conditionName=='underlyingAssetName'}"> selected </c:if> >标的资产名称</option>
									<option value="businessNature" <c:if test="${conditionName=='businessNature'}"> selected </c:if> >标的企业性质</option>
									<option value="projectAmount" <c:if test="${conditionName=='projectAmount'}"> selected </c:if> >项目金额(万元)</option>
									<option value="operation" <c:if test="${conditionName=='operation'}"> selected </c:if> >拟采用操作方式</option>
									<option value="listingQuantity" <c:if test="${conditionName=='listingQuantity'}"> selected </c:if> >挂牌数量</option>
									<option value="unitPrice" <c:if test="${conditionName=='unitPrice'}"> selected </c:if> >单价（元）</option>
									<option value="bond" <c:if test="${conditionName=='bond'}"> selected </c:if> >保证金</option>
									<option value="stockRight" <c:if test="${conditionName=='stockRight'}"> selected </c:if> >股权（万元）</option>
									<option value="biddingCycle" <c:if test="${conditionName=='biddingCycle'}"> selected </c:if> >竞价周期(天)</option>
									<option value="floorPrice" <c:if test="${conditionName=='floorPrice'}"> selected </c:if> >最低价格（万元）</option>
									<option value="creditorPrincipal" <c:if test="${conditionName=='creditorPrincipal'}"> selected </c:if> >债权本金（万元）</option>
									<option value="ensurePrincipal" <c:if test="${conditionName=='ensurePrincipal'}"> selected </c:if> >其中保证本金（万元）</option>
									<option value="mortgagePrincipal" <c:if test="${conditionName=='mortgagePrincipal'}"> selected </c:if> >其中抵押本金（万元）</option>
									<option value="pledgePrincipal" <c:if test="${conditionName=='pledgePrincipal'}"> selected </c:if> >其中质押本金（万元）</option>
									<option value="creditorInterest" <c:if test="${conditionName=='creditorInterest'}"> selected </c:if> >债权利息（万元）</option>
									<option value="creditorInterest2" <c:if test="${conditionName=='creditorInterest2'}"> selected </c:if> >债权孳生息（万元）</option>
									<option value="importantInfo" <c:if test="${conditionName=='importantInfo'}"> selected </c:if> >重要信息</option>
									<option value="listingStart" <c:if test="${conditionName=='listingStart'}"> selected </c:if> >挂牌开始时间</option>
									<option value="listingEnd" <c:if test="${conditionName=='listingEnd'}"> selected </c:if> >挂牌结束日时间</option>
									<option value="contacts" <c:if test="${conditionName=='contacts'}"> selected </c:if> >联系人</option>
									<option value="contactInformation" <c:if test="${conditionName=='contactInformation'}"> selected </c:if> >联系方式</option>
									<option value="notice" <c:if test="${conditionName=='notice'}"> selected </c:if> >項目公告</option>
									<option value="idCardFrontImg" <c:if test="${conditionName=='idCardFrontImg'}"> selected </c:if> >图片地址</option>
									<option value="status" <c:if test="${conditionName=='status'}"> selected </c:if> >是否审核：0 否，1 是</option>
		                </select>
	                  </div>
	                  <label for="conditionValue" class="col-sm-1 control-label">内容</label>
	                  <div class="col-sm-3">
	                    <input id="conditionValue" name="conditionValue" type="text" class="form-control" placeholder="内容"  value="${conditionValue}">
	                  </div>
	                </div>
	              </div>
	              <!-- /.box-body -->
	              <div class="box-footer">
	                <button type="button" class="btn btn-info pull-right" onclick="resetSearch();" >重置</button>
	                <button type="button" class="btn btn-info pull-right" onclick="formSubmit();" style="margin-right: 5px;">查询</button>
	              </div>
	              <!-- /.box-footer -->
	          </div>
			  
			  
			  
	          <div class="box">
	            <!-- /.box-header -->
	            <div class="box-body table-responsive no-padding">
	              <table class="table table-hover">
	                <tr>
	                	   <th><input name='checkAll' id='checkAll' type="checkbox" class="flat-red"></th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">项目名称</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">项目编号</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">所属行业</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">项目所在地</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">标的资产名称</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">标的企业性质</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">项目金额(万元)</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">拟采用操作方式</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">挂牌数量</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">单价（元）</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">保证金</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">股权（万元）</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">竞价周期(天)</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">最低价格（万元）</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">债权本金（万元）</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">其中保证本金（万元）</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">其中抵押本金（万元）</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">其中质押本金（万元）</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">债权利息（万元）</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">债权孳生息（万元）</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">重要信息</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">挂牌开始时间</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">挂牌结束日时间</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">联系人</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">联系方式</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">項目公告</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">图片地址</th>
						    <th style="word-break: keep-all;white-space:nowrap;width: 80px;">是否审核：0 否，1 是</th>
						    <th style="width: 80px;">操作</th>
	                </tr>
	                <c:choose>
							<c:when test="${not empty varList}">
								<c:forEach items="${varList}" var="var" varStatus="vs">
									<tr>
											<td>
												<input name='auctionInfoIds' id='auctionInfoIds' type="checkbox" class="flat-red" value="${var.auction_info_id}" >
											</td>
										    <td>${var.projectName}</td>
										    <td>${var.projectNO}</td>
										    <td>${var.industryOwned}</td>
										    <td>${var.projectLocation}</td>
										    <td>${var.underlyingAssetName}</td>
										    <td>${var.businessNature}</td>
										    <td>${var.projectAmount}</td>
										    <td>${var.operation}</td>
										    <td>${var.listingQuantity}</td>
										    <td>${var.unitPrice}</td>
										    <td>${var.bond}</td>
										    <td>${var.stockRight}</td>
										    <td>${var.biddingCycle}</td>
										    <td>${var.floorPrice}</td>
										    <td>${var.creditorPrincipal}</td>
										    <td>${var.ensurePrincipal}</td>
										    <td>${var.mortgagePrincipal}</td>
										    <td>${var.pledgePrincipal}</td>
										    <td>${var.creditorInterest}</td>
										    <td>${var.creditorInterest2}</td>
										    <td>${var.importantInfo}</td>
							              	<td><fmt:formatDate value="${var.listingStart}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							              	<td><fmt:formatDate value="${var.listingEnd}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										    <td>${var.contacts}</td>
										    <td>${var.contactInformation}</td>
										    <td>${var.notice}</td>
										    <td>${var.idCardFrontImg}</td>
										    <td>${var.status}</td>
											<td>
												<shiro:hasPermission name="auctionInfo:goedit">
													<a style="cursor:pointer;" title="编辑" onclick="edit('auction/info/goedit?auction_info_id='+'${var.auction_info_id}',800);" class="btn btn-social-icon btn-info btn-xs"><i class="fa fa-edit"></i></a>
												</shiro:hasPermission>
												<shiro:hasPermission name="auctionInfo:del">
													<a style="cursor:pointer;" title="删除" onclick="del('auction/info/del?auction_info_id='+'${var.auction_info_id}',800);" class="btn btn-social-icon btn-primary btn-xs"><i class="fa fa-trash"></i></a>
												</shiro:hasPermission>
											</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="main_info">
									<td colspan="100" class="center" >没有相关数据</td>
								</tr>
							</c:otherwise>
						</c:choose>
	              </table>
	            </div>
	            <!-- /.box-body -->
	            <div class="box-footer clearfix">
	            	<div class="pull-left">
	            		<shiro:hasPermission name="auctionInfo:goadd">
	            			 <a style="cursor:pointer;" title="新增" onclick="add('auction/info/goadd',800);" class="btn btn-social-icon btn-info"><i class="fa fa-plus-square"></i></a>
	            		</shiro:hasPermission>
	            		<shiro:hasPermission name="auctionInfo:delall">
	            			<a style="cursor:pointer;" title="删除" onclick="delArray('auction/info/delall',800);" class="btn btn-social-icon btn-primary"><i class="fa fa-trash"></i></a>
	            		</shiro:hasPermission>
	            		<shiro:hasPermission name="auctionInfo:upload">
	            			<a style="cursor:pointer;" title="上传" onclick="upload('auction/info/upload',400);" class="btn btn-social-icon btn-primary"><i class="fa fa-upload"></i></a>
	            		</shiro:hasPermission>
	            		<shiro:hasPermission name="auctionInfo:download">
	            			<a style="cursor:pointer;" title="下载" href="auction/info/download" class="btn btn-social-icon btn-primary"><i class="fa fa-download"></i></a>
	            		</shiro:hasPermission>
			            <!--<a style="cursor:pointer;" title="批量提交" onclick="postObjs('auction/info/postall',800);" class="btn btn-social-icon btn-primary"><i class="fa fa-flag-o"></i></a>-->
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

 <script>
 
  $(function () {
  	window.top.loadClose();
  	//Initialize Select2 Elements
    $(".select2").select2();
	//Flat red color scheme for iCheck
	 $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
	   checkboxClass: 'icheckbox_flat-green',
	   radioClass: 'iradio_flat-green'
	 });
	 $('#checkAll').on('ifChecked', function(event){
	 		$('input#auctionInfoIds').iCheck('check');
	 	});
	 	$('#checkAll').on('ifUnchecked', function(event){
	 		$('input#auctionInfoIds').iCheck('uncheck');
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
    	$("#auctioninfoListForm").submit();
	});
    $("#page").on("pageSizeChanged", function (event, data) {
    	window.top.loadStart();
    	$("#pageSize").val(data.pageSize);
    	$("#auctioninfoListForm").submit();
	});
  });
 	function del(url,height){
    	window.top.delDialog(url,height);
    }
    function delArray(url,height){
 		var auctionInfoIds = new Array();
 		 $("#auctionInfoIds:checked").each(function() {
 			auctionInfoIds.push($(this).val()); 
 		 });
    	window.top.delArrayDialog(url,auctionInfoIds);
    }
    function postObjs(url,height){
 		var objs = new Array();
 		 $("#auctionInfoIds:checked").each(function() {
 			var obj = {};
 			obj.auctionInfo_id = $(this).val();
 			objs.push(obj); 
 		 });
    	window.top.postObjsDialog(url,objs);
    }
    function upload(url,height){
    	window.top.uploadDialog(url,height);
    }
	function edit(url,height){
    	window.top.editDialog(url,height);
    }
    function add(url,height){
    	window.top.editDialog(url,height);
    }
    function formSubmit(){
		  $("#auctioninfoListForm").submit();
	}
	function resetSearch(){
    	$("#conditionValue").val("");
    	//alert($("#conditionName").val()); value 值
    	//alert($('#conditionName  option:selected').text()); text 值
    	$("#conditionName").val("").trigger("change");
    }
    </script>
</body>
</html>
