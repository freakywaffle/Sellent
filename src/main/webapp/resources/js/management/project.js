window.addEventListener("load",function(){
	var smallTitle = document.querySelector(".small-title");
	var title= smallTitle.querySelector(".a");
	var selects = document.querySelector(".select");
	selects.addEventListener("change",function(e){
		var select = e.target.nodeName;
		var option = document.getElementById("options").options[document.getElementById("options").selectedIndex];
		var a = option.value
		var optionValue = parseInt(a);
		/*option.addEventListener("click",function(e){
			alert(e.target.text);
		});*/
			
		location.href = "project?optionValue="+optionValue;
		
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
	var anl= document.querySelector("option[name='anl']");
	var sell= document.querySelector("option[name='sell']");
	if(getJsonFromUrl().optionValue ==0)
		anl.selected='selected';
	
	if(getJsonFromUrl().optionValue ==1)
		sell.selected='selected';

	//else if(getJsonFromUrl().optionValue ==0)		
		//anl.selected='selected';

		bindLink();
		
		function link(path){
			var url = location.pathname;
			//alert("url: "+ url);
			var aa = "category";
			var bb = "project";
			//alert(aa);
			//alert(bb);
			var origin = location.origin;
			//alert("origin: "+origin);
			location.href=origin+"/"+aa+"/"+bb+'/'+path;
		};
		
		function bindLink(){
			var content = document.querySelectorAll(".contents");
			//alert(content.length);
			for(var i =0; i<content.length; i++){
				content[i].addEventListener("click",function(e){
					//alert("hi");
					var pno =e.target.querySelector("input[name='pno']").value;
					//alert("pno:"+pno);
					link(pno);
					//alert("linkpno:"+ link(pno));
				});
				
				content[i].removeEventListener("click",function(e){
					var pno = document.querySelector("input[name='pno']").value();
					link.pno();
				});
			}
		
		}

});

