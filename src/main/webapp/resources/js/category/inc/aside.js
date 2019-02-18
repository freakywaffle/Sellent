$('window').ready(function(){
	
	var searchOption = $('.search-option');
	searchOption.on('click',function(){
		
		var sellChk = new Object();
		
		if($(this).attr('checked')){
			$(this).find('input[type="checkbox"]').attr('checked',false);
			$(this).find('img').attr('src','/resources/images/blank-check-box.png');
		}
		else{
			$(this).find('input[type="checkbox"]').attr('checked',true);
			$(this).find('img').attr('src','/resources/images/check-mark-black-outline.png');
		}
		
		
		
		
		
		var query = getJsonFromUrl(); 
		
		
		$.ajax({
			type: 'POST',
			dataType: 'json',
			data: {'query': json, 'sellChk':''},
			success: function(data){
				
			}
			
		});
		
		
		
	});
	
	
	
	
});


//url 쿼리스트링 json화
function getJsonFromUrl(){
	var query = $(location).attr('search').substr(1);
	var result = {};
	query.split('&').forEach(function(part){
		var item = part.split("=");
		result[item[0]] = decodeURIComponent(item[1]);	
	});
	return result;
}