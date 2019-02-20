window.addEventListener("load",function(){

	var selects = document.querySelector(".select");
	selects.addEventListener("change",function(e){
		var select = e.target.nodeName;
		var option = document.getElementById("options").options[document.getElementById("options").selectedIndex];
		var a = option.value
		var optionValue = parseInt(a);
		alert(option.text)
		/*option.addEventListener("click",function(e){
			alert(e.target.text);
		});*/
			
		location.href = "history?optionValue="+optionValue;
		
	});
	
	//if(option.text == '구매') smallTitle.style.backgroundColor = "blue";
	function getJsonFromUrl(){
		var query = location.search.substr(1);
		var result = {};
		query.split("&").forEach(function(part){
			var item = part.split("=");
			result[item[0]] = decodeURIComponent(item[1]);
		});
		return result;
	}
	//alert(getJsonFromUrl().optionValue);
	var sell= document.querySelector("option[name='sell']");
	var buy= document.querySelector("option[name='buy']");
	
	var accep = document.querySelectorAll(".accep");
	var deny = document.querySelectorAll(".deny");
	var complete = document.querySelectorAll(".complete");
	
	var state = document.querySelectorAll(".state");
	
	
	if(getJsonFromUrl().optionValue ==0 || getJsonFromUrl().optionValue == null){
		

		  
		var change ;
		for (var i = 0; i < state.length; i++) {
			if(state[i].innerText == '미확인'){
				accep[i].style.display="inline-block";
				deny[i].style.display="inline-block";
				
				accep[i].addEventListener("click",function(e){
					change = e.target.value;
					alert(change);
					var xml = new XMLHttpRequest();
					xml.open('POST','chgState');
					xml.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				    xml.onload = function(){
						alert(xml.responseText);
					 };
					change = e.target.parentNode.previousElementSibling;
					change.innerText = "작업중";
					if(change.innerText = "작업중"){
						e.target.style.display="none";
						alert(e.target.nextSibling);
						e.target.nextElementSibling.style.display="none";
						e.target.nextElementSibling.nextElementSibling.style.display="inline-block";
					}
					var num = e.target.parentNode.parentNode.querySelector("input[name='num']").value;
 					xml.send("chgState="+change.innerText+"&num="+num);
					
					
				});
				deny[i].addEventListener("click",function(e){
					change = e.target.value;
					alert(change);
					var xml = new XMLHttpRequest();
					xml.open('POST','chgState');
					xml.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				    xml.onload = function(){
						alert(xml.responseText);
					 };
					change = e.target.parentNode.previousElementSibling;
					change.innerText = "거절됨";
					if(change.innerText="거절됨"){
						e.target.style.display="none";
						e.target.previousElementSibling.style.display="none";
						e.target.nextElementSibling.style.display="none";
						
					}
					var num = e.target.parentNode.parentNode.querySelector("input[name='num']").value;
 					 xml.send("chgState="+change.innerText+"&num="+num);
				});
			}
			
			else if(state[i].innerText == '작업중'){
				complete[i].style.display="inline-block";
				complete[i].addEventListener("click",function(e){
					change = e.target.value;
					alert(change);
					var xml = new XMLHttpRequest();
					xml.open('POST','chgState');
					xml.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				    xml.onload = function(){
						alert(xml.responseText);
					 };
					 change = e.target.parentNode.previousElementSibling;
					 change.innerText = "작업완료";
					 if(change.innerText="작업완료"){
						 e.target.style.display="none";
						 accep[i].style.display="none";
					 }
					 var num = e.target.parentNode.parentNode.querySelector("input[name='num']").value;
  					 xml.send("chgState="+change.innerText+"&num="+num);
					
				});
			}			
		}
		sell.selected='selected';
		
	}
	
	else if(getJsonFromUrl().optionValue ==1)
		buy.selected='selected';

	
});