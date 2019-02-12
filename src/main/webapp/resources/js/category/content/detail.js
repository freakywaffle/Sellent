$(document).ready(function(){
	//헤더 사라지기
	$(window).scroll(function(){
		if($(this).scrollTop()>5)
			$('#header').addClass('hidden');
		else
			$('#header').removeClass('hidden');

	});
	
	
	//상세내용 포커스 이동하기
	var detailIndex = $('.detail-index').find('ul');
	detailIndex.find('li').on('click',function(){
		var focusTop = $('.contents').children().eq($(this).index()).offset().top;
		$('html').animate({scrollTop:focusTop-90},400);
	});
	
	
	//review 등록
	var reviewForm = $('.review-reg-form');
	var reviewBt = reviewForm.find('input[type="button"]');
	reviewBt.on('click',function(){
		var json = {
				"content":reviewForm.find('textarea').val(),
				"starpoint":reviewForm.find('input[type="hidden"]').val(),
				"productNo": $('.sc-title input').val()
				
		};
		
		
		$.ajax({
			url: 'review',
			type:'POST',
			data: "json="+JSON.stringify(json),
			success: function(){
				alert(1);
			}
		
		});
	});
	
	
});
