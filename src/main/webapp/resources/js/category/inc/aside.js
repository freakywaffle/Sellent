$('window').ready(function(){
	
	/*var searchOption = $('.search-option');
	searchOption.on('click',function(){
		
		if($(this).find('input[type="checkbox"]').attr('checked')){
			$(this).find('input[type="checkbox"]').attr('checked',false);
			$(this).find('img').attr('src','/resources/images/blank-check-box.png');
			
		}
		else{
			$(this).find('input[type="checkbox"]').attr('checked',true);
			$(this).find('img').attr('src','/resources/images/check-mark-black-outline.png');
		}
		
		
	});
*/	
	var pathname = $(location).attr('pathname');
	var parentCt = pathname.split('/')[pathname.split('/').length-1];
	var h2 = $('.ct-wrapper').find('h2');
	h2.text(decodeURI(parentCt));
	
});


