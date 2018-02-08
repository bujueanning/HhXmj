
$(function(){
	$("#dis2").delegate("a","click",function(){
		var text = $(this).text();
		var bond_disposal_id = $(this).parent().parent().data("id");
		var disposal = $(this).parent().parent().data("disposal");
		console.log(text+"id:"+bond_disposal_id);
		if(disposal=="1"){
			$(this).attr("href","bond/disposal/goed?bond_disposal_id="+bond_disposal_id);
		}else{
			$(this).attr("href","bond/accept/list?bond_disposal_id="+bond_disposal_id);
		}
		
	});
	$("#dis1").delegate("a","click",function(){
		var text = $(this).text();
		var bond_disposal_id = $(this).parent().parent().data("id");
		var disposal =$(this).parent().parent().data("disposal");
		console.log(text+"id:"+bond_disposal_id);
		if(disposal=="1"){
			$(this).attr("href","bond/disposal/goed?bond_disposal_id="+bond_disposal_id);
		}else{
			$(this).attr("href","bond/sheet/goedit?bond_disposal_id="+bond_disposal_id);
		}
		
		
	})
	$("#sheetOne").delegate("a","click",function(){
		$(this).attr("href","http://localhost:8080/huihai/myapp/index.html");
		
	});
	
		
});
	

	
