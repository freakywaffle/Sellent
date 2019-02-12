window.addEventListener("load",function(){
  var idFind = document.getElementById("idFind");
  var pwdFind = document.getElementById("pwdFind");
  var findId = document.querySelector(".findId");
  var idBtn = idFind.querySelector("input[type='button']")
  var pwdBtn = pwdFind.querySelector("input[type='button']")
  var modal = document.querySelector(".modal");
  var closebtn = document.querySelector(".close-button");

  function toggleModal() {
	    modal.classList.toggle("show-modal");
	  }
  closebtn.addEventListener("click", toggleModal);
  idBtn.addEventListener("click",function(){
	  var nameInput = findId.querySelector("input[name='nickname']").value;
	  var emailInput = findId.querySelector("input[name='email']").value;
	  var xml = new XMLHttpRequest();   	  
	  xml.open('POST','/member/idFind');
	  xml.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	  xml.onload = function(){
			alert(xml.responseText);
		  };
	  xml.send("nickname="+nameInput+"&email="+emailInput);
	  
  });
  
  pwdBtn.addEventListener("click",function(){
	  var findPwd = document.querySelector(".findPwd");
	  var idInput = findPwd.querySelector("input[name='id']").value;
	  var emailInput = findPwd.querySelector("input[name='email']").value;
	  
	  var xml = new XMLHttpRequest();   	  
	  xml.open('POST','/member/pwdFind');
	  xml.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	  xml.onload = function(){
			if(xml.responseText == idInput){
				  toggleModal();
				  var newpwdChk = document.querySelector("input[name='newpwdChk']");
				  var warning = document.querySelector(".warning");
				  newpwdChk.addEventListener('keyup',function(){
					  var newPwd = document.querySelector("input[name='newPwd']").value;
					  var newpwdChkInput = document.querySelector("input[name='newpwdChk']").value;
					  if(newPwd == newpwdChkInput){
						   warning.style.visibility="visible";
					    	warning.innerText="비밀번호 사용가능";
					    	warning.style.color="blue";
					    }
					    else{
					    	warning.style.visibility="visible";
					    	warning.innerText = "비밀번호 다시입력";
					    	warning.style.color="red";

					    } 
				  });
				   
			}
			else{
				toggleModal();
				 var pwdInput = document.querySelector(".pwdInput");
				 pwdInput.style.visibility="hidden";
			}
		
		  };
	  xml.send("id="+idInput+"&email="+emailInput); 
  });
  
});


