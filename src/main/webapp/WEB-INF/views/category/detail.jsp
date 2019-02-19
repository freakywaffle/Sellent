<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<link href="/resources/css/category/content/detail.css" rel="stylesheet"/>
<script src="/resources/js/category/content/detail.js"></script>
<section class="content">
	<div class="main-content">
		<div class="user-bt-group">
			<div>
				<input type="button" value="삭제"/>
				<input type="button" value="수정"/>
			</div>
		</div>
		<div class="breadcrumb">홈>메인카테고리>서브카테고리</div>
		<div class="top-content">
			<div>
				<div class="post-img">
					<div>
						<c:if test="${!empty map.thumbnail}">
							<img class="thumbnail" src='<spring:url value="${map.root }"/>${map.product.no}/${map.thumbnail}' />
						</c:if>
					</div>
					<div>
						<ul class="img-list">
							<c:forEach var="n" items="${map.files }" varStatus="status">
								<c:choose>
									<c:when test="${status.index lt 2}">
										<li><img src='<spring:url value="${map.root }" />${map.product.no}/${n.saveName}' /></li>
									</c:when>
									<c:otherwise>
										<li class="mobile-hidden"><img src='<spring:url value="${map.root }" />${map.product.no}/${n.saveName}' /></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="star-point">
					<div class="star">
						<c:forEach begin="1" end="${map.product.avgStarPoint-(map.product.avgStarPoint%1) }">
							<img src="/resources/images/big-fullstar.png"/>
						</c:forEach>
						<c:forEach begin="${map.product.avgStarPoint-(map.product.avgStarPoint%1)+1}" end="5">
							<img src="/resources/images/big-binstar.png"/>
						</c:forEach>
					</div>
					<div>
						<span class="avgStarPoint">${map.product.avgStarPoint }</span>&nbsp;&nbsp;&nbsp;<span class="reviewCnt">(${map.product.reviewCnt }명의 평가)</span>
					</div>
				</div>
			</div>
			<div class="simple-content">
				<input type="hidden" value="${map.product.writerId }">				
				<div class="sc-title">
					${map.product.title}
				</div>
				<div class="sc-content">
					<h2>${map.product.nickname }</h2>
					<div class="text">
						${map.product.simpleContent }
					</div>
					<ul>
						<li>
							<img src="/resources/images/price-tag.png"/>
							판매여부: 
							<c:choose>
								<c:when test="${map.product.sellCheck eq 0}">
									NO 
								</c:when>
								<c:otherwise>
									YES
								</c:otherwise>
							</c:choose> 
						</li>
						<li>
							<img src="/resources/images/clock.png"/>
							제작기간: ${map.product.duration }
						</li>
						<li>
							<img src="/resources/images/edit.png"/>
							수정횟수: ${map.product.editCnt } 
						</li>
					</ul>
					<div class="priceTag">
						가격: ${map.product.price }
					</div>
					
					<div>
						<button class="buy-bt" type="button">
							<c:if test="${empty buyed }">
								구매신청
							</c:if>
							<c:if test="${!empty buyed }">
								신청취소
							</c:if>
						</button>
						<button class="like-bt" type="button">
							<c:choose>
								<c:when test="${empty map.like }">
									<i class="fas fa-heart"></i>
								</c:when>
								<c:otherwise>
									<i class="fas fa-heart fav"></i>
								</c:otherwise>
							</c:choose>
							<span>찜하기</span>
						</button>
								
					</div>
				</div>
			</div>
		</div>
		<div class="bottom-content">
			<div class="profile-info">
				<div class="profile-photo" >
					<img src='<spring:url value="/sellent/profile/"/>${map.product.writerId}/${map.product.photo}'/>
				</div>
				<div class="profile-name">
					<span>${map.product.nickname }</span>
				</div>
				<div class="profile-table">
					<ul>
						<li><p>${map.member.sell_count }</p><p>판매건수</p></li>
						<li><p>${map.member.product_count }</p><p>작업개수</p></li>
						<li><p>${map.member.star_point }</p><p>평점</p></li>
					</ul>
				</div>
				<div class="chat-bt">
					<input type="button" value="문의하기"/>
				</div>
			</div>		
			<div class="detail">
				<div class="detail-index">
					<ul>
						<li class="lookup">상세설명</li>
						<li>사용자평가</li>
						<li>평가작성</li>
					</ul>
				</div>
				<div class="contents">
					<div class="detail-content" >
						<h2>상세설명</h2>
						<div>
							${map.product.detailContent }
						</div>
					</div>
					<div class="review-list">
						<h2>사용자평가(<span>${map.product.reviewCnt }</span>)</h2>
						<div>
							<spring:url var="springroot" value="/sellent/profile/"/>
							<c:forEach var="review" items="${reviews }">
								<div class="review">
									<div class="review-profile-photo">
										<img src='${springroot}${review.writer_id }/${review.photo}'/>
									</div>
									<div class="rv-content">
										<p>${review.nickname }</p>
										<div>
											${review.content }
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<div>
							<input type="button" value="더보기" class="more"/>
						</div>
					</div>
					
					
					<div class="review-reg-form">
						<h2>평가작성</h2>
						<div>
							<textarea rows="10" cols="100" name="content"></textarea>
							<div>
								<select>
									<option value="0">별점선택</option>
									<option value="5">★★★★★</option>
									<option value="4">★★★★☆</option>
									<option value="3">★★★☆☆</option>
									<option value="2">★★☆☆☆</option>
									<option value="1">★☆☆☆☆</option>
								</select>
								<input type="hidden" name="starpoint"/>
								<input type="button" value="작성" />
							</div>
						</div>
					</div>
					<script>
					$(document).ready(function(){
						//review 등록
						var reviewForm = $('.review-reg-form');
						var reviewBt = reviewForm.find('input[type="button"]');
						reviewBt.on('click',function(){
							
							if($('.member-menu').children().eq(0).prop('nodeName') == 'UL'){
								swal({
									title:'로그인해주세요',
									icon: "warning",
								}).then(function(willDelete){
									$(location).attr('pathname', '/member/login');
								});
								return;
							}
							var starpoint = reviewForm.find('input[type="hidden"]').val()
							var textarea = reviewForm.find('textarea');
							if(starpoint == 0){
								alert('별점을 선택해주세요');
								return;
							}
							
							var json = {
									"content":textarea.val(),
									"starpoint":starpoint,
							};
							
							
							$.ajax({
								url: $(location).attr('pathname')+'/review',
								type:'POST',
								data: "json="+JSON.stringify(json),
								success: function(data){
									
									
									
									var reviewsCnt = $('.review-list').find('span');
									var jsonData = jQuery.parseJSON(data);
								
									var reviews = jsonData.reviews;
									var totalCnt = jsonData.reviewCnt;
									
									reviewsCnt.text(totalCnt);
									
									var reviewListDiv = $('.review-list').children().eq(1);
									reviewListDiv.empty();
									for(var i=0;i<reviews.length;i++){
										var p =$('<p></p>').text(reviews[i].nickname);
										var contentDiv = $('<div></div>').text(reviews[i].content);
										var rvContent = $('<div></div>').addClass('rv-content');
										rvContent.append(p);
										rvContent.append(contentDiv);
										
										var springurl = '${springroot}';
										
										var profilePhoto = $('<img />').attr('src', springurl+reviews[i].writer_id+'/'+reviews[i].photo);
										var reviewDiv = $('<div></div>').addClass('review');
										reviewDiv.append(profilePhoto);
										reviewDiv.append(rvContent);
										
										reviewListDiv.append(reviewDiv);
									}
									if(totalCnt>10)
										more.removeClass('hidden');
									
									textarea.val('');
									var avgStarPoint = jsonData.avgStarPoint.toFixed(1);
									var star = $('.star');
									
									for(var i=1; i<= avgStarPoint;i++){
										star += '<img src="/resources/images/big-fullstar.png"/>';
									}
									
									for(var i=avgStarPoint-avgStarPoint%1+1; i<=5;i++){
										star += '<img src="/resources/images/big-binstar.png"/>';
									}
										
									$('.avgStarPoint').text(avgStarPoint);
									$('.star-point').find('.reviewCnt').text('('+totalCnt+'명의 평가)');
								}
							
							});
						});
						
						//review페이징 처리
						var more = $('.more');
						more.on('click',function(){
							var cnt = $('.review').length;
							var pageCnt = Math.ceil((cnt)/10)*10;
							if(pageCnt == cnt)
								pageCnt+=10;
							$.ajax({
								url: $(location).attr('pathname')+'/moreReview?cnt='+pageCnt,
								type:'GET',
								success: function(data){
									var reviewsCnt = $('.review-list').find('span');
									var jsonData = jQuery.parseJSON(data);
									
									var reviews = jsonData.reviews;
									var totalCnt = jsonData.reviewCnt;
									
									reviewsCnt.text(totalCnt);
									
									var reviewListDiv = $('.review-list').children().eq(1);
									reviewListDiv.empty();
									for(var i=0;i<reviews.length;i++){
										var p =$('<p></p>').text(reviews[i].nickname);
										var contentDiv = $('<div></div>').text(reviews[i].content);
										var rvContent = $('<div></div>').addClass('rv-content');
										rvContent.append(p);
										rvContent.append(contentDiv);
										
										var springurl = '${springroot}';
										
										var profilePhoto = $('<img />').attr('src', springurl+reviews[i].writer_id+'/'+reviews[i].photo);
										var reviewDiv = $('<div></div>').addClass('review');
										reviewDiv.append(profilePhoto);
										reviewDiv.append(rvContent);
										reviewListDiv.append(reviewDiv);
									}
									
									
									if(reviews.length >= totalCnt)
										more.addClass('hidden');
									else
										more.removeClass('hidden');
								}
							
							});
						});
					});
					</script>
				</div>
			</div>
		</div>
	</div>
</section>

