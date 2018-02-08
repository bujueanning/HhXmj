<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <meta http-equiv="keywords" content="鑫淼聚,资产管理,鑫淼聚资产管理有限公司,投资,理财,基金，私募,集合理财,券商,专户理财,券商资管,资管,定向客户,宏观经济,业绩,领先"/>
    <meta http-equiv="description" content="鑫淼聚资产管理有限公司是中国证券会批准设立的首家券商资产管理公司；自1998年开始从事客户资产管理业务，2002年首批获得从事客户资产管理业务资格，2005年成为首批开展券商集合理财业务的证券公司，2010年成为首家获准设立的券商资产管理公司。 "/>
    <link rel="stylesheet" type="text/css" href="pages/sys/kj/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="pages/sys/kj/css/style.css"/>
    <script type="text/javascript" src="pages/sys/kj/js/jquery-1.8.2.min.js"></script>
</head>
<body style="background-color: #fff;">
<!-- 登陆注册 -->
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
                    <li><a href="pages/sys/kj/contact.jsp" >关于暂停通联支付民生银行卡开户（11月28日15:00起）的通知</a></li>
                    <li><a href="pages/sys/kj/contact.jsp" >个人金融信息安全</a></li>
                    <li><a href="pages/sys/kj/contact.jsp">关于通联支付交易系统暂停邮储银行快捷开户服务的提示</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="wrap" style="background-color: #fff;">
    <div  class="aboutbj img"></div>
    <!--公司简介-->
    <div class="container">
        <div class="wrap-page border-none">
            <div class="w1080 bc">
                <div class="list_left fl">
                    <div class="list_nav">
                        <ul>
                            <li><a href="pages/sys/kj/about.jsp?aa=1" >公司介绍</a></li>
                            <li><a href="pages/sys/kj/contact.jsp" class="cur">联系我们</a></li>
                            <li><a href="pages/sys/kj/about.jsp?aa=2">投资之道</a></li>
                            <li><a href="pages/sys/kj/about.jsp?aa=3">面对面</a></li>
                            <li><a href="pages/sys/kj/about.jsp?aa=4">长期致胜之道</a></li>
                        </ul>
                    </div>
                </div>
                <div class="list_right fl">
                    <div class="font-14 about-content">
                        <div class="fl">
                            <div class="list_con">
                                <h1 class="hd"><span class="hover">联系我们</span></h1>
                                <div >
                                    <div style="width: 100%;height: 300px;margin-bottom:10px;">


                                        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
                                        <meta name="keywords" content="百度地图,百度地图API，百度地图自定义工具，百度地图所见即所得工具">
                                        <meta name="description" content="百度地图API自定义地图，帮助用户在可视化操作下生成百度地图">
                                        <title>天金登</title>
                                        <!-- 引用百度地图API-->
                                        <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&amp;ak=1KrqcmsUp9CHfbGK5qjE1mUWj17eaTjn"></script><script type="text/javascript" src="http://api.map.baidu.com/getscript?v=2.0&amp;ak=1KrqcmsUp9CHfbGK5qjE1mUWj17eaTjn&amp;services=&amp;t=20170803155555"></script>


                                        <!-- 百度地图容器-->
                                        <div id="map" style="width: 700px; height: 300px; border: 1px solid rgb(204, 204, 204); font-size: 12px; overflow: hidden; position: relative; z-index: 0; color: rgb(0, 0, 0); text-align: left; background-color: rgb(243, 241, 236);"><div style="overflow: visible; position: absolute; z-index: 0; left: 0px; top: 0px; cursor: url(http://api0.map.bdimg.com/images/openhand.cur) 8 8, default;"><div class="BMap_mask" style="position: absolute; left: 0px; top: 0px; z-index: 9; overflow: hidden; -webkit-user-select: none; width: 448px; height: 298px;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;"><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 800;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 700;"><span class="BMap_Marker BMap_noprint" unselectable="on" "="" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; width: 20px; height: 25px; left: 208px; top: 142px; z-index: -7985760; background: url(http://api0.map.bdimg.com/images/blank.gif);" title=""></span><span class="BMap_Marker BMap_noprint" unselectable="on" "="" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; width: 18px; height: 18px; left: -12px; top: 100px; z-index: 19000000; -webkit-user-select: none; display: none; background: url(http://api0.map.bdimg.com/images/blank.gif);" title=""></span></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 600;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 500;"><label class="BMapLabel" unselectable="on" style="position: absolute; display: none; cursor: inherit; border: 1px solid rgb(190, 190, 190); padding: 1px; white-space: nowrap; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial, sans-serif; z-index: -20000; color: rgb(190, 190, 190); background-color: rgb(190, 190, 190);">shadow</label><label class="BMapLabel" unselectable="on" style="position: absolute; cursor: inherit; border: 1px solid rgb(140, 140, 140); padding: 1px; white-space: nowrap; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial, sans-serif; z-index: -7985860; -webkit-user-select: none; color: rgb(77, 77, 77); left: 256px; top: 136px; display: none; background-color: rgb(255, 255, 225);">点击可查看详情</label></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 400;"><span class="BMap_Marker" unselectable="on" style="position: absolute; padding: 0px; margin: 0px; border: 0px; width: 0px; height: 0px; left: 208px; top: 142px; z-index: -7985760;"><div style="position: absolute; margin: 0px; padding: 0px; width: 20px; height: 25px; overflow: hidden;"><img src="http://api.map.baidu.com/lbsapi/createmap/images/icon.png" style="display: block; border:none;margin-left:0px; margin-top:3px; "></div><label class="BMapLabel" unselectable="on" style="position: absolute; display: inline; cursor: inherit; border: 1px solid rgb(255, 0, 0); padding: 1px; white-space: nowrap; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial, sans-serif; z-index: 80; -webkit-user-select: none; left: 25px; top: 5px; background-color: rgb(255, 255, 255);">天津金融资产登记结算有限公司</label></span><span class="BMap_Marker" unselectable="on" style="position: absolute; padding: 0px; margin: 0px; border: 0px; width: 0px; height: 0px; left: -12px; top: 100px; z-index: 19000000; display: none;"><div style="position: absolute; margin: 0px; padding: 0px; width: 18px; height: 18px; overflow: hidden;"><img src="http://api0.map.bdimg.com/images/spotmkrs.png" style="display: block; border:none;margin-left:-232px; margin-top:-352px; "></div></span></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 300;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 201;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;"></div></div><div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 1;"><div style="position: absolute; overflow: visible; z-index: -100; left: 224px; top: 149px; display: block; transform: translate3d(0px, 0px, 0px);"><img src="http://online3.map.bdimg.com/tile/?qt=tile&amp;x=12649&amp;y=4714&amp;z=16&amp;styles=pl&amp;scaler=1&amp;udt=20170809" style="position: absolute; border: none; width: 256px; height: 256px; left: -300px; top: -54px; max-width: none; opacity: 1;"><img src="http://online4.map.bdimg.com/tile/?qt=tile&amp;x=12650&amp;y=4714&amp;z=16&amp;styles=pl&amp;scaler=1&amp;udt=20170809" style="position: absolute; border: none; width: 256px; height: 256px; left: -44px; top: -54px; max-width: none; opacity: 1;"><img src="http://online0.map.bdimg.com/tile/?qt=tile&amp;x=12651&amp;y=4714&amp;z=16&amp;styles=pl&amp;scaler=1&amp;udt=20170809" style="position: absolute; border: none; width: 256px; height: 256px; left: 212px; top: -54px; max-width: none; opacity: 1;"><img src="http://online4.map.bdimg.com/tile/?qt=tile&amp;x=12649&amp;y=4715&amp;z=16&amp;styles=pl&amp;scaler=1&amp;udt=20170809" style="position: absolute; border: none; width: 256px; height: 256px; left: -300px; top: -310px; max-width: none; opacity: 1;"><img src="http://online0.map.bdimg.com/tile/?qt=tile&amp;x=12650&amp;y=4715&amp;z=16&amp;styles=pl&amp;scaler=1&amp;udt=20170809" style="position: absolute; border: none; width: 256px; height: 256px; left: -44px; top: -310px; max-width: none; opacity: 1;"><img src="http://online1.map.bdimg.com/tile/?qt=tile&amp;x=12651&amp;y=4715&amp;z=16&amp;styles=pl&amp;scaler=1&amp;udt=20170809" style="position: absolute; border: none; width: 256px; height: 256px; left: 212px; top: -310px; max-width: none; opacity: 1;"></div></div><div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 2; display: none;"><div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 0; display: none;"></div><div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 10; display: none;"></div></div><div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 3;"></div></div><div class="pano_close" title="退出全景" style="z-index: 1201; display: none;"></div><a class="pano_pc_indoor_exit" title="退出室内景" style="z-index: 1201; display: none;"><span style="float:right;margin-right:12px;">出口</span></a><div class=" anchorBL" style="height: 32px; position: absolute; z-index: 30; bottom: 20px; right: auto; top: auto; left: 1px;"><a title="到百度地图查看此区域" target="_blank" href="http://map.baidu.com/?sr=1" style="outline: none;"><img style="border:none;width:77px;height:32px" src="http://api0.map.bdimg.com/images/copyright_logo.png"></a></div><div id="zoomer" style="position:absolute;z-index:0;top:0px;left:0px;overflow:hidden;visibility:hidden;cursor:url(http://api0.map.bdimg.com/images/openhand.cur) 8 8,default"><div class="BMap_zoomer" style="top:0;left:0;"></div><div class="BMap_zoomer" style="top:0;right:0;"></div><div class="BMap_zoomer" style="bottom:0;left:0;"></div><div class="BMap_zoomer" style="bottom:0;right:0;"></div></div><div unselectable="on" class=" BMap_scaleCtrl BMap_noprint anchorBL" style="bottom: 18px; right: auto; top: auto; left: 81px; width: 108px; position: absolute; z-index: 10;"><div class="BMap_scaleTxt" unselectable="on" style="color: black; background-color: transparent;">1000&nbsp;英尺</div><div class="BMap_scaleBar BMap_scaleHBar" style="background-color: black;"><img style="border:none" src="http://api0.map.bdimg.com/images/mapctrls.png"></div><div class="BMap_scaleBar BMap_scaleLBar" style="background-color: black;"><img style="border:none" src="http://api0.map.bdimg.com/images/mapctrls.png"></div><div class="BMap_scaleBar BMap_scaleRBar" style="background-color: black;"><img style="border:none" src="http://api0.map.bdimg.com/images/mapctrls.png"></div></div><div unselectable="on" class=" BMap_omCtrl BMap_ieundefined BMap_noprint anchorBR quad4" style="width: 150px; height: 150px; bottom: 0px; right: 0px; top: auto; left: auto; position: absolute; z-index: 10;"><div class="BMap_omOutFrame" style="width: 149px; height: 149px;"><div class="BMap_omInnFrame" style="bottom: auto; right: auto; top: 5px; left: 5px; width: 142px; height: 142px;"><div class="BMap_omMapContainer" style="overflow: hidden; color: rgb(0, 0, 0); text-align: left; z-index: 0; background-color: rgb(243, 241, 236);"><div style="overflow: visible; position: absolute; z-index: 0; left: 0px; top: 0px; cursor: url(http://api0.map.bdimg.com/images/openhand.cur) 8 8, default;"><div class="BMap_mask" style="position: absolute; left: 0px; top: 0px; z-index: 9; overflow: hidden; -webkit-user-select: none; width: 140px; height: 140px;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;"><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 800;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 700;"><div class="BMap_Division" style="position: absolute; width: 28px; display: block; overflow: hidden; border-width: 1px; border-style: solid; border-color: rgb(173, 207, 244) rgb(39, 75, 139) rgb(39, 75, 139) rgb(132, 176, 223); opacity: 1; z-index: 60; -webkit-user-select: none; left: 55px; top: 59px; height: 19px;"><div class="BMap_omViewInnFrame" style="width: 26px; height: 17px;"><div class="BMap_omViewMask"></div></div></div></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 600;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 500;"><label class="BMapLabel" unselectable="on" style="position: absolute; display: none; cursor: inherit; border: 1px solid rgb(190, 190, 190); padding: 1px; white-space: nowrap; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial, sans-serif; z-index: -20000; color: rgb(190, 190, 190); background-color: rgb(190, 190, 190);">shadow</label></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 400;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 300;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 201;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;"></div></div><div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 1;"><div style="position: absolute; overflow: visible; z-index: -100; left: 70px; top: 70px; display: block; transform: translate3d(0px, 0px, 0px);"><img src="http://online4.map.bdimg.com/tile/?qt=tile&amp;x=790&amp;y=294&amp;z=12&amp;styles=pl&amp;scaler=1&amp;udt=20170809" style="position: absolute; border: none; width: 256px; height: 256px; left: -162px; top: -83px; max-width: none; opacity: 1;"></div></div><div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 2; display: none;"><div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 0; display: none;"></div><div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 10; display: none;"></div></div><div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 3;"></div></div><div class="pano_close" title="退出全景" style="z-index: 1201; display: none;"></div><a class="pano_pc_indoor_exit" title="退出室内景" style="z-index: 1201; display: none;"><span style="float:right;margin-right:12px;">出口</span></a></div><div class="BMap_omViewMv" style="cursor: url(http://api0.map.bdimg.com/images/openhand.cur) 8 8, default; width: 28px; height: 19px; left: 55px; top: 59px;"><div class="BMap_omViewInnFrame" style="width: 26px; height: 17px;"><div></div></div></div></div></div><div class="BMap_omBtn" style="bottom: 0px; right: 0px; top: auto; left: auto;"></div></div><div unselectable="on" class=" BMap_stdMpCtrl BMap_stdMpType0 BMap_noprint anchorTL" style="width: 62px; height: 192px; bottom: auto; right: auto; top: 10px; left: 10px; position: absolute; z-index: 1100;"><div class="BMap_stdMpPan" style="background-position: 0px 0px;"><div class="BMap_button BMap_panN" title="向上平移"></div><div class="BMap_button BMap_panW" title="向左平移"></div><div class="BMap_button BMap_panE" title="向右平移"></div><div class="BMap_button BMap_panS" title="向下平移"></div><div class="BMap_stdMpPanBg BMap_smcbg"></div></div><div class="BMap_stdMpZoom" style="height: 147px; width: 62px;"><div class="BMap_button BMap_stdMpZoomIn" title="放大一级" style="background-position: 0px -221px;"><div class="BMap_smcbg"></div></div><div class="BMap_button BMap_stdMpZoomOut" title="缩小一级" style="top: 126px; background-position: 0px -265px;"><div class="BMap_smcbg"></div></div><div class="BMap_stdMpSlider" style="height: 108px;"><div class="BMap_stdMpSliderBgTop" style="height: 108px;"><div class="BMap_smcbg"></div></div><div class="BMap_stdMpSliderBgBot" style="top: 19px; height: 93px;"></div><div class="BMap_stdMpSliderMask" title="放置到此级别"></div><div class="BMap_stdMpSliderBar" title="拖动缩放" style="cursor: url(http://api0.map.bdimg.com/images/openhand.cur) 8 8, default; top: 19px;"><div class="BMap_smcbg"></div></div></div><div class="BMap_zlHolder"><div class="BMap_zlSt"><div class="BMap_smcbg"></div></div><div class="BMap_zlCity"><div class="BMap_smcbg"></div></div><div class="BMap_zlProv"><div class="BMap_smcbg"></div></div><div class="BMap_zlCountry"><div class="BMap_smcbg"></div></div></div></div><div class="BMap_stdMpGeolocation" style="position: initial; display: none; margin-top: 43px; margin-left: 10px;"><div class="BMap_geolocationContainer" style="position: initial; width: 24px; height: 24px; overflow: hidden; margin: 0px; box-sizing: border-box;"><div class="BMap_geolocationIconBackground" style="width: 24px; height: 24px; background-image: url(http://api0.map.bdimg.com/images/navigation-control/geolocation-control/pc/bg-20x20.png); background-size: 20px 20px; background-position: 3px 3px; background-repeat: no-repeat;"><div class="BMap_geolocationIcon" style="position: initial; width: 24px; height: 24px; cursor: pointer; background-image: url('http://api0.map.bdimg.com/images/navigation-control/geolocation-control/pc/success-10x10.png'); background-size: 10px 10px; background-repeat: no-repeat; background-position: center;"></div></div></div></div></div><div unselectable="on" class=" BMap_cpyCtrl BMap_noprint anchorBL" style="cursor: default; white-space: nowrap; color: black; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 11px; line-height: 15px; font-family: arial, sans-serif; bottom: 2px; right: auto; top: auto; left: 2px; position: absolute; z-index: 10; background: none;"><span _cid="1" style="display: inline;"><span style="background: rgba(255, 255, 255, 0.701961);padding: 0px 1px;line-height: 16px;display: inline;height: 16px;">©&nbsp;2017 Baidu - GS(2016)2089号&nbsp;- Data © 长地万方</span></span></div></div>
                                        <!-- <p style="color:red;font-weight:600">地图生成工具基于百度地图JS api v2.0版本开发，使用请申请密匙。-->
                                        <!-- <a href="http://developer.baidu.com/map/index.php?title=jspopular/guide/introduction" style="color:#2f83c7" target="_blank">了解如何申请密匙</a>-->
                                        <!-- <a href="http://lbsyun.baidu.com/apiconsole/key?application=key" style="color:#2f83c7" target="_blank">申请密匙</a>-->
                                        <!-- </p>-->

                                        <script type="text/javascript">
                                            //创建和初始化地图函数：
                                            function initMap(){
                                                createMap();//创建地图
                                                setMapEvent();//设置地图事件
                                                addMapControl();//向地图添加控件
                                                addMapOverlay();//向地图添加覆盖物
                                            }
                                            function createMap(){
                                                map = new BMap.Map("map");
                                                map.centerAndZoom(new BMap.Point(114.487303,38.04117),18);
                                            }
                                            function setMapEvent(){
                                                map.enableScrollWheelZoom();
                                                map.enableKeyboard();
                                                map.enableDragging();
                                                map.enableDoubleClickZoom()
                                            }
                                            function addClickHandler(target,window){
                                                target.addEventListener("click",function(){
                                                    target.openInfoWindow(window);
                                                });
                                            }
                                            function addMapOverlay(){
                                                var markers = [
                                                    {content:"我的备注",title:"鑫淼聚资产交易有限公司",imageOffset: {width:0,height:3},position:{lat:38.04117,lng:114.487303}}
                                                ];
                                                for(var index = 0; index < markers.length; index++ ){
                                                    var point = new BMap.Point(markers[index].position.lng,markers[index].position.lat);
                                                    var marker = new BMap.Marker(point,{icon:new BMap.Icon("http://api.map.baidu.com/lbsapi/createmap/images/icon.png",new BMap.Size(20,25),{
                                                        imageOffset: new BMap.Size(markers[index].imageOffset.width,markers[index].imageOffset.height)
                                                    })});
                                                    var label = new BMap.Label(markers[index].title,{offset: new BMap.Size(25,5)});
                                                    var opts = {
                                                        width: 200,
                                                        title: markers[index].title,
                                                        enableMessage: false
                                                    };
                                                    var infoWindow = new BMap.InfoWindow(markers[index].content,opts);
                                                    marker.setLabel(label);
                                                    addClickHandler(marker,infoWindow);
                                                    map.addOverlay(marker);
                                                };
                                            }
                                            //向地图添加控件
                                            function addMapControl(){
                                                var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
                                                scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
                                                map.addControl(scaleControl);
                                                var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
                                                map.addControl(navControl);
                                                var overviewControl = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:true});
                                                map.addControl(overviewControl);
                                            }
                                            var map;
                                            initMap();
                                        </script>
                                    </div>
                                </div>
                                <div id="context"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <!--联系方式-->
</div>
<!--尾部-->
<div class="personal-footer"></div>
<!-- 公共引入 -->
<script type="text/javascript" src="pages/sys/kj/js/public_two.js"></script>
<script type="text/javascript">
	$(function(){
		$(".nav_sub").children().children().removeClass('libg');
	});
</script>
<script type="text/javascript">
    window.onload = function () {
        $.ajax({
            url: "about/us/details",
            data: {title: "联系我们"},
            async: false,
            success: function (data) {
                var json = data.resultObj;
                console.log(json);
                $(".hover").html(json.title);
                $("#context").html(json.aboutUsInfo.text);
            }
        })
    }
</script>
</body>
</html>
