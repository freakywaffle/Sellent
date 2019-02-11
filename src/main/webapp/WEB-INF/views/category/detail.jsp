<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<link href="/resources/css/category/content/detail.css" rel="stylesheet"/>
<script src="/resources/js/category/content/detail.js"></script>
<section class="content">
	<div class="main-content">
		
		<div class="breadcrumb">홈>메인카테고리>서브카테고리</div>
		<div class="top-content">
			<div>
				<div class="post-img">
					<div>
						<c:if test="${!empty thumbnail}">
							<img src='<spring:url value="${root }"/>${product.no}/${thumbnail}' />
						</c:if>
					</div>
					<div>
						<ul class="img-list">
							<c:forEach var="n" items="${files }" varStatus="status">
								<c:choose>
									<c:when test="${status.index lt 2}">
										<li><img src='<spring:url value="${root }" />${product.no}/${n.saveName}' /></li>
									</c:when>
									<c:otherwise>
										<li class="mobile-hidden"><img src='<spring:url value="${root }" />${product.no}/${n.saveName}' /></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="star-point">
					<img src="/resources/images/small-fullstar.png"/>
					<img src="/resources/images/small-fullstar.png"/>
					<img src="/resources/images/small-fullstar.png"/>
					<img src="/resources/images/small-fullstar.png"/>
					<img src="/resources/images/small-fullstar.png"/>
					<span>(10명의 평가)</span>
				</div>
			</div>
			<div class="simple-content">
				<div class="sc-title">
					${product.title}
				</div>
				<div class="sc-content">
					<h2>${product.writerId }</h2>
					<div class="text">
						${product.simpleContent }
					</div>
					<ul>
						<li>
							<img src="/resources/images/price-tag.png"/>
							판매여부: 
							<c:choose>
								<c:when test="${product.sellCheck eq 0}">
									NO 
								</c:when>
								<c:otherwise>
									YES
								</c:otherwise>
							</c:choose> 
						</li>
						<li>
							<img src="/resources/images/clock.png"/>
							제작기간: ${product.duration }
						</li>
						<li>
							<img src="/resources/images/edit.png"/>
							수정횟수: ${product.editCnt } 
						</li>
					</ul>
					<div>
						<button class="buy-bt" type="button">${product.price }</button>
						<button class="like-bt" type="button"><img src="/resources/images/bin-heart.png"/><span>찜하기</span></button>
					</div>
				</div>
			</div>
		</div>
		<div class="bottom-content">
			<div class="profile-info">
				<div class="profile-photo" >
					<img src="/resources/images/joboa.png"/>
				</div>
				<div class="profile-name">
					<span>${product.writerId }</span>
				</div>
				<div class="profile-table">
					<ul>
						<li><p>10</p><p>판매건수</p></li>
						<li><p>23</p><p>작업개수</p></li>
						<li><p>4.1</p><p>평점</p></li>
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
						<li class="no-lookup">사용자평가</li>
						<li class="no-lookup">평가작성</li>
					</ul>
				</div>
				<div class="contents">
					<div class="detail-content" >
						<h2>상세설명</h2>
						<div>
							${product.detailContent }
						</div>
					</div>
					<div class="review-list">
						<h2>사용자평가(10)</h2>
						<div>
							<div class="review">
								<img src="/resources/images/joboa.png"/>
								<div class="rv-content">
									<p>khh1111</p>
									<div>
										작업속도가 굉장히 빠르시고 완성도도 정말 마음에 드네요!
										다음에도 일이 생기면 꼭 의뢰하겠습니다
									</div>
								</div>
							</div>
							<div class="review">
								<img src="/resources/images/joboa.png"/>
								<div class="rv-content">
									<p>khh1111</p>
									<div>
										작업속도가 굉장히 빠르시고 완성도도 정말 마음에 드네요!
										다음에도 일이 생기면 꼭 의뢰하겠습니다
									</div>
								</div>
							</div>
							<div class="review">
								<img src="/resources/images/joboa.png"/>
								<div class="rv-content">
									<p>khh1111</p>
									<div>
										작업속도가 굉장히 빠르시고 완성도도 정말 마음에 드네요!
										다음에도 일이 생기면 꼭 의뢰하겠습니다
									</div>
								</div>
							</div>
							<div class="review">
								<img src="/resources/images/joboa.png"/>
								<div class="rv-content">
									<p>khh1111</p>
									<div>
										작업속도가 굉장히 빠르시고 완성도도 정말 마음에 드네요!
										다음에도 일이 생기면 꼭 의뢰하겠습니다
									</div>
								</div>
							</div>
							<div class="review">
								<img src="/resources/images/joboa.png"/>
								<div class="rv-content">
									<p>khh1111</p>
									<div>
										작업속도가 굉장히 빠르시고 완성도도 정말 마음에 드네요!
										다음에도 일이 생기면 꼭 의뢰하겠습니다
									</div>
								</div>
							</div>
						</div>
						<div>
							<input type="button" value="더보기"/>
						</div>
					</div>
					<div class="review-reg-form">
						<h2>평가작성</h2>
						<div>
							<textarea rows="10" cols="100"></textarea>
							<div>
								<select>
									<option>★★★★★</option>
									<option>★★★★☆</option>
									<option>★★★☆☆</option>
									<option>★★☆☆☆</option>
									<option>★☆☆☆☆</option>
								</select>
								<input type="button" value="작성" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>