$('window').ready(function(){
	var ctNames = $('.ct-name');
	
	ctNames.hover(function(e){
		$(this).find('.header-sub-category').removeClass('hidden');
	},function(){
		$(this).find('.header-sub-category').addClass('hidden');
	});
	
	
	//메뉴 슬라이더
	
	var leftArrow = $('.arrow').eq(0);
	var rightArrow = $('.arrow').eq(1);
	
	leftArrow.on('click',function(){
		alert('!!');
	});
	rightArrow.on('click',function(){
		alert('!!');
	});

});
