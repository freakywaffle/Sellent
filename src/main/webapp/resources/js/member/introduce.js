window.addEventListener("load",function(){
  
	var closeBtn = document.querySelectorAll(".close-button");
	var technic = document.querySelectorAll(".technic");
	var skillPut = document.querySelector("input[name='skillPut']");
	var skillInput = document.querySelector("input[name='name']");
	var techroom = document.querySelector(".techroom");
	

	skillPut.addEventListener("click",function(){
		var techname = document.querySelector(".techname");
		//alert(skillInput.value);
	   var xml = new XMLHttpRequest();   	  
   	   xml.open('POST','skill-send');
   	   xml.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
   	   xml.onload = function(){
   		
   			   var techroom = document.querySelector(".techroom");
   			   
   			   var technic = document.createElement("div");
   			   technic.className="technic";
   			   
   			   var techname = document.createElement("a");
   			   techname.className="techname";
   			   
   			   var closeBtn = document.createElement("span");
   			   closeBtn.className="close-button";
   			   
   			   closeBtn.innerHTML = "&times;";
   			   
   			   techroom.append(technic);
   			   technic.append(closeBtn);
   			   technic.append(techname);
   			   techname.innerHTML= xml.responseText;
   	
   	   }
   	   xml.send("newSkill="+ skillInput.value);
		skillInput.value="";
	});
	
	techroom.addEventListener("click",function(e){
		
		//alert(e.target.nodeName); //techroom
		//alert(e.target.children[0].nodeName); //technic
		//alert(e.target.children[0].children[1].nodeName); //span*/
		
		/*for (var i = 0; i < closeBtn.length; i++) {
			if(e.target.children[i].children[1].nodeName)
				alert("hi");
		
		}*/
	
		if(e.target.classList.contains("close-button"))
		{
			e.target.parentNode.style.display="none";
			var deltech =e.target.parentNode.children[0].innerText;
			//alert(deltech);
			var xml = new XMLHttpRequest();   	  
		    xml.open('POST','delete-tech');
		    xml.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		    xml.onload = function(){
				
			 };
		    xml.send("deltech="+deltech);
		}
	});
	
});


