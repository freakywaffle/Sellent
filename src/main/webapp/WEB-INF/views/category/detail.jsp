<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<link href="/resources/css/category/content/detail.css" rel="stylesheet"/>
<script src="/resources/js/category/content/detail.js"></script>
<section class="content">
	<div class="main-content">
		<c:if test="${sessionScope.member.id == map.product.writerId}">
		<div class="user-bt-group">
			<div>
				<input type="button" value="수정" class="editBt"/>
				<input type="button" value="삭제" class="delBt"/>
			</div>
		</div>
		</c:if>
		<div class="custom-breadcrumb">홈 > 메인카테고리 > 서브카테고리</div>
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
					<pre class="text" >${map.product.simpleContent }</pre>
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
						<fmt:formatNumber value="${map.product.price }" type="currency" currencySymbol="￦"/>
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
						<li><p>판매건수</p><p>${map.member.sell_count }</p></li>
						<li><p>작업개수</p><p>${map.member.product_count }</p></li>
						<li><p>평점</p><p>${map.member.star_point }</p></li>
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
						<pre>${map.product.detailContent }</pre>
					</div>
					<div class="review-list">
						<h2>사용자평가(<span>${map.product.reviewCnt }</span>)</h2>
						<div>
							<spring:url var="springroot" value="/sellent/profile/"/>
							<c:forEach var="review" items="${reviews }">
								<div class="review">
									<input type="hidden" value="${review.no }">
									<div class="review-profile-photo">
										<img src='${springroot}${review.writer_id }/${review.photo}'/>
									</div>
									<div class="rv-content">
										<span>${review.nickname }</span>
										<span class="review-star">
											<c:forEach begin="1" end="${review.starpoint}">
												<img class="full" src="/resources/images/big-fullstar.png"/>
											</c:forEach>
											<c:forEach begin="${review.starpoint+1}" end="5">
												<img class="bin" src="/resources/images/big-binstar.png"/>
											</c:forEach>
										</span>
										<pre>${review.content }</pre>
									</div>
									<c:if test="${review.writer_id == sessionScope.member.id }">
										<div class="close-bt">
											<p><i class="fas fa-times"></i></p>
											<p><i class="fas fa-pen-square"></i></p>
										</div>
									</c:if>
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
								<input class="write-bt" type="button" value="작성" />
								<input class="edit-bt hidden"  type="button" value="수정" />
							</div>
						</div>
					</div>
					<script>
					$(document).ready(function(){
						
						bindDel();
						bindEdit();
						
						
						
						//review 등록
						var reviewForm = $('.review-reg-form');
						var reviewBt = reviewForm.find('.write-bt');
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
								dataType: 'json',
								data: {"json":JSON.stringify(json)},
								success: function(data){
									
									var reviewsCnt = $('.review-list').find('span');
									var jsonData = data;
								
									var reviews = jsonData.reviews;
									var totalCnt = jsonData.reviewCnt;
									
									reviewsCnt.text(totalCnt);
									
									var reviewListDiv = $('.review-list').children().eq(1);
									reviewListDiv.empty();
									for(var i=0;i<reviews.length;i++){
										var span =$('<span></span>').text(reviews[i].nickname);
										var reviewStar = $('<span class="review-star"></span>');
										
										
										for(var j=0;j<reviews[i].starpoint;j++){
											var fullStar = $('<img class="full" src="/resources/images/big-fullstar.png"/>');
											reviewStar.append(fullStar);
											reviewStar.append('&nbsp;');
										}
										for(var j=reviews[i].starpoint;j<5;j++){
											var binStar = $('<img class="bin" src="/resources/images/big-binstar.png"/>');
											reviewStar.append(binStar);
											reviewStar.append('&nbsp;');
										}
										
										
										var contentDiv = $('<pre></pre>').text(reviews[i].content);
										var rvContent = $('<div></div>').addClass('rv-content');
										rvContent.append(span);
										rvContent.append(reviewStar);
										rvContent.append(contentDiv);
										
										var springurl = '${springroot}';
										
										var profilePhoto = $('<img />').attr('src', springurl+reviews[i].writer_id+'/'+reviews[i].photo);
										var reviewProfilePhoto = $('<div></div>');
										reviewProfilePhoto.addClass('review-profile-photo');
										reviewProfilePhoto.append(profilePhoto);
										
										
										var inputHidden = $('<input type="hidden" />');
										inputHidden.val(reviews[i].no);
										
										var reviewDiv = $('<div></div>').addClass('review');
										reviewDiv.append(inputHidden);
										reviewDiv.append(reviewProfilePhoto);
										reviewDiv.append(rvContent);
										
										var loginId = '${sessionScope.member.id}';

										if(loginId == reviews[i].writer_id){
											var btDiv = $('<div class="close-bt"></div>');
											var iconP = $('<p><i class="fas fa-times"></i></p>');
											var iconP2 = $('<p><i class="fas fa-pen-square"></i></p>');
											btDiv.append(iconP);
											btDiv.append(iconP2);
											reviewDiv.append(btDiv);
										}
										
										
										reviewListDiv.append(reviewDiv);
									}
									if(totalCnt>10)
										more.removeClass('hidden');
									
									textarea.val('');
									var avgStarPoint = jsonData.avgStarPoint.toFixed(1);
									var star = $('.star');
									star.empty();
									for(var i=1; i<= avgStarPoint;i++){
										star.append($('<img src="/resources/images/big-fullstar.png"/>'));
									}
									
									for(var i=avgStarPoint-avgStarPoint%1+1; i<=5;i++){
										star.append($('<img src="/resources/images/big-binstar.png"/>')) ;
									}
										
									$('.avgStarPoint').text(avgStarPoint);
									$('.star-point').find('.reviewCnt').text('('+totalCnt+'명의 평가)');
									
									

									bindDel();
									bindEdit();
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
										var span =$('<span></span>').text(reviews[i].nickname);
										var reviewStar = $('<span class="review-star"></span>');
										
										
										for(var j=0;j<reviews[i].starpoint;j++){
											var fullStar = $('<img class="full" src="/resources/images/big-fullstar.png"/>');
											reviewStar.append(fullStar);
											reviewStar.append('&nbsp;');
										}
										for(var j=reviews[i].starpoint;j<5;j++){
											var binStar = $('<img class="bin" src="/resources/images/big-binstar.png"/>');
											reviewStar.append(binStar);
											reviewStar.append('&nbsp;');
										}
										
										
										
										var contentDiv = $('<pre></pre>').text(reviews[i].content);
										var rvContent = $('<div></div>').addClass('rv-content');
										rvContent.append(span);
										rvContent.append(reviewStar);
										rvContent.append(contentDiv);
										
										var springurl = '${springroot}';
										
										var profilePhoto = $('<img />').attr('src', springurl+reviews[i].writer_id+'/'+reviews[i].photo);
										var reviewProfilePhoto = $('<div></div>');
										reviewProfilePhoto.addClass('review-profile-photo');
										reviewProfilePhoto.append(profilePhoto);
										
										var reviewDiv = $('<div></div>').addClass('review');
										reviewDiv.append(reviewProfilePhoto);
										reviewDiv.append(rvContent);
										
										var loginId = '${sessionScope.member.id}';

										if(loginId == reviews[i].writer_id){
											var btDiv = $('<div class="close-bt"></div>');
											var iconP = $('<p><i class="fas fa-times"></i></p>');
											var iconP2 = $('<p><i class="fas fa-pen-square"></i></p>');
											btDiv.append(iconP);
											btDiv.append(iconP2);
											reviewDiv.append(btDiv);
										}
										
										reviewListDiv.append(reviewDiv);
									}
									
									
									if(reviews.length >= totalCnt)
										more.addClass('hidden');
									else
										more.removeClass('hidden');
									
									
									

									bindDel();
									bindEdit();
								}
							
							});
						});
						
						//review 수정
						
						function bindEdit(){
							
							var reviewClose = $('.review .fa-pen-square');
							reviewClose.click(function(e){
								var editBt = $('.edit-bt');
								
								var thisReview = $(this).parent().parent().parent();
								
								var currentPre = thisReview.find('pre');
								var currentContent = currentPre.text();
								var currentStar = thisReview.find('.review-star .full').length;
								
								console.log(currentStar);
								
								reviewBt.addClass('hidden');
								editBt.removeClass('hidden');
								
								$('.review-reg-form').find('textarea').text(currentContent);
								var options = $('.review-reg-form').find('option');
								for(var i=0;i<options.length;i++){
									if(options.eq(i).val() == currentStar){
										options.eq(i).attr('selected','selected');
										break;									
									}
									
								}
								
								$('.review-reg-form').find('textarea').focus();
								
								
								var thisNo = thisReview.find('input[type="hidden"]').val();
								
								editBt.click(function(){
									var newData = $('.review-reg-form').find('textarea').val();
									var newStarPoint = $('.review-reg-form').find('select').val();
									alert(newData);
									$.ajax({
										url: $(location).attr('pathname')+'/editReview',
										type: 'POST',
										dataType: 'json',
										data: {'content': newData, 'no':thisNo, 'starPoint':newStarPoint},
										success: function(data){
											currentPre.text(newData);
											var currentReviewStar = thisReview.find('.review-star');
											
											currentReviewStar.empty();
											for(var j=0;j<newStarPoint;j++){
												var fullStar = $('<img class="full" src="/resources/images/big-fullstar.png"/>');
												currentReviewStar.append(fullStar);
												currentReviewStar.append('&nbsp;');
											}
											for(var j=newStarPoint;j<5;j++){
												var binStar = $('<img class="bin" src="/resources/images/big-binstar.png"/>');
												currentReviewStar.append(binStar);
												currentReviewStar.append('&nbsp;');
											}
											
											
											$('.review-reg-form').find('textarea').val('');
											$('.review-reg-form').find('option').eq(0).attr('selected','selected');
										}
										
									});
									
								});
							});
						}
						
						//review 삭제
						
						function bindDel(){
						
							var reviewDel = $('.review .fa-times');
							reviewDel.click(function(e){
								var thisReview = $(this).parent().parent().parent();
								var thisNo = thisReview.find('input[type="hidden"]').val();
								console.log(thisNo);
								$.ajax({
									url: $(location).attr('pathname')+'/delReview',
									type:'POST',
									dataType:'json',
									data:{'no':thisNo},
									success: function(data){
										thisReview.remove();
										
										var cntSpan = $('.review-list h2 span');
										
										
										cntSpan.text(data.cnt);
										var avgStarPoint = data.avg.toFixed(1);
										var star = $('.star');
										star.empty();
										for(var i=1; i<= avgStarPoint;i++){
											star.append($('<img src="/resources/images/big-fullstar.png"/>'));
										}
										
										for(var i=avgStarPoint-avgStarPoint%1+1; i<=5;i++){
											star.append($('<img src="/resources/images/big-binstar.png"/>')) ;
										}
											
										$('.avgStarPoint').text(data.avg);
										$('.star-point').find('.reviewCnt').text('('+data.cnt+'명의 평가)');
										
										
									}
									
									
								});
							});
						}
						
					});
					</script>
				</div>
			</div>
		</div>
	</div>
</section>

