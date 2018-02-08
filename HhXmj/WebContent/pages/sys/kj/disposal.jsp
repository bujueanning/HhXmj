<%@ page import="java.util.Map" %>
<%@ page import="com.adminlte.utils.ShiroUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    Map<String,Object> sysUser = (Map<String, Object>) ShiroUtils.getAttr("currentUser");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache,no-store">
    <meta http-equiv="expires" content="0"/>
    <title>鑫淼聚不良资产处置平台</title>
    <meta http-equiv="keywords" content="鑫淼聚,资产管理,鑫淼聚,东方证券资产管理有限公司,投资,理财,基金，私募,集合理财,券商,专户理财,券商资管,资管,定向客户,宏观经济,业绩,领先"/>
    <meta http-equiv="description" content="鑫淼聚资产管理有限公司是中国证券会批准设立的首家券商资产管理公司；自1998年开始从事客户资产管理业务，2002年首批获得从事客户资产管理业务资格，2005年成为首批开展券商集合理财业务的证券公司，2010年成为首家获准设立的券商资产管理公司。 "/>
    <link rel="stylesheet" type="text/css" href="pages/sys/kj/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="pages/sys/kj/css/style.css"/>
    <script type="text/javascript" src="pages/sys/kj/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/global.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jcarousellite_1.0.1.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/iepng.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jquery.extend.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/main.js"></script>
    <style>
        .zrxq-box-head .l-side {
            float: left;
            width: 275px;
            height: 459px;
            border-right: none;
            border: solid 1px #e5e5e5;
            border-right: navajowhite;
        }
        .zrxq-box-head .r-side {
            position: relative;
            margin-left: 275px;
            height: auto;
            border: solid 1px #e5e5e5;
            border-left: none;
            overflow: hidden;
        }
    </style>
</head>
<body>
<!--注册登录-->
<div class="personal-top"></div>
<!--导航-->
<div class="personal-banner"></div>
<!--网站公告-->
<div class="notice">
    <div class="notice_c">
        <img src="pages/sys/kj/img/notice.png" class="fl img" />
        <div class="notices">
            <div class="bd">
                <ul>
                    <li><a href="contents.html" >关于暂停通联支付民生银行卡开户（11月28日15:00起）的通知</a></li>
                    <li><a href="contents.html" >个人金融信息安全</a></li>
                    <li><a href="contents.html">关于通联支付交易系统暂停邮储银行快捷开户服务的提示</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>


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
                    <img src="${resultMap.auction_assets_img}" width="275" height="237">
                </div>
                <div class="r-side">
                    <span class="tag-xmxx">项目信息</span>
                    <ul class="ul-1">
                        <li class="xm-name">
                            项目名称：${resultMap.auction_project_name}
                        </li>
                        <li class="xm-num">
                            项目编号：${resultMap.auction_project_number}
                        </li>
                    </ul>
                    <ul class="ul-2" style="height: 200px;">
                        <li class="li-w-1">
                            当前价格（元）：
                            <span class="f24 co4" id="currPrice">
                             <c:choose>
                                 <c:when test="${resultMap.auction_current_price != null }">
                                     ${resultMap.auction_current_price}
                                 </c:when>
                                 <c:otherwise>
                                     ${resultMap.auction_starting_price}
                                 </c:otherwise>
                             </c:choose>
                            </span>
                        </li>
                        <li class="li-w-2">
                            保证金（元）：<span class="f24 co4">${resultMap.auction_bail}</span>
                        </li>
                        <li class="li-w-1">
                            竞价周期：<span>${resultMap.auction_bidding_cycle}</span>
                        </li>
                        <li class="li-w-2">
                            所在地：<span>${resultMap.auction_location}</span>
                        </li>
                        <li class="li-w-1" style="width: 80%;">
                            距结束：<span class="f24 co4" id="divdown1"></span>
                        </li>
                        <li class="li-w-1" style="width: 80%;">
                            最低价格（元）：<span class="co4">${resultMap.auction_starting_price}/${resultMap.auction_fare_increase}</span>
                        </li>
                        <li class="li-w-1">
                            挂牌起始时间：${resultMap.auction_listing_start_time}
                        </li>
                        <li class="li-w-2">
                            挂牌结束时间：${resultMap.auction_listing_end_time}
                        </li>
                    </ul>
                    <div class="g_auction" id="auction_area">
                        <span style="color: #666;margin-left: 45px;">请输入您的竞价金额：</span><input type="hidden" id="url_go" value="http://www.leadamc.com/auction/buy.php?itemid=1244">
                        <a class="btn-reduce">-</a>
                        <c:choose>
                            <c:when test="${resultMap.auction_current_price != null }">
                                <input type="number" value="${resultMap.auction_current_price+resultMap.auction_fare_increase}" name="price" id="auction_price" class="auction_price_input" disabled="">
                            </c:when>
                            <c:otherwise>
                                <input type="number" value="${resultMap.auction_starting_price+resultMap.auction_fare_increase}" name="price" id="auction_price" class="auction_price_input" disabled="">
                            </c:otherwise>
                        </c:choose>

                        <a class="btn-add">+</a>元
                        <br>
                        <button id="go_auction">确认出价</button> <!-- （注：如果想一口价直接购买请输入一口价的价格。） -->
                        <!--<input name="niming" type="checkbox" id="niming" value="1"><input type="hidden" id="jsdate" value="0">
                        匿名出价  <!-- <input name="zidong" type="checkbox" id="zidong" value="1" />
                        自动竞价  -->
                    </div>
                </div>
            </div>
            <!--拍卖流程-->
            <div class=" clear">
                <ul class="jylc">
                    <li>
                        <span><img src="pages/sys/kj/img/lc1_06.png" width="32" height="33"></span>
                        <p class="bz">第一步<br>阅读公告</p>
                    </li>
                    <li>
                        <span><img src="pages/sys/kj/img/lc_08.png" width="32" height="33"></span>
                        <p class="bz">第二步<br>报名</p>
                    </li>
                    <li>
                        <span><img src="pages/sys/kj/img/lc_10.png" width="32" height="33"></span>
                        <p class="bz">第三步<br>等待受理</p>
                    </li>
                    <li>
                        <span><img src="pages/sys/kj/img/lc_12.png" width="32" height="33"></span>
                        <p class="bz">第四步<br>交保证金</p>
                    </li>
                    <li>
                        <span><img src="pages/sys/kj/img/lc_14.png" width="32" height="33"></span>
                        <p class="bz">第五步<br>线下交易</p>
                    </li>
                    <li>
                        <span><img src="pages/sys/kj/img/lc_16.png" width="32" height="33"></span>
                        <p class="bz">第六步<br>交易成功</p>
                    </li>
                    <li style="background:none;">
                        <span><img src="pages/sys/kj/img/lc_18.png" width="32" height="33"></span>
                        <p class="bz">第七步<br>线下交割</p>
                    </li>
                </ul>
            </div>
            <!--项目信息-->
            <div class="zrxq-box-tqb">
                <div class="hd">
                    <ul>
                        <li  class="cur"><a>项目公告</a></li>
                        <li><a>项目概况</a></li>
                        <li><a>挂牌信息</a></li>
                        <li><a>联系方式</a></li>
                    </ul>
                </div>
                <!--项目公告-->
                <div class="bd" style="display: block;">
                    <table class="zrxq-tb-2" width="100%">
                        <div class="detail_binfo">
                            ${resultMap.auction_project_announcement}
                        </div>
                    </table>
                </div>
                <!--项目概况-->
                <div class="bd none" style="display: none;">
                    <table class="zrxq-tb-2" width="100%">
                        <tbody><tr>
                            <th>交易类别</th>
                            <td>${resultMap.auction_transaction_type}</td>
                        </tr>
                        <tr>
                            <th>标的资产名称</th>
                            <td>${resultMap.auction_target_asset_name}</td>
                        </tr>
                        <tr>
                            <th>标的企业性质</th>
                            <td>${resultMap.auction_target_enterprise_nature}</td>
                        </tr>
                        <tr>
                            <th>所在地区</th>
                            <td>${resultMap.auction_location}</td>
                        </tr>
                        <tr>
                            <th>所属行业</th>
                            <td>${resultMap.auction_industry}</td>
                        </tr>
                        <tr>
                            <th>出具法律意见书的律师机构</th>
                            <td>${resultMap.auction_law_firm}</td>
                        </tr>

                        </tbody></table>
                </div>
                <!--挂牌信息-->
                <div class="bd none" style="display: none;">
                    <table class="zrxq-tb-2" width="100%">
                        <tbody><tr>
                            <th>债权本金（万元）</th>
                            <td>${resultMap.auction_creditor_capital}</td>
                        </tr>
                        <tr>
                            <th>其中保证本金（万元）</th>
                            <td>${resultMap.auction_pledge_capital}</td>
                        </tr>
                        <tr>
                            <th>其中抵押本金（万元）</th>
                            <td>${resultMap.auction_mortgage_capital}</td>
                        </tr>
                        <tr>
                            <th>其中质押本金（万元）</th>
                            <td>${resultMap.auction_impawn_capital}</td>
                        </tr>
                        <tr>
                            <th>债权利息（万元）</th>
                            <td>${resultMap.auction_creditor_interest}</td>
                        </tr>
                        <tr>
                            <th>债权孳生息（万元）</th>
                            <td>${resultMap.auction_creditor_yield}</td>
                        </tr>
                        <tr>
                            <th>物权（万元）</th>
                            <td>${resultMap.auction_real_right}</td>
                        </tr>
                        <tr>
                            <th>股权（万元）</th>
                            <td>${resultMap.auction_stock_right}</td>
                        </tr>
                        <!-- <tr>
                          <th>处置公告</th>
                          <td>产权交易转让</td>
                        </tr> -->
                        <tr>
                            <th>重大事项披露</th>
                            <td>${resultMap.auction_major_issues}</td>
                        </tr>
                        </tbody></table>
                </div>
                <div class="bd none" style="display: none;">
                    <table class="zrxq-tb-2" width="100%">
                        <tbody><tr>
                            <th>联系人</th>
                            <td>${resultMap.auction_contacts}</td>
                        </tr>
                        <tr>
                            <th>联系电话</th>
                            <td>${resultMap.auction_contact_number}</td>
                        </tr>

                        </tbody></table>
                </div>

            </div>
        </div>
    </div>
</div>
<!--尾部-->
<div class="personal-footer"></div>
<!-- 公共引入 -->
<script type="text/javascript" src="pages/sys/kj/js/public_two.js"></script>
<script>
    //倒计时开始
    var interval = 1000;
    function ShowCountDown(divname)
    {
        var now = new Date();
        var endTime = '${resultMap.auction_listing_end_time}';
        var yearMonthDay = endTime.split(" ")[0];
        var year = yearMonthDay.split("-")[0];
        var month = yearMonthDay.split("-")[1];
        var day = yearMonthDay.split("-")[2];
        var endDate = new Date(year, month-1, day);
        var leftTime=endDate.getTime()-now.getTime();
        var leftsecond = parseInt(leftTime/1000);
        //var day1=parseInt(leftsecond/(24*60*60*6));
        var day1=Math.floor(leftsecond/(60*60*24));
        var hour=Math.floor((leftsecond-day1*24*60*60)/3600);
        var minute=Math.floor((leftsecond-day1*24*60*60-hour*3600)/60);
        var second=Math.floor(leftsecond-day1*24*60*60-hour*3600-minute*60);
        var cc = document.getElementById(divname);
        cc.innerHTML = ""+day1+"天"+hour+"小时"+minute+"分"+second+"秒";
    }
    window.setInterval(function(){ShowCountDown('divdown1');}, interval);
    //倒计时结束
</script>
<script>
    $('.btn-reduce').click(function(){
        var kvs=$('#auction_price').val();
        var nowkvs=kvs-${resultMap.auction_fare_increase};
        $('#auction_price').val(nowkvs)
    })
    $('.btn-add').click(function(){
        var kvs=$('#auction_price').val();
        var nowkvs=parseInt(kvs)+${resultMap.auction_fare_increase};
        $('#auction_price').val(nowkvs)
    })
</script>
<script type="text/javascript">
    var dqjg = $("#auction_price").val();
    var jjfd = ${resultMap.auction_fare_increase};
    jjfd = dqjg + jjfd ;
    $("#go_auction").click(function(){
    	// yj 原来的价格
    	var yj = parseInt($.trim($("#currPrice").text()));
        var x = parseInt($("#auction_price").val());
//var niming = $("#niming").val();
        if($("#niming").is(':checked')==true){
            var niming = $("#niming").val();
        }
        if($("#zidong").attr("checked")==true){
            var zidong = jjfd;
        }
        var y = $("#url_go").val();
        if(confirm('确定是否以'+x+'元的价格竞价此资产项目？')){
            var user = "${sys_user_name}";
            if (user == "") { alert('竞价资产项目前请您先登录。'); return false; };
            if(x>yj){
           
            $.post('auction/price/save',
                {auction_assets_id:'${resultMap.auction_assets_id}',
                    auction_current_price:x},
                function(data){
                    	debugger
                    	data = data. resultCode;
                    console.log(data);
                    if (data == '-11') { alert('这个竞价不存在或者已经结束。'); }
                    if (data == '2') { alert('您的余额不足，无法以该价格进行出价，请充值后再竞价。'); Go("www.baidu.com");return false; }
                    if (data == '1') { alert('您的出价已经成功，请等待竞价结束访问您的会员中心查看结果。'); }
                    if (data == '4') { alert("您的出价太低，出价必须高于3510000元。(加价幅度为10000元)"); }
                    if (data == '5') { alert('您不能对自己发布的资产项目进行竞价。'); }
                    if (data == '7') { alert('您的上一次自动竞价还未完成，等待完成之后才能再次自动竞价！'); }
                    if (data == '8') { alert('您设定的自动竞价价格有雷同，请设定别的自动竞价价格！'); }
                    if (data == '6') { alert('该资产项目已竞价完成！'); }
                    if (data == '9') { alert('您的保证金账户余额不足，请充值后再竞价！'); Go("www.baidu.com");return false;}
                    if (data == '11') { alert('竞价还未开始，请耐心等待！'); }
                    if (data.resultMsg == 'success') { if(confirm('您成功以'+x+'元的价格秒杀此资产项目，现在跳转页面进行付款？')){ Go(y); return false; }};
            		 history.go(0) 
                });
         	
            }else{
            	alert("竞价金额需大于当前价格！");
            }
            
        }
    });
</script>
</body>
</html>