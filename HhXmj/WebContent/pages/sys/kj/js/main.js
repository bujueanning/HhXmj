//公告栏单条滚动
var sh;
clearInterval(sh);
function AutoScroll(obj){
	$(obj).find("ul").stop().animate({
			marginTop:"-25px"
	},1000,function(){
			$(this).css({marginTop:"0px"}).find("li:first").appendTo(this);
	});
}

$(function() {
	//执行滚动
	sh=setInterval('AutoScroll(".gonggao-box")',3000);

	//二级菜单显示
	$(".header-nav ul li").hover(function(){
		$(this).find("ol").show();
		},function(){
		$(this).find("ol").hide();
	});
	
	//资产转让详情切换
	$(".zrxq-box-tqb .hd ul li").click(function(){
		var index=$(this).index(); 
		$(this).addClass("cur").siblings().removeClass();
		$(".zrxq-box-tqb .bd").eq(index).show().siblings(".zrxq-box-tqb .bd").hide();
		})
});