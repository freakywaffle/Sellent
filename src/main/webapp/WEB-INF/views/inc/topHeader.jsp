<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/security/tags" %>
<link href="/resources/css/inc/topHeader.css" rel="stylesheet"/>
<script src="/resources/js/inc/topHeader.js"></script>
<section class="top-header">
	<div class="logo-bar">
		<div class="logo">SELLENT</div>
		<div class="member-menu">
			<spring:authorize access="isAnonymous()">
				<ul class="before-login">
					<li class="menu"><a href="#">로그인</a></li>
					<li class="menu"><a href="#">회원가입</a></li>
				</ul>
			</spring:authorize>
			<spring:authorize access="isAuthenticated()">
				<div class="after-login">
					<span class="mobile-hidden">${pageContext.request.userPrincipal.name}</span>
					<img src="/resources/images/joboa.png" />
					<div class="my-menu hidden">
						<ul>
							<li>1500P</li>
							<li>마이페이지</li>
							<li>프로필</li>
							<li><a href="/member/logout">로그아웃</a></li>
						</ul>
					</div>
				</div>
			</spring:authorize>
		</div>
	</div>
	<div class="search-bar">
		<div>
			<input type="search" placeholder="검색"/>
			<button type="submit">
				<img src="/resources/images/search.png" />
			</button>
			
		</div>
	</div>
</section>