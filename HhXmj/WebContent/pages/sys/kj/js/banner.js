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