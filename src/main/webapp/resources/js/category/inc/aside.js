$('window').ready(function(){
	
	var searchOption = $('.search-option');
	searchOption.on('click',function(){
		if($(this).find('input[type="checkbox"]').attr('checked')){
			$(this).find('input[type="checkbox"]').attr('checked',false);
			$(this).find('img').attr('src','/resources/images/blank-check-box.png')
		}
		else{
			$(this).find('input[type="checkbox"]').attr('checked',true);
			$(this).find('img').attr('src','/resources/images/check-mark-black-outline.png')
		}
		
	});
	
	
	
	
});