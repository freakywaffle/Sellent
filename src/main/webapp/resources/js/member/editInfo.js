window.addEventListener("load",function(){
  
	var picEdit = document.querySelector("input[name='picedit']");
	var picDel = document.querySelector("input[name='picdel']");
	var editBtn = document.querySelector("input[name='editBtn']");
	var input1 = document.querySelector("input[name='photo']");
	
	 //var imgInp = document.querySelector(".imgInp");
     //var input = document.querySelector("input[type='file']");
   
     input1.addEventListener("change",function(){
   	
       readURL(this);
   });
  
     function readURL(){
         if(input1.files && input1.files[0]){
             var reader = new FileReader();
             reader.onload = function(e){
               console.log(e.target.result);
               var blah = document.getElementById("blah");
               blah.setAttribute('src',e.target.result);
               //alert(blah.getAttribute('src'));
               
             }
             reader.readAsDataURL(input1.files[0]);
         }
     }
	
	picEdit.addEventListener("click",function(){
		//alert("edit");
		var evt = new MouseEvent("click",{
  			"view":window,
  			"bubbles":true,
  			"cancelable":true
  		});

  		input1.dispatchEvent(evt);
	});
	picDel.addEventListener("click",function(){
		alert("cancle");
		
	});

        var pwdDouble = document.querySelector("input[name='pwdDoubleInput']");
        pwdDouble.addEventListener('keyup',function(){
      	  var pw = document.querySelector("input[name='password']").value;
      	  var pwck = document.querySelector("input[name='pwdDoubleInput']").value;
            if(pw != pwck){
          	  var warning = document.getElementById("warning");
          	  warning.style.display="block";
          	  warning.innerText = "비밀번호 다시입력";
          	  warning.style.color="red";
          	  
            }
            else{
          	  var warning = document.getElementById("warning");
          	  warning.style.display="block";
          	  warning.innerText = "비밀번호 사용가능";
          	  warning.style.color="blue";
            }
        });
        
        var email = document.querySelector(".email");
        var emailBtn = email.querySelector("input[type='button']");
  	    var emailInput = email.querySelector("input[name='email']");

        emailBtn.addEventListener("click",function(){
        	alert("show");
      	  var xml = new XMLHttpRequest();   	  
      	  xml.open('POST','email-send');
      	  xml.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
      	   	  
      	  xml.onload = function(){
    
  				var emailchk = document.querySelector(".emailchk");
  				emailchk.classList.remove('hidden');
  							
  				var emailChkBtn = emailchk.querySelector("input[type='button']");
  				
  				emailChkBtn.addEventListener("click",function(){
  					var emailChkInput = emailchk.querySelector("input[type='text']").value;
  					if(xml.responseText == emailChkInput) alert("인증되었습니다");
  					else alert("인증에 실패되었습니다.");
  				});
  			}
      	 xml.send("email="+emailInput.value);   
        });
        
    	
    	editBtn.addEventListener("click",function(){
    		uploadfile();
    		
    	});
    	
    	  function uploadfile() {
        	  var file = document.querySelector("input[name='photo']");
              var filedata = new FormData(); // FormData 인스턴스 생성
            
              if (!file.value) return; // 파일이 없는 경우 빠져나오기
            
              filedata.append('uploadfile', file.files[0]);
            
              var xml = new XMLHttpRequest();
              xml.open('POST', 'file-upload', true);
              //uestHeader('Content-Type', 'application/x-www-form-urlencoded');
              xml.onload = function(event) {
               
              };
              xml.send(filedata);

            }; 
            
});


