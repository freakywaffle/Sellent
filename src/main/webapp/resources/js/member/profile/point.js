window.addEventListener("load",function(){
	//var smallTitle = document.querySelector(".small-title");
	//var title= smallTitle.querySelector(".a");
	var selects = document.querySelector(".select");
	selects.addEventListener("change",function(e){
		var select = e.target.nodeName;
		var option = document.getElementById("options").options[document.getElementById("options").selectedIndex];
		var a = option.value
		var optionValue = parseInt(a);
		//alert(option.text)
		/*option.addEventListener("click",function(e){
			alert(e.target.text);
		});*/
			
		location.href = "point?optionValue="+optionValue;
		
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
	var total= document.querySelector("option[name='total']");
	var week= document.querySelector("option[name='week']");
	var month= document.querySelector("option[name='month']");
	var year= document.querySelector("option[name='year']");
	
	if(getJsonFromUrl().optionValue ==3)
		year.selected='selected';
	
	else if(getJsonFromUrl().optionValue ==2)
		month.selected='selected';
	
	else if(getJsonFromUrl().optionValue == 1)
		week.selected='selected';
			
	else total.selected='selected';
	
});