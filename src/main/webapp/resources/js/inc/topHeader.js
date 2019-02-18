$('window').ready(function(){
	var afterLogin = $('.after-login');
	
	afterLogin.hover(function(){
		$(this).find('.my-menu').removeClass('hidden');
	},function(){
		$(this).find('.my-menu').addClass('hidden');		
	});
	
	
	
});