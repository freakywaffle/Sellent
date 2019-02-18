$(document).ready(function(){
	
	bindLike();
	bindLink();
	
	
	//링크타기
	function link(path){
		var url = $(location).attr('pathname');
		var origin = $(location).attr('origin');
		$(location).attr('href', origin+url+'/'+path);
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
				var origin = $(location).attr('origin');
				$(location).attr('href', origin+'/login');
				return;
			}
			
			var pno = $(this).prev().val();
			console.log(pno);
			var url = $(location).attr('pathname');
			if(!$(e.target).hasClass('fav')){
				$.ajax({
					url: url+'/'+pno+'/like',
					type: 'get',
					success: function(){
						
						$(e.target).toggleClass('fav');
					}
					
				});
			}else{
				$.ajax({
					url: url+'/'+pno+'/delike',
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
		var origin = $(location).attr('origin');
		$(location).attr('href', origin+'/category/reg');
	});
	
	
	
	//페이징
	var tmpl = document.querySelector('#tmpl');
	
	var mainContent = $('#main-content');
	var more = $('.more');
	more.on('click',function(){
	
		var url = $(location).attr('pathname');
		var sub = getJsonFromUrl().sub;
		
		console.log(sub);
		var cnt = $('.contents').length;
		$.ajax({
			url: url+'/'+'moreCategory',
			type:'POST',
			dataType: 'json',
			data: {'cnt': cnt, 'parent':'IT개발', 'sub':sub},
			success: function(data){
				//var json = jQuery.parseJSON(data);
				
				var moreList = data.morelist;
				var allCnt = data.allCnt;
				var likeList = data.llist;
				
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
	
					starPoint.empty();
	
					titleImg.attr('src','<spring:url value="/sellent/upload/"/>'+product.no+'/'+product.thumbnail);
					if(likeList){
						for(var i=0; i<likeList.length; i++){
							if(product.no == likeList[i].product_no){
								likeBt.addClass('fav');
								break;
							}
						}	
					}
					pno.val(product.no);
					title.text(product.title);
	
					editCnt.text(product.editCnt);
					duration.text(product.duration);
					name.text(product.nickname);
					money.text(product.price);
					
					console.log(starpoint);
					
					for(var i=1;i<=starpoint;i++){
						var fullStar = $('<div><img alt="별점" src="/resources/images/small-fullstar.png"/></div>');
						starPoint.append(fullStar);
					}
					
					for(var i=starpoint+1;i<=5;i++){
						var binStar = $('<div><img alt="별점" src="/resources/images/small-binstar.png"/></div>');
						starPoint.append(binStar);
					}
					
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