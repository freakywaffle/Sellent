$(document).ready(function(){
	$('.toggle-btn').on('click',function(){
		var toggleMove = $('.toggle-move');
		var center = $('.toggle-btn');
		
		if(!toggleMove.hasClass('action')){
			toggleMove.addClass('action');
			center.addClass('change-color');
		}
		else{
			toggleMove.removeClass('action');
			center.removeClass('change-color');
		}
	});
	
	
});