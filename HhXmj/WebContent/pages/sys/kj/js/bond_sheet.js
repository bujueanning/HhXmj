
$(function(){
	var sel = $("#sel").val();
	if(sel == '01'){
		var accept = $("#delegationFailedDiv").css("display");
		console.log("样式:"+accept);
		$.post("bond/disposal/listinfo",{"bond_verifys":"2","bond_classify":"1"},function(datas){
			//console.log(JSON.stringify(datas));
			var list = datas.resultObj.varList;
			if(list !=null && list !=""){
				showDisposal(datas.resultObj.varList,"0");
				//分页只需要放入数据库的页数，不用改动
				page(datas.resultObj.bondDisposal);
			}else{
				showNull(1);
			}
			
		});
		$.post("bond/disposal/listinfo",{"bond_verifys":"2","bond_classify":"2"},function(datas){
			var list = datas.resultObj.varList;
			//console.log(JSON.stringify(datas));
			if(list !=null && list !=""){
				showDisposal(datas.resultObj.varList,"block");
				pageAcc(datas.resultObj.bondDisposal,-1,"13");
			}else{
				showNull(2);
			}
			
		});
	}
	
	$("#sel").change(function(){
		var sel = $("#sel").val();
		accept = $("#delegationFailedDiv").css("display");
		if(sel == '01'){
			if(accept!="none"){
				$.post("bond/disposal/listinfo",{"bond_verifys":"2","bond_classify":"2"},function(datas){
					var list = datas.resultObj.varList;
					if(list !=null && list !=""){
						showDisposal(datas.resultObj.varList,accept);
						pageAcc(datas.resultObj.bondDisposal,-1,"13");
					}else{
						showNull(2);
					}
					
				});
			}else{
				$.post("bond/disposal/listinfo",{"bond_verifys":"2","bond_classify":"1"},function(datas){
					var list = datas.resultObj.varList;
					//console.log(JSON.stringify(datas));
					
					if(list !=null && list !=""){
						showDisposal(datas.resultObj.varList,"0");
						page(datas.resultObj.bondDisposal);
					}else{
						showNull(1);
					}
					
				
					
				});
			}
		}else if(sel == '03'){
			if(accept!="none"){
				$.post("bond/disposal/listinfo",{"bond_verify":"2","bond_classify":"2"},function(datas){
					var list = datas.resultObj.varList;
					if(list !=null && list !=""){
						showDisposal(datas.resultObj.varList,accept);
						pageAcc(datas.resultObj.bondDisposal,-1,"2");
					}else{
						showNull(2);
					}
					
				});
			}else{
				$.post("bond/disposal/listinfo",{"bond_verify":"2","bond_classify":"1"},function(datas){
					//console.log(JSON.stringify(datas));
					var list = datas.resultObj.varList;
					if(list !=null && list !=""){
						showDisposal(datas.resultObj.varList,"0");
						page(datas.resultObj.bondDisposal);
					}else{
						showNull(1);
					}
						
				});
			}
		}else{
			if(accept!="none"){
				$.post("bond/accept/listjson",{},function (datas) {
					var list = datas.resultObj.varList;
			    	//console.log(JSON.stringify(datas))
					if(list !=null && list !=""){
						showAccept(datas.resultObj.varList);
			    		pageAcc(datas.resultObj.bondAccept,-1);
					}else{
						showNull(2);
					}
					
			    	
			    });
			}else{
				$.post("bond/sheet/listjson",{},function (datas) {
	       	    	//console.log(JSON.stringify(datas));
					var list = datas.resultObj.varList;
					if(list !=null && list !=""){
						showSheet(datas.resultObj.varList);
			    		page(datas.resultObj.bondSheet);
					}else{
						showNull(1);
					}
			    	
			    });
			}
			
		}
			
			
		
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




$(function(){
$(".pre").click(function(){
		var pageIndex = parseInt($("#pageIndex").text());
		var total = parseInt($("#total").text());
		if(pageIndex>1){
			pageIndex -=1;
			pageIndex = pageIndex-1;
			console.log("真页数:"+pageIndex);
			var num = $(".tr1 th").length;
			if(num == '10'){
				$.post("bond/disposal/listinfo",{"pageIndex":pageIndex},function(datas){
					//console.log(JSON.stringify(datas));
					showDisposal(datas.resultObj.varList);
				})
			}else{
				$.post("bond/sheet/listjson",{"pageIndex":pageIndex},function (datas) {
			    	showSheet(datas.resultObj.varList);
			    });	
			}
			$("#pageIndex").text(pageIndex+1);
		}
	});	
$(".next").click(function(){
		var pageIndex = parseInt($("#pageIndex").text());
		var total = parseInt($("#total").text());
		if(pageIndex<total){
			pageIndex +=1;
			pageIndex = pageIndex-1;
			console.log("真页数:"+pageIndex);
			var num = $(".tr1 th").length;
			if(num == '10'){
				$.post("bond/disposal/listinfo",{"pageIndex":pageIndex},function(datas){
					//console.log(JSON.stringify(datas));
					showDisposal(datas.resultObj.varList);
				})
			}else{
				$.post("bond/sheet/listjson",{"pageIndex":pageIndex},function (datas) {
			    	showSheet(datas.resultObj.varList);
			    });
			}
			$("#pageIndex").text(pageIndex+1);
		}
	});
});

//报名的分页，上一页、下一页
function pre(type){
	var obj =$("#bondshow .active").children().text();
	var pageIndex = parseInt(obj);
	if(pageIndex>1){
		pageIndex--;
		pageIndex = pageIndex -1;
		if(type=="13"){
			$.post("bond/disposal/listinfo",{"pageIndex":pageIndex,"bond_verifys":"2","bond_classify":"2"},function(datas){
				var list = datas.resultObj.varList;
				//console.log(JSON.stringify(datas));
				if(list !=null && list !=""){
					showDisposal(datas.resultObj.varList,"block");
					pageAcc(datas.resultObj.bondDisposal,pageIndex,"13");
				}else{
					showNull(2);
				}
			});
		}else if(type=="2"){
			$.post("bond/disposal/listinfo",{"pageIndex":pageIndex,"bond_verify":"2","bond_classify":"2"},function(datas){
					var list = datas.resultObj.varList;
					if(list !=null && list !=""){
						showDisposal(datas.resultObj.varList,"block");
						pageAcc(datas.resultObj.bondDisposal,pageIndex,"2");
					}else{
						showNull(2);
					}
					
			});
		}else{
			$.post("bond/accept/listjson",{"pageIndex":pageIndex},function (datas) {
	    	//console.log(JSON.stringify(datas))
	    	showAccept(datas.resultObj.varList);
	    	pageAcc(datas.resultObj.bondAccept,pageIndex,type);
	    	});	
		}
	}
	
	
}
function next(type){
	var obj =$("#bondshow .active").children().text();
	var end =$("#end").prev().children().text();
	var pageIndex = parseInt(obj);
	if(pageIndex<end){
		pageIndex++;
		pageIndex = pageIndex -1;
		if(type=="13"){
			$.post("bond/disposal/listinfo",{"pageIndex":pageIndex,"bond_verifys":"2","bond_classify":"2"},function(datas){
				var list = datas.resultObj.varList;
				//console.log(JSON.stringify(datas));
				if(list !=null && list !=""){
					showDisposal(datas.resultObj.varList,"block");
					pageAcc(datas.resultObj.bondDisposal,pageIndex,"13");
				}else{
					showNull(2);
				}
			});
		}else if(type=="2"){
			$.post("bond/disposal/listinfo",{"pageIndex":pageIndex,"bond_verify":"2","bond_classify":"2"},function(datas){
					var list = datas.resultObj.varList;
					if(list !=null && list !=""){
						showDisposal(datas.resultObj.varList,"block");
						pageAcc(datas.resultObj.bondDisposal,pageIndex,"2");
					}else{
						showNull(2);
					}
					
			});
		}else{
			$.post("bond/accept/listjson",{"pageIndex":pageIndex},function (datas) {
	    	//console.log(JSON.stringify(datas))
	    	showAccept(datas.resultObj.varList);
	    	pageAcc(datas.resultObj.bondAccept,pageIndex,type);
	    	});	
		}
		
	}
	
	
}

//报名的
function showAccept(list){
	var tr9 = $(".tr9")
	var trs= '<th width="80">企业名称</th>'
        +'<th width="80">资产编号</th>'
        +'<th width="80">接单时间</th>'
        +'<th width="80">接单处置方</th>'
        +'<th width="80">处置方性质</th>'
        +'<th width="80">联系人</th>'
        +'<th width="80">联系人电话</th>'
        +'<th width="100">操作</th>'
	tr9.empty();
	tr9.append(trs);
	var tBody=$('#dis2');
	tBody.empty();
	var temp = '<td>[bond_company_name]</td>'
		+'<td>[bond_asset_number]</td><td>[bond_accept_time]</td>'
		+'<td>[bond_accept_name]</td><td>[bond_accept_property]</td>'
		+'<td>[bond_deal_name]</td><td>[bond_deal_phone]</td>'                                                                                                            
		+'<td><a class="jdan accept">查看详情</a></td>';
	//追加新数据
	for(var i in list){
		var time = list[i].bond_accept_time;
		time = time.split(" ")[0];
		console.log('循环开始');
		var tr = $('<tr></tr>');//创建一对tr对象
		//var tds = '<td>'+list[i].code+'</td><td>'+list[i].name+'</td>';
		//tr.append(tds);//将td添加到tr对象中
		tr.data("id",list[i].bond_disposal_id);//绑定数据，便于后续获得id
		tr.append(temp
				.replace('[bond_company_name]',list[i].bond_company_name)
				.replace('[bond_asset_number]',list[i].bond_asset_number)
				.replace('[bond_accept_time]',time)
				.replace('[bond_accept_name]',list[i].bond_accept_name)
				.replace('[bond_accept_property]',list[i].bond_accept_property)
				.replace('[bond_deal_name]',list[i].bond_deal_name)
				.replace('[bond_deal_phone]',list[i].bond_deal_phone));
		tBody.append(tr);//将tr对象追加tbody
	}
	
}
//接单的																			
function showSheet(list){
	//console.log(JSON.stringify(list));
	
	var tr1 = $('.tr1');
	tr1.empty();
	var ths = '<th width="80">企业名称</th>'
       + '<th width="80">资产编号</th>'
       + '<th width="80">接单时间</th>'
       +'<th width="80">接单处置方</th>'
       +'<th width="80">联系人</th>'
       +'<th width="80">联系人电话</th>'
       +'<th width="100">操作</th>';
	tr1.append(ths);
	var tBody=$('#dis1');
	//首先清空tbody中数据
	tBody.empty();
	var temp = '<td>[bond_company_name]</td>'
		+'<td>[bond_asset_number]</td><td>[bond_sheet_time]</td>'
		+'<td>[bond_accept_name]</td>'
		+'<td>[bond_deal_name]</td><td>[bond_deal_phone]</td>'                                                                                                            
		+'<td><a class="jdan sheet">查看详情</a></td>';
	//追加新数据
	for(var i in list){
		var time = list[i].bond_sheet_time;
		time = time.split(" ")[0];
		console.log('循环开始');
		var tr = $('<tr></tr>');//创建一对tr对象
		//var tds = '<td>'+list[i].code+'</td><td>'+list[i].name+'</td>';
		//tr.append(tds);//将td添加到tr对象中
		tr.data("id",list[i].bond_disposal_id);//绑定数据，便于后续获得id
		tr.data("dispsoal","1");
		tr.append(temp
				.replace('[bond_company_name]',list[i].bond_company_name)
				.replace('[bond_asset_number]',list[i].bond_asset_number)
				.replace('[bond_sheet_time]',time)
				.replace('[bond_accept_name]',list[i].bond_accept_name)
				.replace('[bond_deal_name]',list[i].bond_deal_name)
				.replace('[bond_deal_phone]',list[i].bond_deal_phone));
		tBody.append(tr);//将tr对象追加tbody
	}
}
	
function page(bond){
	var pageIndex = parseInt(bond.pageIndex)+1;
	var total = parseInt(bond.total);
	var pageSize = parseInt(bond.pageSize);
	var page = Math.ceil(total/pageSize);
	
	$("#total").text(page);
	$("#pageIndex").text(pageIndex);
	console.log("共"+page+"页/当前页："+pageIndex+"页");
}
function pageAcc(bondAccept,num,type){
	var pageIndex = parseInt(bondAccept.pageIndex)+1;
	var total = parseInt(bondAccept.total);
	var pageSize = parseInt(bondAccept.pageSize);
	var page = Math.ceil(total/pageSize);
	console.log("页数有："+page);
	var page1 = $("#bondshow");
	page1.empty();
	var start = '<li><a onclick="pre('+type+')">&laquo;</a></li>';
	page1.append(start);
	for(var i=0;i<page;i++){
		var im = parseInt(i)+1;
		if(num == -1){
			if(i == 0){
				var ye ='<li class="active"><a onclick="skips('+i+','+type+');">'+im+'</a></li>';
			}else{
				var ye = '<li><a onclick="skips('+i+','+type+');">'+im+'</a></li>';
			}
			
		}else if(num == i){
			var ye = '<li class="active"><a onclick="skips('+i+','+type+');">'+im+'</a></li>';
		}else{
			var ye = '<li><a onclick="skips('+i+','+type+');">'+im+'</a></li>';
		}
		page1.append(ye);
	}
	var end = '<li id ="end"><a onclick="next('+type+')">&raquo;</a></li>';
	page1.append(end);
	
}


function skips(i,type){
	console.log("i:"+i);
	var pageIndex = parseInt(i);
	if(type=="13"){
			$.post("bond/disposal/listinfo",{"pageIndex":pageIndex,"bond_verifys":"2","bond_classify":"2"},function(datas){
				var list = datas.resultObj.varList;
				//console.log(JSON.stringify(datas));
				if(list !=null && list !=""){
					showDisposal(datas.resultObj.varList,"block");
					pageAcc(datas.resultObj.bondDisposal,pageIndex,"13");
				}else{
					showNull(2);
				}
			});
		}else if(type=="2"){
			$.post("bond/disposal/listinfo",{"pageIndex":pageIndex,"bond_verify":"2","bond_classify":"2"},function(datas){
					var list = datas.resultObj.varList;
					if(list !=null && list !=""){
						showDisposal(datas.resultObj.varList,"block");
						pageAcc(datas.resultObj.bondDisposal,pageIndex,"2");
					}else{
						showNull(2);
					}
					
			});
		}else{
			$.post("bond/accept/listjson",{"pageIndex":pageIndex},function (datas) {
	    	//console.log(JSON.stringify(datas))
	    	showAccept(datas.resultObj.varList);
	    	pageAcc(datas.resultObj.bondAccept,pageIndex,type);
	    	});	
		}
	
	
}






//资产委外的信息
function showDisposal(list,accept){
	//console.log(JSON.stringify(list));
	var trn =null;
	if(accept == "block"){
	  trn = $(".tr9")
	}else{
	  trn = $('.tr1');
	}
	
	trn.empty();
	var ths = '<th width="80">名称</th>'
        +'<th width="100">资产编号</th>'
        +'<th width="100">债权类型</th>'
        +'<th>欠款(元)</th>'
        +'<th>佣金比例</th>'
        +'<th>逾期时间</th>'
        +'<th>委外期限</th>'
        +'<th>状态</th>'
        +'<th>发布时间</th>'
        +'<th width="100">操作</th>';
	trn.append(ths);
	
	var tBody=null;
	if(accept=="block"){
		tBody=$("#dis2")
	}else{
		tBody=$("#dis1")
	}
	//首先清空tbody中数据
	tBody.empty();
	var temp = '<td>[bond_company_name]</td>'
		+'<td>[bond_asset_number]</td><td>[bond_deal]</td>'
		+'<td>[bond_disposal_arrears]</td>'
		+'<td>[bond_transfer_ratio]</td><td>[bond_overdue]</td><td>[bond_deadline]</td>'                                                                                                            
		+'<td class="verify"><span>[bond_verify]</span></td><td>[bond_release_time]</td>'                                                                                                            
		+'<td><a class="jdan disposal">查看详情</a></td>';
	//追加新数据
	for(var i in list){
		var time = list[i].bond_release_time;
		time = time.split(" ")[0];
		var bond_deal = list[i].bond_deal;
		if(bond_deal=='1'){
			bond_deal="单笔资产";
		}else{
			bond_deal="资产包";
		}
		var bond_verify = list[i].bond_verify;
		if(bond_verify=='1'){
			bond_verify="待审核";
		}else if(bond_verify=='2'){
			bond_verify="待签约";
		}else{
			bond_verify="已退回";
		}
		console.log('循环开始');
		var tr = $('<tr></tr>');//创建一对tr对象
		//var tds = '<td>'+list[i].code+'</td><td>'+list[i].name+'</td>';
		//tr.append(tds);//将td添加到tr对象中
		tr.data("id",list[i].bond_disposal_id);//绑定数据，便于后续获得id
		tr.data("disposal","1");
		tr.append(temp
				.replace('[bond_company_name]',list[i].bond_company_name)
				.replace('[bond_asset_number]',list[i].bond_asset_number)
				.replace('[bond_deal]',bond_deal)
				.replace('[bond_disposal_arrears]',list[i].bond_disposal_arrears)
				.replace('[bond_transfer_ratio]',list[i].bond_transfer_ratio)
				.replace('[bond_overdue]',list[i].bond_overdue)
				.replace('[bond_deadline]',list[i].bond_deadline)
				.replace('[bond_verify]',bond_verify)
				.replace('[bond_release_time]',time)
				);
		if(accept=='block'){
			$("#dis2").append(tr);
		}else{
			tBody.append(tr);//将tr对象追加tbody
		}
		
	}
	
}
//对我的发布中，退回的资产标红
$(function(){
	var verify = $("#dis1 span").text();
	if(verify=='已退回'){
		$(this).css("color","red");
	}
});


function showNull(n){
	if(n=="1"){
		$("#dis1").empty().append("<div  style='text-align:center'>暂时没有数据！</div>");
	}else{
		$("#dis2").empty().append("<div  style='text-align:center'>暂时没有数据！</div>");
	}
	
}

























