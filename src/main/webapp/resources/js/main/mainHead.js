window.addEventListener("load",function(){
	var loginbtn = document.getElementById('hamburgericon');
	var put = document.getElementById('puticon');
	var login = document.querySelector('.login')
	loginbtn.addEventListener("click",function(){
		login.style.visibility="visible";
		loginbtn.style.visibility="hidden";
		login.style.marginRight="40px";
		put.style.visibility="visible";
	});
	put.addEventListener("click",function(){
		
		login.style.visibility="hidden";
		put.style.visibility="hidden";
		login.style.marginRight="0px"
			
		setTimeout(function(){
			loginbtn.style.visibility="visible";
	    },500)
		
	});
});