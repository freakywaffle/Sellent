$('window').ready(function(){
	var afterLogin = $('.after-login');
	
	afterLogin.hover(function(){
		$(this).find('.my-menu').removeClass('hidden');
	},function(){
		$(this).find('.my-menu').addClass('hidden');		
	});
	
	
	//검색
	var searchInput = $('input[type="search"]');
	var submitBt = $('.search-bar button');
	submitBt.click(function(e){
		event.preventDefault();
		var url = '/category/search?keyword='+searchInput.val();
		$(location).attr('href', url);
	});
	
	
});
