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
	
	var menuList = $('.ct-name');
	
	
	
	leftArrow.on('click',function(){
		for(var i=0;i<4;i++){
			menuList.eq(i).removeClass('mobile-hidden');
			menuList.eq(i+4).addClass('mobile-hidden');
		}
	});
	rightArrow.on('click',function(){
		for(var i=4;i<8;i++){
			menuList.eq(i).removeClass('mobile-hidden');
			menuList.eq(i-4).addClass('mobile-hidden');
		}
	});

});
