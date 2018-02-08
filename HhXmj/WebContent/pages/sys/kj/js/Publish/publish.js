//上传图片
function getPath(obj,fileQuery,transImg) {
 
  var imgSrc = '', imgArr = [], strSrc = '' ;
 
  if(window.navigator.userAgent.indexOf("MSIE")>=1){ // IE浏览器判断
  if(obj.select){
   obj.select();
   var path=document.selection.createRange().text;
   alert(path) ;
   obj.removeAttribute("src");
   imgSrc = fileQuery.value ;
   imgArr = imgSrc.split('.') ;
   strSrc = imgArr[imgArr.length - 1].toLowerCase() ;
   if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0){
   obj.setAttribute("src",transImg);
   obj.style.filter=
    "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+path+"', sizingMethod='scale');"; // IE通过滤镜的方式实现图片显示
   }else{
   //try{
   throw new Error('File type Error! please image file upload..'); 
   //}catch(e){
   // alert('name: ' + e.name + 'message: ' + e.message) ;
   //}
   }
  }else{
   // alert(fileQuery.value) ;
   imgSrc = fileQuery.value ;
   imgArr = imgSrc.split('.') ;
   strSrc = imgArr[imgArr.length - 1].toLowerCase() ;
   if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0){
   obj.src = fileQuery.value ;
   }else{
   //try{
   throw new Error('File type Error! please image file upload..') ;
   //}catch(e){
   // alert('name: ' + e.name + 'message: ' + e.message) ;
   //}
   }
 
  }
 
  } else{
  var file =fileQuery.files[0];
  var reader = new FileReader();
  reader.onload = function(e){
 
   imgSrc = fileQuery.value ;
   imgArr = imgSrc.split('.') ;
   strSrc = imgArr[imgArr.length - 1].toLowerCase() ;
   if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0){
   obj.setAttribute("src", e.target.result) ;
   }else{
   //try{
   throw new Error('File type Error! please image file upload..') ;
   //}catch(e){
   // alert('name: ' + e.name + 'message: ' + e.message) ;
   //}
   }
 
   // alert(e.target.result); 
  }
  reader.readAsDataURL(file);
  }
 }
 
 function show(){
   var file_img=document.getElementById("img"),
  iptfileupload = document.getElementById('iptfileupload') ;
  getPath(file_img,iptfileupload,file_img) ;
 }
    //项目名称
    var auction_project_name=document.getElementById("auction_project_name");
    auction_project_name.onblur=function(){
        if(auction_project_name.value){
            auction_project_name.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(auction_project_name.validity.valueMissing){
            auction_project_name.setCustomValidity("项目名称不能为空");
            return;
        };        
    };
    //保证金
    var auction_bail=document.getElementById("auction_bail");
    auction_bail.onblur=function(){
        if(auction_bail.value){
            auction_bail.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(auction_bail.validity.valueMissing){
            auction_bail.setCustomValidity("保证金不能为空");
        };
        if(auction_bail.validity.patternMismatch){
            auction_bail.setCustomValidity("只能输入数字");
        }
    };
     //起拍价
    var auction_starting_price=document.getElementById("auction_starting_price");
    auction_starting_price.onblur=function(){
        if(auction_starting_price.value){
            auction_starting_price.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(auction_starting_price.validity.valueMissing){
            auction_starting_price.setCustomValidity("起拍价不能为空");
        };
        if(auction_starting_price.validity.patternMismatch){
            auction_starting_price.setCustomValidity("只能输入数字");
        }
    };
//  交易类别
    var auction_transaction_type=document.getElementById("auction_transaction_type");
    auction_transaction_type.onblur=function(){
        if(auction_transaction_type.value){
            auction_transaction_type.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(auction_transaction_type.validity.valueMissing){
            marny.setCustomValidity("交易类别为空");
        };
    };
    //  挂牌开始时间
    var auction_listing_start_time=document.getElementById("auction_listing_start_time");
        auction_listing_start_time.onblur=function(){
        if(auction_listing_start_time.value){
            auction_listing_start_time.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(auction_listing_start_time.validity.valueMissing){
            auction_listing_start_time.setCustomValidity("挂牌开始时间不能为空");
        };
        //if(shares.validity.patternMismatch){
        //    shares.setCustomValidity("只能输入正数字且首数字不能为0");
        //}
    };

    //  挂牌结束时间
    var auction_listing_end_time=document.getElementById("auction_listing_end_time");
        auction_listing_end_time.onblur=function(){
        if(auction_listing_end_time.value){
            auction_listing_end_time.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(auction_listing_end_time.validity.valueMissing){
            auction_listing_end_time.setCustomValidity("挂牌结束时间不能为空");
        };
        //if(Unit_Price.validity.patternMismatch){
        //    Unit_Price.setCustomValidity("只能输入正数字");
        //}
    };
     //  标的资产名称
    var auction_target_asset_name=document.getElementById("auction_target_asset_name");
        auction_target_asset_name.onblur=function(){
        if(auction_target_asset_name.value){
            auction_target_asset_name.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(auction_target_asset_name.validity.valueMissing){
            auction_target_asset_name.setCustomValidity("标的资产名称不能为空");
        };
        //if(bail.validity.patternMismatch){
        //    bail.setCustomValidity("只能输入正数字");
        //}
    };
     //  标的企业性质
    var auction_target_enterprise_nature=document.getElementById("auction_target_enterprise_nature");
        auction_target_enterprise_nature.onblur=function(){
        if(auction_target_enterprise_nature.value){
            auction_target_enterprise_nature.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(auction_target_enterprise_nature.validity.valueMissing){
            auction_target_enterprise_nature.setCustomValidity("股权金额不能为空");
        };
        //if(stock.validity.patternMismatch){
        //    stock.setCustomValidity("只能输入正数字");
        //}
    };
    //  所属行业
    var auction_industry=document.getElementById("auction_industry");
        auction_industry.onblur=function(){
        if(auction_industry.value){
            auction_industry.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(auction_industry.validity.valueMissing){
            auction_industry.setCustomValidity("所属行业不能为空");
        }
    };
    //  出具法律意见书的律师机构
    var auction_law_firm=document.getElementById("auction_law_firm");
        auction_law_firm.onblur=function(){
        if(auction_law_firm.value){
            auction_law_firm.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(auction_law_firm.validity.valueMissing){
            auction_law_firm.setCustomValidity("出具法律意见书的律师机构不能为空");
        }
    };
    //  债权本金
    var auction_creditor_capital=document.getElementById("auction_creditor_capital");
        auction_creditor_capital.onblur=function(){
        if(auction_creditor_capital.value){
            auction_creditor_capital.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(auction_creditor_capital.validity.valueMissing){
            auction_creditor_capital.setCustomValidity("债权本金不能为空");
        };
        if(auction_creditor_capital.validity.patternMismatch){
            auction_creditor_capital.setCustomValidity("只能输入正数字");
        }
    };
    //  其中保证本金
    var auction_pledge_capital=document.getElementById("auction_pledge_capital");
        auction_pledge_capital.onblur=function(){
        if(auction_pledge_capital.value){
            auction_pledge_capital.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(auction_pledge_capital.validity.valueMissing){
            auction_pledge_capital.setCustomValidity("其中保证本金不能为空");
        };
        if(auction_pledge_capital.validity.patternMismatch){
            auction_pledge_capital.setCustomValidity("只能输入正数字");
        }
    };
    //  其中抵押本金
    var auction_mortgage_capital=document.getElementById("auction_mortgage_capital");
        auction_mortgage_capital.onblur=function(){
        if(auction_mortgage_capital.value){
            auction_mortgage_capital.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(auction_mortgage_capital.validity.valueMissing){
            auction_mortgage_capital.setCustomValidity("其中抵押本金不能为空");
        };
        if(auction_mortgage_capital.validity.patternMismatch){
            auction_mortgage_capital.setCustomValidity("只能输入正数字");
        }
    };
    //  其中质押本金
    var auction_impawn_capital=document.getElementById("auction_impawn_capital");
        auction_impawn_capital.onblur=function(){
        if(auction_impawn_capital.value){
            auction_impawn_capital.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(auction_impawn_capital.validity.valueMissing){
            auction_impawn_capital.setCustomValidity("其中质押本金不能为空");
        };
        if(auction_impawn_capital.validity.patternMismatch){
            auction_impawn_capital.setCustomValidity("只能输入正数字");
        }
    };
    //  债权利息
    var auction_creditor_interest=document.getElementById("auction_creditor_interest");
        auction_creditor_interest.onblur=function(){
        if(auction_creditor_interest.value){
            auction_creditor_interest.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(auction_creditor_interest.validity.valueMissing){
            auction_creditor_interest.setCustomValidity("债权利息不能为空");
        }
    };
    //  债权孳生息
    var auction_creditor_yield=document.getElementById("auction_creditor_yield");
        auction_creditor_yield.onblur=function(){
        if(auction_creditor_yield.value){
            auction_creditor_yield.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(auction_creditor_yield.validity.valueMissing){
            auction_creditor_yield.setCustomValidity("债权孳生息不能为空");
        };
        if(auction_creditor_yield.validity.patternMismatch){
            auction_creditor_yield.setCustomValidity("只能输入数字");
        }
    };
    //  物权
    var auction_real_right=document.getElementById("auction_real_right");
        auction_real_right.onblur=function(){
        if(auction_real_right.value){
            auction_real_right.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(auction_real_right.validity.valueMissing){
            auction_real_right.setCustomValidity("物权不能为空");
        };
        if(auction_real_right.validity.patternMismatch){
            auction_real_right.setCustomValidity("只能输入数字");
        }
    };
    //  股权
    var auction_stock_right=document.getElementById("auction_stock_right");
        auction_stock_right.onblur=function(){
        if(auction_stock_right.value){
            auction_stock_right.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(auction_stock_right.validity.valueMissing){
            auction_stock_right.setCustomValidity("股权不能为空");
        };
        if(auction_stock_right.validity.patternMismatch){
            auction_stock_right.setCustomValidity("只能输入数字");
        }
    };
    //  重要信息
    var auction_major_issues=document.getElementById("auction_major_issues");
        auction_major_issues.onblur=function(){
        if(auction_major_issues.value){
            auction_major_issues.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(auction_stock_right.validity.valueMissing){
            auction_major_issues.setCustomValidity("重要信息不能为空");
        }
    };
    //  联系人
    var auction_contacts=document.getElementById("auction_contacts");
        auction_contacts.onblur=function(){
        if(auction_contacts.value){
            auction_contacts.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(auction_contacts.validity.valueMissing){
            auction_contacts.setCustomValidity("联系人不能为空");
        }
    };
    //  联系方式
    var auction_contact_number=document.getElementById("auction_contact_number");
    auction_contact_number.onblur=function(){
        if(auction_contact_number.value){
            auction_contact_number.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(auction_contact_number.validity.valueMissing){
            auction_contact_number.setCustomValidity("联系方式不能为空");
        }
    };

    //  上传图片
    var auction_assets_img=document.getElementById("auction_assets_img");
    auction_assets_img.onblur=function(){
        if(auction_assets_img.value){
            auction_assets_img.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(auction_assets_img.validity.valueMissing){
            auction_assets_img.setCustomValidity("请上传图片");
        }
    };