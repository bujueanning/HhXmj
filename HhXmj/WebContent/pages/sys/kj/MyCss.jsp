<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyCss.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.box {width: 1600px;height: 350px;border: solid 1px #CCC;padding: 5px;}       
	    .box .box1 {width: 1600px;height: 350px;position: relative;overflow: hidden;}         
	    .box .box1 .picbox {width: 1600px;height: 350px;position: relative;display: none;}        
	    .box .box1 .picbox .shadow {width: 100%;height: 30px;position: absolute;bottom: 0px;left: 0px;background: #666;opacity: 0.5;filter: alpha(opacity=50);}       
	    .box .box1 .picbox .title {margin: 0;padding: 0;width: 350px;height: 30px;line-height: 30px;position: absolute;bottom: 0px;left: 0px;text-indent: 0.5em;color: #FFF;}         
	    .box1 .picbtn {width: 155px;height: 30px;position: absolute;right: 0px;bottom: -8px;}         
	    .box1 .picbtn a {width: 25px;height: 12px;display: block;float: left;margin-right: 5px;background-color: #50f0d8;}        
	    .box1 .picbtn a.act {background-color: #FFF;}  
	</style>
  </head>
  
  <body>  
    <div class="box" id="box">          
        <div class="box1">              
            <div class="picbox" style="display:block;">                 
                <img src="http://gtms03.alicdn.com/tps/i3/TB1HlZvFVXXXXcxXVXXBNVOLXXX-1600-350.jpg" />                  
                <div class="shadow"></div>  
                <p class="title">图片一</p>  
            </div>              
            <div class="picbox">  
                <img src="http://gtms04.alicdn.com/tps/i4/TB14d.tFVXXXXb9XFXXBNVOLXXX-1600-350.jpg" />  
                <div class="shadow"></div>  
                <p class="title">图片二</p>  
            </div>  
            <div class="picbox">  
                <img src="http://gtms04.alicdn.com/tps/i4/TB1XTEZFVXXXXaZXXXXBNVOLXXX-1600-350.jpg" />  
                <div class="shadow"></div>                
                <p class="title">图片三</p>              
            </div>              
            <div class="picbox">                
                <img src="http://gtms01.alicdn.com/tps/i1/TB1DzIJFVXXXXcDXpXXBNVOLXXX-1600-350.jpg" />                  
                <div class="shadow"></div>                
                <p class="title">图片四</p>              
            </div>              
            <div class="picbox">                
                <img src="http://gtms01.alicdn.com/tps/i1/TB1ak8EFVXXXXaXapXXBNVOLXXX-1600-350.jpg" />                  
                <div class="shadow"></div>                
                <p class="title">图片五</p>              
            </div>              
            <div class="picbtn" id="btn">               
                <a href="javascript:void(0)" class="act"></a>                 
                <a href="javascript:void(0)"></a>                 
                <a href="javascript:void(0)"></a>                 
                <a href="javascript:void(0)"></a>                 
                <a href="javascript:void(0)"></a>             
            </div>          
        </div>      
    </div>  
    <script type="text/javascript" src="pages/sys/kj/js/banner.js"></script>
    <!-- 
    <script type="text/javascript">
    	window.onload = function(){  
    var oBox = document.getElementById('box');  
    var oBtn = document.getElementById('btn');            
    var aBtn = oBtn.getElementsByTagName('a');          //alert(aBtn.length);             
    var aPicText = getByclass('picbox', oBox);            
    for (var i = 0; i < aBtn.length; i++) {                
        aBtn[i].index = i;              //先隐藏全部，在单独显示选中的                  
        aBtn[i].onmouseover = function() {                    
            for (var n = 0; n < aBtn.length; n++) {                        
                aPicText[n].style.display = "none";                       
                aBtn[n].className = '';                   
            }                     
            aPicText[this.index].style.display = "block"                      
            this.className = 'act';               
        }  
        aBtn[i].onclick = function() {                    
            for (var n = 0; n < aBtn.length; n++) {                        
                aPicText[n].style.display = "none";                       
                aBtn[n].className = '';                   
            }                     
            aPicText[this.index].style.display = "block"                      
            this.className = 'act';               
        }  
    }           //得到class为picBox的div              
    function getByclass(sName, oParent) {                 
        var obj = oParent.getElementsByTagName('*');                  
        var result = [];                  
        for (var i = 0; i < obj.length; i++) {                     
            if (obj[i].className == sName) {                          
                result.push(obj[i]);                      
            }                 
        }                 
        return result;            
    }  
    setInterval(function(){  
        for (var n = 0; n < aBtn.length; n++) {    
            if(aPicText[n].style.display == 'block' && aBtn[n].className == 'act'){  
                aPicText[n].style.display = "none";  
                aBtn[n].className = '';  
                if(n==aBtn.length-1){  
                    aPicText[0].style.display = "block";  
                    aBtn[0].className = 'act';  
                }else{  
                    aPicText[n+1].style.display = "block";  
                    aBtn[n+1].className = 'act';                      
                }  
                break;  
            }  
        }  
    },5000);  
}     
    </script>
     -->
</body>  
</html>
