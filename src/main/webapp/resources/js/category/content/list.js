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
	
	
	
	//찜하기
	var likeBt = $('.fa-heart')
	likeBt.on('click', function(e){
		e.stopPropagation();
		
		if($('.member-menu').children().eq(0).prop('nodeName') == 'UL'){
			alert('로그인해주세요');
			$(location).attr('pathname', '/login');
			return;
		}
		
		var pno = $(this).prev().val();
		console.log(pno);
		if(!likeBt.hasClass('fav')){
			$.ajax({
				url: '/category/'+pno+'/like',
				type: 'get',
				success: function(){
					
					$(e.target).toggleClass('fav');
				}
				
			});
		}else{
			$.ajax({
				url: '/category/'+pno+'/delike',
				type: 'get',
				success: function(){
					
					$(e.target).toggleClass('fav');
				}
				
			});
		}
	});
	
	
	
	
	//글쓰기 이동
	var regBt = $('.reg-bt');
	regBt.click(function(){
		$(location).attr('pathname', 'category/reg');
	});
	
	//페이징
	var more = $('.more');
	more.on('click',function(){
		var cnt = $('.contents').length;
		$.ajax({
			url: '/category/moreCategory?cnt='+cnt,
			type:'GET',
			success: function(data){
				
				var json = jQuery.parseJSON(data);
				
				var moreList = json.morelist;
				var allCnt = json.allCnt;
				
				
				var contentsDiv = $('<div></div>');
				contents.addClass('contents');
				
				var titleImgDiv = $('<div></div>');
				titleImg.addClass('title-img');
				
				var titleImg = $('<img/>');
				titleImg.attr('alt','타이틀 이미지');
				titleImg.attr('src','<spring:url value="/sellent/upload/"/>'+moreList[0].no+'/'+moreList[0].thumbnail);
				
				titleImgDiv.append(titleImg);
				
				var detailDiv = $('<div></div>');
				detailDiv.addClass('detail');
				detailDiv.on('click', function(){
					$(location).attr('pathname','/category/'+moreList[0].no);
				});
				
				var likeDiv = $('<div></div>');
				likeDiv.addClass('like');
				
				var inputHidden = $('<input />');
				inputHidden.attr('type','hidden');
				inputHidden.val(moreList[0].no);
				var heartIcon = $('<i></i>');
				heartIcon.addClass('fas');
				heartIcon.addClass('fa-heart');
				
				
				
				
				/* var categorysCnt = $('.review-list').find('span');
				var jsonData = jQuery.parseJSON(data);
				
				var categorys = jsonData.categorys;
				var totalCnt = jsonData.categoryCnt;
				
				categorysCnt.text(totalCnt);
				
				
				
				
				if(categorys.length >= totalCnt)
					more.addClass('hidden');
				else
					more.removeClass('hidden'); */
			}
		
		});
	});
});