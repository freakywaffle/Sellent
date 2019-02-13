window.addEventListener("load",function(){
  /*   uploadFile = function() {
        var file = document.getElementById('imgInp');
        var filedata = new FormData(); // FormData 인스턴스 생성
      
        if (!file.value) return; // 파일이 없는 경우 빠져나오기
      
        filedata.append('uploadfile', file.files[0]);
      
        var _xml = new XMLHttpRequest();
        _xml.open('POST', '/api/test_upload/', true);
        _xml.onload = function(event) {
          if (_xml.status == 200) {
            alert('Uploaded');
          }
          else {
            alert('Error');
          }
        };
      
        _xml.send(filedata);
      }; */
      /* var imgInp = document.getElementById("imgInp"); */
      var imgInp = document.querySelector(".imgInp");
      var input = document.querySelector("input[type='file']");
    
      imgInp.addEventListener("change",function(){
    	
        readURL(this);
    });
   

      
      function readURL(){
    	  var plus = document.querySelector(".plus");
     	 plus.style.opacity="0";
          if(input.files && input.files[0]){
              var reader = new FileReader();
              reader.onload = function(e){
                console.log(e.target.result);
                var blah = document.getElementById("blah");
                blah.setAttribute('src',e.target.result);
                //alert(blah.getAttribute('src'));
                
              }
              reader.readAsDataURL(input.files[0]);
          }
      }
      
      var plus = document.querySelector(".plus");
      plus.addEventListener("click",function(e){
    	  var evt = new MouseEvent("click",{
  			"view":window,
  			"bubbles":true,
  			"cancelable":true
  		});

  		input.dispatchEvent(evt);
      });
      
      var pc = document.querySelector("input[name='pwdchk']");
      
      pc.addEventListener('keyup',function(){
    	  var pw = document.querySelector("input[name='password']").value;
    	  var pwck = document.querySelector("input[name='pwdchk']").value;
          if(pw != pwck){
        	  var warning = document.getElementById("warning");
        	  warning.innerText = "비밀번호 다시입력";
        	  warning.style.color="red";
        	  
          }
          else{
        	  var warning = document.getElementById("warning");
        	  warning.innerText = "비밀번호 사용가능";
        	  warning.style.color="blue";
          }
      });
      /*데이터베이스를 불러오는 작업은 컨트롤러가 해줌 유효성 검사는 자바스크립트에서도 가능하고 컨트롤러에서도 가능하다*/
      var idchk = document.querySelector("input[name='idchk']");
      idchk.addEventListener("click",function(){
    	  var id = document.querySelector("input[name='id']").value;
    	  var xml = new XMLHttpRequest();
    	  xml.open('POST','idchk');
    	  xml.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    	  xml.send('id='+id);
    	  xml.onload= function(){    		
    		  var result =  xml.responseText;
    		   		  
    		if(result == 0) alert("사용 가능한 아이디 입니다.");
    		else alert("동일한 아이디가 존재합니다");
    	  };
    	  
      });
      
      /*email 인증*/
      var email = document.querySelector(".email");
      var emailBtn = email.querySelector("input[type='button']");
	  var emailInput = email.querySelector("input[type='text']");

      emailBtn.addEventListener("click",function(){
    	  var xml = new XMLHttpRequest();   	  
    	  xml.open('POST','email-send');
    	  xml.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    	  xml.send("email="+emailInput.value);   
    	  
    	  xml.onload = function(){
  
				var emailchk = document.querySelector(".emailchk");
				emailchk.style.display = "flex";
							
				var emailChkBtn = emailchk.querySelector("input[type='button']");
				
				emailChkBtn.addEventListener("click",function(){
					var emailChkInput = emailchk.querySelector("input[type='text']").value;
					if(xml.responseText == emailChkInput) alert("인증되었습니다");
					else alert("인증에 실패되었습니다.");
				});
			}
      });
      /*가입완료 버튼 데이터베이스 올리고 파일업로드*/

      
      var join = document.getElementById("join");
      var joinbtn = join.querySelector("input[type='submit']");
      joinbtn.addEventListener("click",function(){
    
    	  uploadfile();
          
      });
      
      
      function uploadfile() {
    	  var file = document.querySelector(".imgInp");
          var filedata = new FormData(); // FormData 인스턴스 생성
        
          if (!file.value) return; // 파일이 없는 경우 빠져나오기
        
          filedata.append('uploadfile', file.files[0]);
        
          var xml = new XMLHttpRequest();
          xml.open('POST', 'file-upload', true);
          //uestHeader('Content-Type', 'application/x-www-form-urlencoded');
          xml.send(filedata);
          xml.onload = function(event) {
           /* if (xml.status == 200) {
              alert('Uploaded');
            }
            else {
              alert('Error');
            }*/
          };

        }; 
});


