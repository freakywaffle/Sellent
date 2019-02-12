


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
//	var reviewForm = $('.review-reg-form');
//	var reviewBt = reviewForm.find('input[type="button"]');
//	reviewBt.on('click',function(){
//		
//		if($('.member-menu').children().eq(0).prop('nodeName') == 'UL'){
//			alert('로그인해주세요');
//			$(location).attr('pathname', '/member/login');
//			return;
//		}
//		
//		var json = {
//				"content":reviewForm.find('textarea').val(),
//				"starpoint":reviewForm.find('input[type="hidden"]').val(),
//		};
//		
//		
//		$.ajax({
//			url: $(location).attr('pathname')+'/review',
//			type:'POST',
//			data: "json="+JSON.stringify(json),
//			success: function(data){
//				
//				
//				
//				var reviewsCnt = $('.review-list').find('span');
//				var jsonData = jQuery.parseJSON(data);
//			
//				var reviews = jsonData.reviews;
//				var totalCnt = jsonData.reviewCnt;
//				
//				reviewsCnt.text(totalCnt);
//				
//				var reviewListDiv = $('.review-list').children().eq(1);
//				reviewListDiv.empty();
//				for(var i=0;i<reviews.length;i++){
//					var p =$('<p></p>').text(reviews[i].writer_id);
//					var contentDiv = $('<div></div>').text(reviews[i].content);
//					var rvContent = $('<div></div>').addClass('rv-content');
//					rvContent.append(p);
//					rvContent.append(contentDiv);
//					var profilePhoto = $('<img />').attr('src', '<spring:url value="/sellent/profile/"/>'+reviews[i].writer_id+'/'+reviews[i].photo);
//					var reviewDiv = $('<div></div>').addClass('review');
//					reviewDiv.append(profilePhoto);
//					reviewDiv.append(rvContent);
//					
//					reviewListDiv.append(reviewDiv);
//				}
//				if(totalCnt>10)
//					more.removeClass('hidden');
//			}
//		
//		});
//	});
	
	//reviews 페이징
//	var more = $('.more');
//	more.on('click',function(){
//		var cnt = $('.review').length;
//		var pageCnt = Math.ceil((cnt)/10)*10;
//		if(pageCnt == cnt)
//			pageCnt+=10;
//		$.ajax({
//			url: $(location).attr('pathname')+'/moreReview?cnt='+pageCnt,
//			type:'GET',
//			success: function(data){
//				var reviewsCnt = $('.review-list').find('span');
//				var jsonData = jQuery.parseJSON(data);
//				
//				var reviews = jsonData.reviews;
//				var totalCnt = jsonData.reviewCnt;
//				
//				reviewsCnt.text(totalCnt);
//				
//				var reviewListDiv = $('.review-list').children().eq(1);
//				reviewListDiv.empty();
//				for(var i=0;i<reviews.length;i++){
//					var p =$('<p></p>').text(reviews[i].writer_id);
//					var contentDiv = $('<div></div>').text(reviews[i].content);
//					var rvContent = $('<div></div>').addClass('rv-content');
//					rvContent.append(p);
//					rvContent.append(contentDiv);
//					
//					var springurl = '<img src=${springroot} />';
//					
//					//var profilePhoto = $('<img />').attr('src', springurl+reviews[i].writer_id+'/'+reviews[i].photo);
//					var reviewDiv = $('<div></div>').addClass('review');
//					//reviewDiv.append(profilePhoto);
//					reviewDiv.append(springurl);
//					reviewDiv.append(rvContent);
//					reviewListDiv.append(reviewDiv);
//				}
//				
//				
//				if(reviews.length >= totalCnt)
//					more.addClass('hidden');
//				else
//					more.removeClass('hidden');
//			}
//		
//		});
//	});
	
});
