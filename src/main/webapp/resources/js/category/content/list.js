$(document).ready(function(){
	
	bindLike();
	bindLink();
	
	
	//좋아요 바인드
	function link(path){
		$(location).attr('pathname', '/category/'+path);
	};
	
	//링크 바인드
	function bindLink(){
		var details = $('.detail');
		
		details.off().on('click',function(e){
			var pno = $(this).find('input[name="pno"]').val();
			link(pno);
		});
		
	}
	
	
	
	
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
	function bindLike(){
		var likeBt = $('.fa-heart')
		likeBt.off().on('click', function(e){
			e.stopPropagation();
			
			if($('.member-menu').children().eq(0).prop('nodeName') == 'UL'){
				alert('로그인해주세요');
				$(location).attr('pathname', '/login');
				return;
			}
			
			var pno = $(this).prev().val();
			console.log(pno);
			if(!$(e.target).hasClass('fav')){
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
	}
	
	
	
	//글쓰기 이동
	var regBt = $('.reg-bt');
	regBt.click(function(){
		$(location).attr('pathname', 'category/reg');
	});
	
	
	
	//페이징
	var tmpl = document.querySelector('#tmpl');
	
	var mainContent = $('#main-content');
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
				var likeList = json.llist;
				
				for(var p=0; p<moreList.length; p++){
					var product = moreList[p];
					var starpoint = product.avgStarPoint-(product.avgStarPoint%1);
					
					var template = $(document.importNode(tmpl.content, true));
					
					var titleImg = template.find('.title-img img');
					var likeBt = template.find('.like i');
					var pno = template.find('input[name="pno"]');
					var title = template.find('.title');
					var editCnt = template.find('.edit a');
					var duration = template.find('.make a');
					var name = template.find('.name');
					var money = template.find('.money');
					
					var starPoint = template.find('.star-point');
					var fullStar = starPoint.find('div:first-child');
					var binStar = starPoint.find('div:last-child');
	
					starPoint.empty();
	
					titleImg.attr('src','<spring:url value="/sellent/upload/"/>'+product.no+'/'+product.thumbnail);
					for(var i=0; i<likeList.length; i++){
						if(product.no == likeList[i].product_no){
							likeBt.addClass('fav');
							break;
						}
					}	
					pno.val(product.no);
					title.text(product.title);
	
					editCnt.text(product.editCnt);
					duration.text(product.duration);
					name.text(product.nickname);
					money.text(product.price);
					for(var i=1;i<=starpoint;i++)
						starPoint.append(fullStar);
					
					for(var i=starpoint+1;i<=5;i++)
						starPoint.append(binStar);
					
					
					mainContent.append(template);
					
					bindLink();
					bindLike();
				}
				
				
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