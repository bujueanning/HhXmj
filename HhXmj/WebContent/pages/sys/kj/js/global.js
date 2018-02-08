$(document).ready(function() {
	init();
	checkInput();
});
var openurl = "https://ec.dfham.com/etrading/";
function init(){
	$('.btn_close').on('click',function(){
		hideTan();
	});
	$('.a_yuyue').on('click',function(){
		showTan('.tan_yuyue',true);
        $("#fundnames").val($(this).attr("tag"));
	});
	$('.a_buy_gdlc').on('click',function(){
        var tongyi = $.getCookie("index-attend","");//cookie
        if(typeof($(this).attr("openurl"))!="undefined")
            openurl = $(this).attr("openurl");
        if (tongyi.length == 0){//鍒ゆ柇cookie鏄惁鏈夊€�
		    showTan('.tan_dingtou',true);
        }else{
            window.open(openurl);
        }
	});

	changeTagCont('.index_gdlc h3','.index_gdlc_c');
	changeTagCont('.ul_qxjj','.table_gdlc');
	changeTagCont('.news .h3_1','.index_news_c');

	//jQuery(".banner_c").slide({
		//autoPlay:true,
		//delayTime:800,
		//interTime:5000,
		//autoPage:true,
		//effect:'leftLoop',
		//mainCell:".bd ul",
		//titCell:'.banner_nav ul'
	//});
	//jQuery(".banner1").slide({
		//autoPlay:true,
		//delayTime:800,
		//interTime:5000,
		//autoPage:true,
		//effect:'leftLoop',
		//mainCell:".banner1_c ul",
		//titCell:'.banner1_nav ul'
	//});
	//jQuery(".notices").slide({
		//autoPlay:true,
		//delayTime:500,
		//interTime:5000,
		//effect:'topLoop',
		//mainCell:".bd ul"
	//});
	$('.banner_nav ul').width($('.banner_nav li').length*20);
	$('.banner1_nav ul').width($('.banner_nav li').length*19);
}

function changeTagCont(tag,cont){
	$(tag).each(function(j){
		$(tag).eq(j).find('li').each(function(i){
			$(this).on('hover',function(){
				$(tag).eq(j).find('li').removeClass('li_curr').eq(i).addClass('li_curr');
				$(tag).eq(j).siblings(cont).hide().eq(i).show();
			})
		});
	});
	/*$(tag+' li').each(function(i){
		$(this).on('click',function(){
			$(tag+' li').removeClass('li_curr').eq(i).addClass('li_curr');
			$(cont).parent().find(cont).hide().eq(i).show();
		})
	});*/
}
function showTan(div,hasmask){
	$('.tan').hide();
	if(hasmask) $('.maskyy').show();
	$(div).show();
	$(div).css('margin-top','-'+$(div).height()/2+'px');
}
function hideTan(){
	$('.maskyy,.tan').hide();
}
function checkInput(){
	$(".inputFocus").focus(function(){
		$(this).addClass("focus");
		if( $(this).val()==this.defaultValue ){  
			$(this).val("");           
		} 
	}).blur(function(){
		if ( $(this).val()=='' ) {
			$(this).val(this.defaultValue);
			$(this).removeClass("focus");
		}
	});	
}