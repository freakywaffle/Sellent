<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<link href="/resources/css/category/content/list.css" rel="stylesheet"/>
<link href="/resources/css/category/content/search.css" rel="stylesheet"/>
<script src="/resources/js/category/content/search.js"></script>
<template id="tmpl">
	<div class="contents">
		<div class="title-img"><img alt="타이틀 이미지" src='' onerror="this.src='/sellent/default/기본.gif'"/></div>
		<div class="detail"  onclick="">
			<div class="like">
				<input type="hidden" name="pno" value=""/>
				<i class="fas fa-heart"></i>
			</div>
			<div class="title">
				
			</div>
			<div class="detail-data">
				<div class="edit">
					<div class="edit-img"><img alt="편집횟수" src="/resources/images/edit.png"></div>
					<div>편집 횟수: </div>
					<div><a></a>회</div>
				</div>
				<div class="make">
					<div class="make-img"><img alt="소요일" src="/resources/images/clock.png"></div>
					<div>작업 일: </div>
					<div><a></a>일</div>
				</div>
				<div class="name"></div>
			</div>
			<div class="won-star">
				<div class="won">
					<div class="won-img"><img alt="돈" src="/resources/images/save-money.png"></div>
					<div class="money"></div>
				</div>
				<div class="star-point">
					<div><img alt="별점" src="/resources/images/small-fullstar.png"/></div>
					<div><img alt="별점" src="/resources/images/small-binstar.png"/></div>
				</div>
			</div>
		</div>
	</div>
</template>
<section class="content">
	<div class="menu-button mobile-block">
		<input type="button" value=">" />
	</div>
	<div class="search-result">
		<label>${keyword }</label>
		<div>
			<span class="allCnt">${allCnt}</span>개의 검색결과
		</div>
	</div>
	
	
	<div class="top-content">
		<div class="custom-breadcrumb">프로젝트 > 평가</div>
		<div class="top-right-content">
			<input type="button" value="글쓰기" class="reg-bt"/> 
			<select class="hidden">
				<option>분류검색</option>
			</select>
		</div>
	</div>
	<div id="main-content">
		<c:forEach var="p" items="${plist }">
			<c:set var="fav" value="" />
			<c:set var="loop" value="false" />
			<c:forEach var="l" items="${llist }">
				<c:if test="${not loop}">
					<c:if test="${p.no == l.product_no}">
						<c:set var="fav" value="fav" />
						<c:set var="loop" value="true" />
					</c:if>
				</c:if>
			</c:forEach>
			<div class="contents">
				<div class="title-img"><img alt="타이틀 이미지" src='<spring:url value="/sellent/upload/"/>${p.no}/${p.thumbnail}' onerror="this.src='/sellent/default/기본.gif'"/></div>
				<div class="detail" onclick="">
					<div class="like">
						<input type="hidden" name="pno" value="${p.no }"/>
						<i class="fas fa-heart ${fav }"></i>
					</div>
					<div class="title">
						${p.title }
					</div>
					<div class="detail-data">
						<div class="edit">
							<div class="edit-img"><img alt="편집횟수" src="/resources/images/edit.png"></div>
							<div>편집 횟수: </div>
							<div><a>${p.editCnt }</a>회</div>
						</div>
						<div class="make">
							<div class="make-img"><img alt="소요일" src="/resources/images/clock.png"></div>
							<div>작업 일: </div>
							<div><a>${p.duration }</a>일</div>
						</div>
						<div class="name">${p.nickname }</div>
					</div>
					<div class="won-star">
						<div class="won">
							<div class="money"><fmt:formatNumber value="${p.price}" type="currency" currencySymbol="￦"/></div>
						</div>
						<div class="star-point">
							<c:forEach begin="1" end="${p.avgStarPoint-(p.avgStarPoint%1) }">
								<div><img alt="별점" src="/resources/images/small-fullstar.png"/></div>
							</c:forEach>
							<c:forEach begin="${p.avgStarPoint-(p.avgStarPoint%1)+1}" end="5">
								<div><img alt="별점" src="/resources/images/small-binstar.png"/></div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="bottom-content">
		<input type="button" value="더보기" class="more"/>
	</div>
	<script>
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
							
							swal({
								title:'이 상품을 찜했습니다',
								icon: "success",
							});
						}
						
					});
				}else{
					$.ajax({
						url: url+'/'+pno+'/delike',
						type: 'get',
						success: function(){
							
							$(e.target).toggleClass('fav');
							swal({
								title:'이 상품의 찜을 해제 했습니다',
								icon: "success",
							});
						}
						
					});
				}
			});
		}
		
		
		//페이징
		var tmpl = document.querySelector('#tmpl');
		
		var query = getJsonFromUrl();
		
		var mainContent = $('#main-content');
		var more = $('.more');
		more.on('click',function(){
		
			var url = $(location).attr('pathname');
			
			$('.ct-sell-chk').find('input').each(function(){
				if($(this).attr('checked'))
					sellChk[$(this).attr('name')] = 1;
				else
					sellChk[$(this).attr('name')] = 0;
			});
			
			
			console.log(sellChk);
			
			var cnt = $('.contents').length;
			$.ajax({
				url: url+'/'+'moreCategory',
				type:'POST',
				dataType: 'json',
				data: {'cnt': cnt, 'query':JSON.stringify(query), 'sellChk':JSON.stringify(sellChk)},
				success: function(data){
					
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
				}
			
			});
		});
		
		//aside 체크
		var sellChk = {'yes':0, 'no':0};
		var searchOption = $('.search-option');
		searchOption.on('click',function(){
			
			if($(this).find('input[type="checkbox"]').attr('checked')){
				$(this).find('input[type="checkbox"]').attr('checked',false);
				$(this).find('img').attr('src','/resources/images/blank-check-box.png');
				
			}
			else{
				$(this).find('input[type="checkbox"]').attr('checked',true);
				$(this).find('img').attr('src','/resources/images/check-mark-black-outline.png');
			}
			
			
			$('.ct-sell-chk').find('input').each(function(){
				if($(this).attr('checked'))
					sellChk[$(this).attr('name')] = 1;
				else
					sellChk[$(this).attr('name')] = 0;
			});
			
			var query = getJsonFromUrl();
			
			
			var mainContent = $('#main-content');
			
			$.ajax({
				url: $(location).attr('pathname')+'/filter',
				type: 'POST',
				dataType: 'json',
				data: {'query': JSON.stringify(query), 'sellChk':JSON.stringify(sellChk)},
				success: function(data){
					mainContent.empty();
					if(data.plist.length != 0){
						
						var pList = data.plist;
						var allCnt = data.allCnt;
						var likeList = data.llist;
						
						for(var p=0; p<pList.length; p++){
							var product = pList[p];
							console.log(product.title);
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
							console.log(product.thumbnail);
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
						
						
					}
				}
			});
			
		});
		


		//검색화면 aside 부모카테고리 필터체크
		var sellChk = {'yes':0, 'no':0};
		var listOption = $('.side-list-option');
		listOption.on('click',function(){
			if($(this).find('input[type="checkbox"]').attr('checked')){
				$(this).find('input[type="checkbox"]').attr('checked',false);
				$(this).find('img').attr('src','/resources/images/blank-check-box.png');
				
			}
			else{
				$(this).find('input[type="checkbox"]').attr('checked',true);
				$(this).find('img').attr('src','/resources/images/check-mark-black-outline.png');
			}
			
			
			$('.ct-sell-chk').find('input').each(function(){
				if($(this).attr('checked'))
					sellChk[$(this).attr('name')] = 1;
				else
					sellChk[$(this).attr('name')] = 0;
			});
			
			
			var parents = [];
			$('.ct-parent-category').find('input').each(function(index){
				console.log(index);
				if($(this).attr('checked')){
					parents[index] = $(this).attr('name');
					console.log(parents[index]);
					console.log(parents.length);
				}
			});
			
			var query = getJsonFromUrl();
			var mainContent = $('#main-content');
			
			$.ajax({
				url: $(location).attr('pathname')+'/parentFilter',
				type: 'POST',
				dataType: 'json',
				data: {'keyword': query.keyword, 'sellChk':JSON.stringify(sellChk), 'parents':JSON.stringify(parents)},
				success: function(data){
					mainContent.empty();
					var allCnt = $('.allCnt');
					
					allCnt.text('0');
										
					if(data.data != 'empty'){
						
						allCnt.text(data.allCnt);
						
						var pList = data.plist;
						var likeList = data.llist;
						
							
							
						for(var p=0; p<pList.length; p++){
							var product = pList[p];
							console.log(product.title);
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
							
							
							
							
							
						
						
						
						
						
					}
				}
			});
			
			
		});
	});
	</script>
</section>
