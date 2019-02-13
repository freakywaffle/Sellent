


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
	detailIndex.find('li').on('click',function(e){
		var focusTop = $('.contents').children().eq($(this).index()).offset().top;
		$('html').animate({scrollTop:focusTop-90},400);
	});
	
	//포커스 이동에 따른 lookup 변경
	var index1 = $('.contents').children().eq(0);
	var index2 = $('.contents').children().eq(1);
	var index3 = $('.contents').children().eq(2);
	$(window).scroll(function(){
		
		if($(this).scrollTop()+90>index1.offset().top){
			detailIndex.find('li').eq(0).addClass('lookup');
			detailIndex.find('li').eq(1).removeClass('lookup');
			detailIndex.find('li').eq(2).removeClass('lookup');
			
		}
		if($(this).scrollTop()+90>index2.offset().top-40){
			detailIndex.find('li').eq(1).addClass('lookup');
			detailIndex.find('li').eq(0).removeClass('lookup');
			detailIndex.find('li').eq(2).removeClass('lookup');
		}
		if($(this).scrollTop()>index3.offset().top-500){
			detailIndex.find('li').eq(2).addClass('lookup');
			detailIndex.find('li').eq(0).removeClass('lookup');
			detailIndex.find('li').eq(1).removeClass('lookup');
		}
	});
	
	
	//이미지 선택
	var imgList = $('.img-list');
	imgList.find('li').on('click', function(e){
		var src = $(e.target).attr('src');
		var thumbnail = $('.thumbnail');
		thumbnail.attr('src', src);
		
	});
	
	
	//별점 선택
	var starPoint = $('input[name="starpoint"]');
	var starSelect = $('.review-reg-form select');
	starSelect.on('change',function(){
		starPoint.val(starSelect.val());
		console.log(starPoint.val());
	});
	
	
	
	//찜하기
	var likeBt = $('.like-bt')
	likeBt.on('click',function(){
		var heart = likeBt.find('.fa-heart');
		if(!heart.hasClass('fav')){
			$.ajax({
				url: $(location).attr('pathname')+'/like',
				type: 'get',
				success: function(){
					
					likeBt.find('.fa-heart').toggleClass('fav');
				}
				
			});
		}else{
			$.ajax({
				url: $(location).attr('pathname')+'/delike',
				type: 'get',
				success: function(){
					
					likeBt.find('.fa-heart').toggleClass('fav');
				}
				
			});
		}
		
	});
});
