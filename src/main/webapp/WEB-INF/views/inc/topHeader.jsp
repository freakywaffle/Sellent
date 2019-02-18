<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spr" uri="http://www.springframework.org/tags" %>  
<link href="/resources/css/inc/topHeader.css" rel="stylesheet"/>

<script src="/resources/js/inc/topHeader.js"></script>
<section class="top-header">
	<div class="logo-bar">
		<div class="logo"><a href="../index">SELLENT</a></div>
		<div class="member-menu">
			<spring:authorize access="isAnonymous()">
				<ul class="before-login">
					<li class="menu"><a href="#">로그인</a></li>
					<li class="menu"><a href="#">회원가입</a></li>
				</ul>
			</spring:authorize>
			<spring:authorize access="isAuthenticated()">
				<div class="after-login">
					<span class="mobile-hidden">${sessionScope.member.nickname}</span>
					<img src='<spr:url value="/sellent/profile/"/>${sessionScope.member.id}/${sessionScope.member.photo}' />
					<div class="my-menu hidden">
					<ul>
						<li>1500P</li>
						<li><a href="../member/project">마이페이지</a></li>
						<li class="prof">프로필</li>
						<li><a href="/member/logout">로그아웃</a></li>
					</ul>
					</div>
				</div>
				<jsp:include page="/WEB-INF/views/inc/profile.jsp" />
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