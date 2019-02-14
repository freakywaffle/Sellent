<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>     
<link href="/resources/css/category/content/list.css" rel="stylesheet"/>
<script src="/resources/js/category/content/list.js"></script>
<section class="content">
	<div class="menu-button mobile-block">
		<input type="button" value=">" />
	</div>
	<div class="top-content">
		<div class="breadcrumb">프로젝트 > 평가</div>
		<div class="top-right-content">
			<input type="button" value="글쓰기" class="reg-bt"/> 
			<select>
				<option>분류검색</option>
			</select>
		</div>
	</div>
	<div id="main-content">
		<c:forEach var="p" items="${plist }">
			<div class="contents">
				<div class="title-img"><img alt="타이틀 이미지" src='<spring:url value="/sellent/upload/"/>${p.no}/${p.thumbnail}'/></div>
				<div class="detail">
					<div class="like">
						<img alt="좋아요" src="/resources/images/bin-heart.png">
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
							<div class="won-img"><img alt="돈" src="/resources/images/save-money.png"></div>
							<div class="money">${p.price }</div>
						</div>
						<div class="star-point">
							<div><img alt="별점" src="/resources/images/small-fullstar.png"/></div>
							<div><img alt="별점" src="/resources/images/small-fullstar.png"/></div>
							<div><img alt="별점" src="/resources/images/small-halfstar.png"/></div>
							<div><img alt="별점" src="/resources/images/small-binstar.png"/></div>
							<div><img alt="별점" src="/resources/images/small-binstar.png"/></div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="bottom-content">
		<input type="button" value="더보기" />
	</div>
</section>