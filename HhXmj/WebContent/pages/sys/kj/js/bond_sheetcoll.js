
$(function(){
	$("#collection").click(function(){
		$.post("bond/sheet/listcolljson",{"bond_deal":"1"},function(datas){
			console.log(JSON.stringify(datas));
			sheetColl(datas.resultObj.varList);
			pageColl(datas.resultObj.bondSheet,"-1","1");
		});
		$(".pro").click(function(){
			$.post("bond/sheet/listcolljson",{"bond_deal":"1"},function(datas){
			//console.log(JSON.stringify(datas));
			sheetColl(datas.resultObj.varList);
			pageColl(datas.resultObj.bondSheet,"-1","1");
			});
		});
		$(".pack").click(function(){
			$.post("bond/sheet/listcolljson",{"bond_deal":"2"},function(datas){
				//console.log(JSON.stringify(datas));
				sheetColl(datas.resultObj.varList);
				pageColl(datas.resultObj.bondSheet,"-1","2");
			});
			
		});
	});
		
	
//	$.post("bond/sheet/listjson",{},function (datas) {
//    	//console.log(JSON.stringify(datas));
//    	showSheet(datas.resultObj.varList);
//    	page(datas.resultObj.bondSheet);
//    });
//    $.post("bond/accept/listjson",{},function (datas) {
//    	//console.log(JSON.stringify(datas))
//    	showAccept(datas.resultObj.varList);
//    	pageAcc(datas.resultObj.bondAccept,-1);
//    });
});






//报名的分页，上一页、下一页
function preColl(bond_deal){
	var obj =$("#scoll .active").children().text();
	var pageIndex = parseInt(obj);
	if(pageIndex>1){
		pageIndex--;
		pageIndex = pageIndex -1;
		$.post("bond/sheet/listcolljson",{"pageIndex":pageIndex,"bond_deal":bond_deal},function (datas) {
	    	//console.log(JSON.stringify(datas))
	    	sheetColl(datas.resultObj.varList);
	    	pageColl(datas.resultObj.bondSheet,pageIndex,bond_deal);
	    });	
	}
	
	
}
function nextColl(bond_deal){
	var obj = $("#scoll .active").children().text();	
	var end =$("#end").prev().children().text();
	var pageIndex = parseInt(obj);
	
	if(pageIndex<end){
		pageIndex++;
		pageIndex = pageIndex -1;
		$.post("bond/sheet/listcolljson",{"pageIndex":pageIndex,"bond_deal":bond_deal},function (datas) {
	    	//console.log(JSON.stringify(datas))
	    	sheetColl(datas.resultObj.varList);
	    	pageColl(datas.resultObj.bondSheet,pageIndex,bond_deal);
	    });	
	}
	
	
}



//催收																			
function sheetColl(list){
	//console.log(JSON.stringify(list));
	
		var tr1 = $('#sheetOne');
	var temp = '<td>[bond_company_name]</td>'
		+'<td>[bond_deal]</td><td>[bond_sheet_time]</td>'
		+'<td>[bond_lose_efficacy_time]</td>'
		+'<td>[bond_deal_name]</td><td>[bond_deal_phone]</td>'                                                                                                            
		+'<td><a class="jdan sheetcoll">进行催收</a></td>';
	//追加新数据
	for(var i in list){
		var time = list[i].bond_sheet_time;
		var endTime =list[i].bond_lose_efficacy_time;
		time = time.split(" ")[0];
		endTime = endTime.split(" ")[0];
		var deal = list[i].bond_deal;
		if(deal=='1'){
			deal="单笔资产";
		}else{
			deal="资产包";
		}
		console.log('循环开始');
		var tr = $('<tr></tr>');//创建一对tr对象
		//var tds = '<td>'+list[i].code+'</td><td>'+list[i].name+'</td>';
		//tr.append(tds);//将td添加到tr对象中
		tr.data("id",list[i].bond_sheet_id);//绑定数据，便于后续获得id
		tr.data("dispsoal","1");
		tr.append(temp
				.replace('[bond_company_name]',list[i].bond_company_name)
				.replace('[bond_deal]',deal)
				.replace('[bond_sheet_time]',time)
				.replace('[bond_lose_efficacy_time]',endTime)
				.replace('[bond_deal_name]',list[i].bond_deal_name)
				.replace('[bond_deal_phone]',list[i].bond_deal_phone));
		tr1.empty();
		tr1.append(tr);//将tr对象追加tbody
	}
}
	

function pageColl(bondSheet,num,bond_deal){
	var pageIndex = parseInt(bondSheet.pageIndex)+1;
	var total = parseInt(bondSheet.total);
	var pageSize = parseInt(bondSheet.pageSize);
	var page = Math.ceil(total/pageSize);
	console.log("页数有："+page);
	var page1 = $(".pagin");
	page1.empty();
	var start = '<li><a onclick="preColl('+bond_deal+')">&laquo;</a></li>';
	page1.append(start);
	for(var i=0;i<page;i++){
		var im = parseInt(i)+1;
		if(num == -1){
			if(i == 0){
				var ye ='<li class="active"><a onclick="skip('+i+','+bond_deal+');">'+im+'</a></li>';
			}else{
				var ye = '<li><a onclick="skip('+i+','+bond_deal+');">'+im+'</a></li>';
			}
			
		}else if(num == i){
			var ye = '<li class="active"><a onclick="skip('+i+','+bond_deal+');">'+im+'</a></li>';
		}else{
			var ye = '<li><a onclick="skip('+i+','+bond_deal+');">'+im+'</a></li>';
		}
		page1.append(ye);
	}
	var end = '<li id ="end"><a onclick="nextColl('+bond_deal+')">&raquo;</a></li>';
	page1.append(end);
	
}


function skip(i,bond_deal){
	console.log("i:"+i);
	var pageIndex = parseInt(i);
	$.post("bond/sheet/listcolljson",{"pageIndex":pageIndex,"bond_deal":bond_deal},function (datas) {
    	//console.log(JSON.stringify(datas))
    	sheetColl(datas.resultObj.varList);
    	pageColl(datas.resultObj.bondSheet,i,bond_deal);
    });	
}








function showNull(n){
	if(n=="1"){
		$("#dis1").empty().append("<div  style='text-align:center'>暂时没有数据！</div>");
	}else{
		$("#dis2").empty().append("<div  style='text-align:center'>暂时没有数据！</div>");
	}
	
}

























