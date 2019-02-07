$(document).ready(function(){
	
	//aside 튀어나오기
	
	var menuBt = $('.menu-button');
	var closeBt = $('.close-button');
	
	var aside = $('.aside');
	
	var transitionEnd = 'transitionend';
	
	var div = $('<div></div>');
	div.addClass('back-ground');
	menuBt.on('click',function(){
		
		aside.addClass('show');
		aside.removeClass('close');
		menuBt.removeClass('mobile-block');
		$('body').append(div);
		
		
	});
	
	closeBt.on('click',function(){
		aside.addClass('close');
		aside.removeClass('show');
		div.remove();
		aside.on('transitionend',function(){
			menuBt.addClass('mobile-block');
			
		});
	});
	
	
	
	
	//찜버튼 변화
	var likeBt = $('.like').find('img');
	likeBt.on('click',function(){
		if($(this).attr('src')=='/resources/images/bin-heart.png')
			$(this).attr('src','/resources/images/full-heart.png');
		else
			$(this).attr('src','/resources/images/bin-heart.png');
	});
});