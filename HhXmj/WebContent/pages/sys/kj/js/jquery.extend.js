/**
 * jquery 鎵╁睍鍑芥暟搴�
 * majf 2010.9
 * Email:majf@hundsun.com
 * 鍘嬬缉鍦板潃锛歨ttp://closure-compiler.appspot.com/home
 */
$.extend({
        showQuestionByIndex: function(index){
           $(".question2").hide();
           $("#J_question"+index).show();
           $("#J_turnPageSelect").get(0).selectedIndex=index-1;
           var t = 0;
           for(var i=1;i<=10;i++){
             var v = $.getRadioCheckedValueByName("subRisk.radio"+i);
             if(v!=null){
                t++;
             }
           }
           t = parseInt(t)*10;
           $("#J_step").attr("src",$("#J_img_base_url").val()+t+"p.gif");
           $("#J_wcd").html(t+"%");
           if(index==10){
               $("#J_tips").html("缁堜簬绛斿畬浜嗭紝<br>椹笂鐪嬬湅娴嬭瘯缁撴灉锛�");
               $(".next").attr("src",$("#J_img_base_url").val()+"lookresult.gif");
           }else if(index==1){
               $("#J_tips").html("10閬撻棶棰橈紝<br>寰堝揩灏辫兘瀹屾垚锛�");
               $(".next").attr("src",$("#J_img_base_url").val()+"next.gif");
           }else{
               $("#J_tips").html("璇峰瀹炲洖绛旓紝<br>浠ヨ幏寰楁渶浣虫祴璇曟晥鏋滐紒");
               $(".next").attr("src",$("#J_img_base_url").val()+"next.gif");
           }
        },
        checkedFlag: function(index){
            var v = $('input[name=radio'+index+']:checked').val();
            if(v==null){
                return false;
            }else{
                return true;
            }
        },
        getRadioCheckedValueByName:function(name){
            return $('input[name='+name+']:checked').val();
        },
        setCookie:function(name ,value){
            var Days = 365;
            var exp  = new Date();
            exp.setTime(exp.getTime() + Days*24*60*60*1000);
            document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString()+";path=/";
        },
        getCookie:function(name){
            var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
            if(arr != null){
              return unescape(arr[2]);
            }else{
              return null;
            }
        },
        getCookie:function(name,defaultValue){
            var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
            if(arr != null){
              return unescape(arr[2]);
            }else{
              return defaultValue;
            }
        },
        delCookie:function(name){
            var exp = new Date();
            exp.setTime(exp.getTime() - 1);
            var cval=getCookie(name);
            if(cval!=null)
                document.cookie= name + "="+cval+";expires="+exp.toGMTString();
        },     
       isNumber:function(oNum){
          if(!oNum) return false;
          var strP=/^\d+(\.\d+)?$/;
          if(!strP.test(oNum))
            return false;
           try{
             if(parseFloat(oNum)!=oNum) return false;
            }catch(ex){
              return false;
            }
             return true;
        },
       roundFun:function(numberRound,roundDigit){
          if(numberRound>=0) {
                  var   tempNumber   =   parseInt((numberRound   *   Math.pow(10,roundDigit)+0.5))/Math.pow(10,roundDigit);
                  return   tempNumber;
           }else{
             numberRound1=-numberRound
             var   tempNumber   =   parseInt((numberRound1   *   Math.pow(10,roundDigit)+0.5))/Math.pow(10,roundDigit);
             return   -tempNumber;
           }
        },
        checkFormInputIsValid:function(json){
           if(json!=null){
               var l = json.length;
               for(var i=0;i<l;i++){
                   var v = $("#"+json[i].id).val();
                   if($.trim(v)=="" && !json[i].isAllowBlank){
                       alert(json[i].name+"蹇呴』濉啓锛�")
                       return false;
                   }
                   if($.trim(v)!="" && json[i].isNum && ($.isNumber(v)==false||parseFloat(v)<0)){
                       alert(json[i].name+"杈撳叆涓嶅悎娉�!");
                       return false;
                   }
                   if($.trim(v)!="" && json[i].isNum && parseFloat(v)==0){
                       $("#"+json[i].id).val("");
                   }
               }
           }
           return true;
        },
        getUrlParamByName:function(name){
          var LocString=String(window.document.location.href);
          var rs = new RegExp("(^|)"+name+"=([^\&]*)(\&|$)","gi").exec(LocString), tmp;
          if(tmp=rs){
             return tmp[2];
           }else{
             return null;
           }
        },
        isEmpty:function(str){
            if(str!=null){
                if($.trim(str)!=""){
                    return false;
                }
            }
            return true;
        },
        isInteger:function(num){
            if(parseInt(num)==num){
                return true;
            }
            return false;
        },
        isFloat:function(num){
            if(parseFloat(num)==num){
                return true;
            }
            return false;
        }
        ,
        division:function(molecular, denominator){
           if($.isNumber(molecular)==false || $.isNumber(denominator)==false ){
               return "--";
           }else if(denominator==0){
               return "--";
           }else{
               return $.roundFun(molecular/denominator,2);
           }
        },
        divisionHundPercent:function(molecular, denominator){
           if($.isNumber(molecular)==false || $.isNumber(denominator)==false ){
               return "--";
           }else if(denominator==0){
               return "--";
           }else{
               var v = (molecular/denominator)*100;
               return $.roundFun(v,2)+"%";
           }
        },
        divisionHund:function(molecular, denominator){
           if($.isNumber(molecular)==false || $.isNumber(denominator)==false ){
               return 0;
           }else if(denominator==0){
               return 0;
           }else{
               var v = (molecular/denominator)*100;
               return $.roundFun(v,2);
           }
        },
        substruction:function(sub1,sub2,defaultValue){
           if($.isNumber(sub1)==false || $.isNumber(sub2)==false ){
               return defaultValue;
           }else{
               var v = parseFloat(sub1)-parseFloat(sub2);
               return $.roundFun(v,2);
           }
        },
        countIntgerValue:function(array){
            var total = 0;
            if(array!=null&&array.length>0){
                var l = array.length;
                for(var i=0;i<l;i++){
                   var v = $("#"+array[i]).val();
                    if($.isInteger(v)){
                        total+=parseInt(v)
                    }
                }
            }
            return total;
        },
        countFloatValue:function(array){
            var total = 0.0;
            if(array!=null&&array.length>0){
                var l = array.length;
                for(var i=0;i<l;i++){
                   var v = $("#"+array[i]).val();
                    if($.isFloat(v)){
                        total+=parseFloat(v)
                    }
                }
            }
            total = $.roundFun(total,2);
            return total;
        },
        coutNeedEduFund:function(h,u,g){
          var total = 0.0;
          if($.isNumber(h)){
              total+=parseFloat(h)*3;
          }
          if($.isNumber(u)){
              total+=parseFloat(u)*4;
          }
          if($.isNumber(g)){
              total+=parseFloat(g)*3;
          }
            return total;
        },
        countNeedEldFund:function(f,a){
            if($.isNumber(f)){
                if($.isNumber(a)){
                    return parseFloat(f)*12*parseFloat(a);
                }else{
                    return parseFloat(f)*12*parseFloat(20);
                }
            }else{
                return 0.0;
            }
        }
        ,
        formatStrToFloat:function(str,defaultValue){
           if($.isNumber(str)){
               return  parseFloat(str);
           }else{
               if($.isNumber(defaultValue)){
                 return defaultValue;
               }else{
                 return 0;
               }
           }
        },
        initStepRs:function(){
           if($("#J_rs_goal")!=null){
               if($("#J_rs_goal").html()==""){
                   $("#J_rs_goal").html("鏈缃�");
               }
           }
           if($("#J_rs_sub")!=null){
               if($("#J_rs_sub").html()==""){
                   $("#J_rs_sub").html("鏈缃�");
               }
           }
           if($("#J_rs_obj")!=null){
               if($("#J_rs_obj").html()==""){
                   $("#J_rs_obj").html("鏈祴璇�");
               }
           }
        }
 });