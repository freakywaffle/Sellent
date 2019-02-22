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
	
	
	//글쓰기 이동
	var regBt = $('.reg-bt');
	regBt.click(function(){
		var origin = $(location).attr('origin');
		$(location).attr('href', origin+'/category/reg');
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