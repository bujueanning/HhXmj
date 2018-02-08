<div class="wrap">        
        <div class="index_gdlc">
            <img src="pages/sys/kj/img/corner_1.png" class="corner corner1" />
	        <img src="pages/sys/kj/img/corner_2.png" class="corner corner2" />
	        <img src="pages/sys/kj/img/corner_3.png" class="corner corner3" />
	        <img src="pages/sys/kj/img/corner_4.png" class="corner corner4" />
	        <div class="w1080 bc" style="margin-left:0px">
  <div class="clear"></div>
  <div class="zrxq-box-head">
  	 <div class="l-side">
         <img src="pages/sys/kj/img/xm-pic-1.png" width="275" height="237">
     </div>
     <div class="r-side">
       <c:forEach items="${varList}" var="var" varStatus="vs">
     	 <span class="tag-xmxx">项目信息</span>
     	 <ul class="ul-1">
         	<li class="xm-name">
            >项目名称：${var.bond_company_name}
            </li>
            <li class="xm-num">
            	项目编号：${var.bond_asset_number}
            </li>
         </ul>
     	 <ul class="ul-2">
         	<li class="li-w-1">
            	欠款：<span class="f24 co4">${var.bond_disposal_arrears}</span>
            </li>
            <li class="li-w-2">
            	转让比例：<span class="f24 co4">${var.bond_transfer_ratio }</span>
            </li>
            <li class="li-w-1">
            	挂牌起始时间：${var.bond_listing_start_time}
            </li>
            <li class="li-w-2">
            	挂牌结束时间：${var.bond_listing_end_time }
            </li>
         </ul>
         </c:forEach>
     </div>
  </div>
  <div class="h-shadow-2 clear"></div>
  
  <div class="zrxq-box-tqb">
  	<div class="hd">
    	<ul>
        	<li class="cur"><a>资产信息</a></li>
            <li><a>处置方信息</a></li>
            <li><a>转让方基本情况</a></li>
            <li><a>交易条件</a></li>
            <li><a>联系方式</a></li>
        </ul>
    </div>
    <div class="bd" style="display: block;">
    	<table class="zrxq-tb-2" width="100%">
    	 <c:forEach items="${varList}" var="var" varStatus="vs">
          <tbody><tr>
            <th>交易类别</th>
            <c:if  test="${var.bond_product_solutions==2}"><td>不良资产</td></c:if>
            <c:if  test="${var.bond_product_solutions==1}"><td>国有企业</td></c:if>
			
          </tr>
		  <tr>
            <th>资产处置模式</th>
             <c:if  test="${var.bond_classify==1}"><td>处置方接单</td></c:if>
             <c:if  test="${var.bond_classify==2}"><td>处置方竟单</td></c:if>
          </tr>
          <tr>
            <th>所在地区</th>
            <c:if  test="${var.bond_location==1}"><td>石家庄市</td></c:if>
            <c:if  test="${var.bond_location==2}"><td>邢台市</td></c:if>
          </tr>
          <tr>
            <th>联系人</th>
            <td>${var.bond_contacts }</td>
          </tr>
          <tr>
            <th>联系人电话</th>
            <td>${var.bond_contact_number}</td>
          </tr>
          <tr>
          	<th>发布时间</th>
          	<td> <fmt:formatDate value="${var.bond_release_time}" pattern="yyyy-MM-dd"/></td>
          </tr>
        </tbody>
         </c:forEach>
        </table>

    </div>
    <div class="bd none" style="display: none;">
    	<table class="zrxq-tb-2" width="100%">
    	<c:forEach items="${varSheet}" var="bond" varStatus="vs">
          <tbody><tr>
            <th>接单处置方</th>
            <td>${bond.bond_accept_name}</td>
          </tr>
          <tr>
            <th>处置方性质</th>
            <td>${bond.bond_accept_property}</td>
          </tr>
          <tr>
            <th>处置方联系人</th>
            <td>${bond.bond_deal_name }</td>
          </tr>
          <tr>
            <th>处置方联系电话</th>
            <td>${bond.bond_deal_phone }</td>
          </tr>
          <tr>
          	<th>处置方式</th>
          	<td>${bond.bond_deal_type }</td>
          </tr>
        </tbody>
         </c:forEach>
        </table>
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <c:if test="${varMap.dict_assets_pid == 'bond_location'}">
								<option value="${varMap.dict_assets_key}">
										${varMap.dict_assets_name}
								</option>
							</c:if>
							
							
							
							
							
							
							
							
							
							<c:set var="bond_location" value="${bondDisposal.bond_location}"/>
					<c:set var="bond_product_solutions" value="${bondDisposal.bond_product_solutions}"/>
					<c:set var="bond_ownership_amount" value="${bondDisposal.bond_ownership_amount}"/>
					<c:set var="bond_classify" value="${bondDisposal.bond_classify}"/>
					
					<!-- 11月14日 因为多加了全国的地址在委外页面取消的js -->
					<script type="text/javascript">
						$(function(){
					        var liobj=$(".deadline_ul li");
					        liobj.each(function(){
					            $(this).click(function(){
					            	removeCl();
					            	liobj.removeClass("on")
					                $(this).addClass("on");
					                var conditionValue =  $(this).text();
					                console.log("地址");
					                if (conditionValue != "不限" && conditionValue != "河北省") {
					                    $.post("bond/disposal/listtree",{"conditionName": "bond_location", "conditionValue": conditionValue},function (datas) {
					                        $(".mode").html(datas)
					                    });
					                }else {
					                    $.post("bond/disposal/listtree",{},function (datas) {
					                        $(".mode").html(datas)
					                    });
					                }
					            });
					        });
					    });
					</script>
					
					<!-- 11月15日 注册验证 -->
					<input onblur="javascript:checkAttr('91','cellPhone','Y','Y','^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(14[0-9]{1})|(17[0-9]{1}))+\\d{8})$','','','add','cellPhone','50')"/>
					
					
					
					<!-- 11月22日 -->
					
					<input  onblur="javascript:checkAttr('91','password','Y','N','(?!^[0-9]+$)(?!^[A-z]+$)(?!^[^A-z0-9]+$)^.{6,16}$','','','add','password','16')"/>
					
					
					
					
					
					
					
					
					
					placeholder="单笔交易精确到天，资产包精确月。例如：1-2个月" 
					
					
				<!-- 2018年  1月 22日 -->	
				<div class="banner">
    <div class="banner_c">
        <div class="div bd">
            <ul>
                <li>
                    <a><img src="pages/sys/kj/img/5.jpg" border="0"/></a>
                </li>
                <li>
                    <a href="javascript:void(0);"><img src="pages/sys/kj/img/5.jpg" border="0"/></a>
                </li>
                <li>
                    <a href="javascript:void(0);"><img src="pages/sys/kj/img/4.jpg" border="0"/></a>
                </li>

                <li>
                    <a href="javascript:void(0);"><img src="pages/sys/kj/img/2.jpg" border="0"/></a>
                </li>
                <li>
                    <a href="javascript:void(0);"><img src="pages/sys/kj/img/1.jpg" border="0"/></a>
                </li>
            </ul>
        </div>
        <div class="banner_nav">
            <ul></ul>
        </div>
    </div>
    <div class="info">
        <a href="pages/sys/kj/login/login.jsp" target="_blank" class="btn_red_big">登录</a><br/>
        <a href="pages/sys/kj/bargain.jsp" class="btn_gray_s">成交公告</a>　
        <a href="sys/kj/goinfo" class="btn_gray_s">个人中心</a><br/>
        <!-- 
        <div class="ul">
            <li>
                手机客户端下载<br/>
                <img src="pages/sys/kj/img/qrcode.jpg"/>
            </li>
            <li class="li">
                微信服务号 扫一扫<br/>
                <img src="pages/sys/kj/img/qrcode.jpg"/>
            </li>
        </div>
         -->
    </div>
</div>
					
					
				<!-- 下午 -->	
					
					<!--  -->
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
				<ol class="carousel-indicators" >
					<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					<li data-target="#carousel-example-generic" data-slide-to="3"></li>
				</ol>
				<!-- Wrapper for slides内容 -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<div style="padding-top: 100px;text-align:center;height:300px;background-image:url(pages/sys/kj/img/5.jpg);background-size:100% 100%"></div>
					</div>

					<div class="item">
						<div style="padding-top: 100px;color: white;text-align:center;height:300px;background-image:url(pages/sys/kj/img/2.jpg);background-size:100% 100%"></div>

					</div>
					<div class="item">
						<div style="padding-top: 100px;text-align:center;height:300px;background-image:url(pages/sys/kj/img/4.jpg);background-size:100% 100%"></div>

					</div>
					<div class="item">
						<div style="padding-top: 100px;text-align:center;height:300px;background-image:url(pages/sys/kj/img/1.jpg);background-size:100% 100%"></div>
					</div>
				</div>
		</div>	
					
					
					
					
					
					
					
					
					
					
					
					
					
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        	<!-- Indicators -->
				<ol class="carousel-indicators" >
					<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				</ol>
				<!-- Wrapper for slides内容 -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<div style="padding-top: 100px;text-align:center;height:300px;background-image:url(pages/sys/kj/img/21.jpg);background-size:100% 100%"></div>
					</div>

					<div class="item">
						<div style="padding-top: 100px;color: white;text-align:center;height:300px;background-image:url(pages/sys/kj/img/21.jpg);background-size:100% 100%"></div>

					</div>
				</div>
        </div>
					
					
	    $(function(){
        var liobj=$(".xmxl_ul li");
        liobj.each(function(){
            $(this).click(function(){
            	removeCl();
            	liobj.removeClass("on")
                $(this).addClass("on");
            	cityEm();
                //console.log("权属金额");
                var conditionValue =  $(this).text();
                if (conditionValue != "不限") {
                    //$.post("bond/disposal/listdeal",{"conditionName": "bond_ownership_amount", "conditionValue": conditionValue},function (datas) {
                        //$(".case").html(datas)
                    //});
                    disType("bond_ownership_amount",conditionValue);
                }else {
                    //$.post("bond/disposal/listdeal",{},function (datas) {
                        //$(".case").html(datas)
                    //});
                    disType("","");
                }
            });
        });
    });				
					
					