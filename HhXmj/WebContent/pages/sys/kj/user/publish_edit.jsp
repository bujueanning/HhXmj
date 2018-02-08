<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
    <link rel="stylesheet" type="text/css" href="pages/sys/kj/css/reset.css?t=201710102113"/>
    <link rel="stylesheet" type="text/css" href="pages/sys/kj/css/style.css?t=201710102113"/>
    <link rel="stylesheet" type="text/css" href="pages/sys/kj/css/user.css?t=201710102113"/>
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
    <script type="text/javascript" src="pages/sys/kj/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/global.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jcarousellite_1.0.1.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/iepng.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jquery.extend.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/main.js"></script>

    <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
    <style type="text/css">
        .thStyle{
            width:130px ;
            border-width:1px;
            text-align:center
        }

        .tdStyle{
            width: 150px;
            border-width:1px;
            text-align:center
        }
    </style>
</head>
<body>
<div class="personal-top"></div>
<!--导航-->
<div class="w1000 bc mt10">
    <form action="auction/assets/save" method="post" enctype="multipart/form-data">
        <div class="space-right publishtable">
            <div class="border p10" style="border-width:0px;">
                <div class="clr"></div>
                <div class="mt10">
                    <table class="table-c-1" width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="publishtitle" colspan="4" style="border: none;    padding-bottom: 30px;">
                                <spant><bold>发布资产信息</bold></spant>
                                <h2 style="float: right;"><a href="pages/sys/kj/index.jsp" style="font-size: 14px; color: darkgrey;">返回 ></a></h2>
                            </td>
                        </tr>
                        <input type="hidden" name="auction_assets_id" id="auction_assets_id" value="${auctionAssets.auction_assets_id}"/>
                        <tr>
                            <th class="thStyle">项目名称</th>
                            <td class="tdStyle" >
                                <input id="auction_project_name" name="auction_project_name" value="${auctionAssets.auction_project_name}" required/>
                            </td>
                            <th class="thStyle">项目所在地</th>
                            <td class="tdStyle">
                                <select class="inpt w200" id="auction_location" name="auction_location" style="float: left;">
                                    <c:forEach items="${dictList}" var="varMap">
                                        <c:if test="${varMap.dict_assets_pid == 'auction_location'}">
                                            <option value="${varMap.dict_assets_key}"
                                                <c:if test="${varMap.dict_assets_key == auctionAssets.auction_location}">selected </c:if>>
                                                    ${varMap.dict_assets_name}
                                            </option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th class="thStyle">产品类</th>
                            <td class="tdStyle">
                                <select class="inpt w200" id="auction_product_solutions" name="auction_product_solutions" style="float: left;">
                                    <c:forEach items="${dictList}" var="varMap" varStatus="vs">
                                        <c:if test="${varMap.dict_assets_pid == 'auction_product_solutions'}">
                                            <option value="${varMap.dict_assets_key}"
                                                    <c:if test="${varMap.dict_assets_key == auctionAssets.auction_product_solutions}">selected </c:if>>
                                                    ${varMap.dict_assets_name}
                                            </option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </td>
                            <th class="thStyle">分类</th>
                            <td class="tdStyle">
                                <select class="inpt w200" id="auction_classify" name="auction_classify" style="float: left;">
                                    <c:forEach items="${dictList}" var="varMap" varStatus="vs">
                                        <c:if test="${varMap.dict_assets_pid == 'auction_classify'}">
                                            <option value="${varMap.dict_assets_key}"
                                                    <c:if test="${varMap.dict_assets_key == auctionAssets.auction_classify}">selected </c:if>>
                                                    ${varMap.dict_assets_name}
                                            </option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th class="thStyle">保证金(万元)</th>
                            <td class="tdStyle">
                                <input id="auction_bail" name="auction_bail" pattern="^[0-9]+(.[0-9]{1,3})?$" value="${auctionAssets.auction_bail}" required/>
                            </td>
                            <th class="thStyle">起拍价(万元)</th>
                            <td class="tdStyle">
                                <input id="auction_starting_price" name="auction_starting_price" pattern="^[0-9]+(.[0-9]{1,3})?$" value="${auctionAssets.auction_starting_price}" required/>
                            </td>
                        </tr>
                        <tr>
                            <th class="thStyle">权属金额</th>
                            <td class="tdStyle">
                                <select class="inpt w200" id="auction_ownership_amount" name="auction_ownership_amount" style="float: left;">
                                    <c:forEach items="${dictList}" var="varMap">
                                        <c:if test="${varMap.dict_assets_pid == 'auction_ownership_amount'}">
                                            <option value="${varMap.dict_assets_key}"
                                                    <c:if test="${varMap.dict_assets_key == auctionAssets.auction_ownership_amount}">selected </c:if>>
                                                    ${varMap.dict_assets_name}
                                            </option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </td>
                            <th class="thStyle">交易类别</th>
                            <td class="tdStyle">
                                <input id="auction_transaction_type" name="auction_transaction_type" value="${auctionAssets.auction_transaction_type}"  required/>
                            </td>
                        </tr>
                        <tr>
                            <th class="thStyle">挂牌开始时间</th>
                            <td class="tdStyle">
                                <input  name="auction_listing_start_time" id="auction_listing_start_time"  type="text" class="form-control datepicker"  value="<fmt:formatDate value="${auctionAssets.auction_listing_start_time}" pattern="yyyy-MM-dd HH:mm:ss" />">
                            </td>
                            <th class="thStyle">
                                挂牌结束时间
                            </th>
                            <td class="tdStyle">
                                <input  name="auction_listing_end_time" id="auction_listing_end_time"  type="text" class="form-control datepicker"  value="<fmt:formatDate value="${auctionAssets.auction_listing_end_time}" pattern="yyyy-MM-dd HH:mm:ss" />">
                            </td>
                        </tr>
                        <tr>
                            <th class="thStyle">标的资产名称</th>
                            <td class="tdStyle">
                                <input id="auction_target_asset_name" name="auction_target_asset_name" value="${auctionAssets.auction_target_asset_name}"  required />
                            </td>
                            <th class="thStyle">标的企业性质</th>
                            <td class="tdStyle">
                                <input id="auction_target_enterprise_nature" name="auction_target_enterprise_nature" value="${auctionAssets.auction_target_enterprise_nature}" required />
                            </td>
                        </tr>
                        <tr>
                            <th class="thStyle">所属行业</th>
                            <td class="tdStyle">
                                <input id="auction_industry" name="auction_industry" value="${auctionAssets.auction_industry}" required  />
                            </td>
                            <th class="thStyle">出具法律意见书的律师机构</th>
                            <td class="tdStyle">
                                <input id="auction_law_firm" name="auction_law_firm" value="${auctionAssets.auction_law_firm}" required />
                            </td>
                        </tr>
                        <tr>
                            <th class="thStyle">债权本金(万元)</th>
                            <td class="tdStyle">
                                <input id="auction_creditor_capital" name="auction_creditor_capital" pattern="^[0-9]+(.[0-9]{1,3})?$" value="${auctionAssets.auction_creditor_capital}" required />
                            </td>
                            <th class="thStyle">其中保证本金(万元)</th>
                            <td class="tdStyle">
                                <input id="auction_pledge_capital" name="auction_pledge_capital" pattern="^[0-9]+(.[0-9]{1,3})?$" value="${auctionAssets.auction_pledge_capital}" required  />
                            </td>
                        </tr>
                        <tr>
                            <th class="thStyle">其中抵押本金(万元)</th>
                            <td class="tdStyle">
                                <input id="auction_mortgage_capital" name="auction_mortgage_capital" pattern="^[0-9]+(.[0-9]{1,3})?$" value="${auctionAssets.auction_mortgage_capital}" required />
                            </td>
                            <th class="thStyle">其中质押本金(万元)</th>
                            <td class="tdStyle">
                                <input id="auction_impawn_capital" name="auction_impawn_capital" pattern="^[0-9]+(.[0-9]{1,3})?$" value="${auctionAssets.auction_impawn_capital}" required />
                            </td>
                        </tr>
                        <tr>
                            <th class="thStyle">债权利息(万元)</th>
                            <td class="tdStyle">
                                <input id="auction_creditor_interest" name="auction_creditor_interest" pattern="^[0-9]+(.[0-9]{1,3})?$" value="${auctionAssets.auction_creditor_interest}" required />
                            </td>
                            <th class="thStyle">债权孳生息(万元)</th>
                            <td class="tdStyle">
                                <input id="auction_creditor_yield" name="auction_creditor_yield" pattern="^[0-9]+(.[0-9]{1,3})?$" value="${auctionAssets.auction_creditor_yield}" required />
                            </td>
                        </tr>
                        <tr>
                            <th class="thStyle">物权(万元)</th>
                            <td class="tdStyle">
                                <input id="auction_real_right" name="auction_real_right" pattern="^[0-9]+(.[0-9]{1,3})?$" value="${auctionAssets.auction_real_right}" required />
                            </td>
                            <th class="thStyle">股权(万元)</th>
                            <td class="tdStyle">
                                <input id="auction_stock_right" name="auction_stock_right" pattern="^[0-9]+(.[0-9]{1,3})?$" value="${auctionAssets.auction_stock_right}" required />
                            </td>
                        </tr>
                        <tr>
                            <td style="width:130px ; border-width:1px;text-align:center" width="120">
                                重要信息
                            </td>
                            <td width="150" style="border-width:1px;" colspan="3">
                                <textarea required id="auction_major_issues" name="auction_major_issues" style="width:100%;" rows="7">${auctionAssets.auction_major_issues}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <th class="thStyle">联系人</th>
                            <td class="tdStyle">
                                <input id="auction_contacts" name="auction_contacts" value="${auctionAssets.auction_contacts}" required />
                            </td>
                            <th class="thStyle">联系方式</th>
                            <td class="tdStyle">
                                <input id="auction_contact_number" name="auction_contact_number" value="${auctionAssets.auction_contact_number}" required />
                            </td>
                        </tr>
                        <tr>
                            <th class="thStyle">项目公告</th>
                            <td width="80%" style="border-width:1px;" colspan="3" >
                                <script id="auction_project_announcement" name="auction_project_announcement" type="text/plain" >${auctionAssets.auction_project_announcement}</script>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:130px ; border-width:1px;text-align:center" width="120">
                                上传照片
                            </td>
                            <td width="150" style="border-width:1px;" colspan="3">
                                <div class="bmxtxzp">
                                    点击上传照片
                                    <input type="file" id="auction_assets_img" name="auction_assets_img" value="" onchange="javascript:checkAttr('91','auction_assets_img','N','N','[\s\S]*.(jpg|jpeg|gif|png|pdf|JPG|JPEG|GIF|PNG)$','','','edit','auction_assets_img','null')">
                                </div>
                                <%--<div class="bmxtxzp">--%>
                                <%--<span id="idCardBackImg_view" style="position:relative;top:-20px;left:-20px;">--%>
                                <%--<input type='file' id='auction_assets_img' name="auction_assets_img" onchange='show()' value='' style="opacity: 0;height: 120px;"/>--%>
                                <%--<img src='pages/sys/kj/img/shipin.png' alt='' id='img' class="span_img"/>--%>
                                <%--</span>--%>
                                <%--<label for="thumbnail" class="col-md-3 control-label">点击上传照片</label>--%>
                                <%--</div>--%>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="mt10">
                    <input class="publishtj" type='submit' value='提交审核'/>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </form>
</div>
<!--尾部-->
<div class="personal-footer"></div>
<!-- 公共引入 -->
<script type="text/javascript" src="pages/sys/kj/js/public.js"></script>
<script type="text/javascript" src="pages/sys/kj/js/Publish/publish.js"></script>
<!-- bootstrap datepicker -->
<script src="plugins/datepicker/bootstrap-datepicker.js"></script>
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
