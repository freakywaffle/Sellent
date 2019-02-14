<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/security/tags"%>
<link href="/resources/css/inc/mainHeader.css" rel="stylesheet" />
<script src="/resources/js/inc/profile.js"></script>
<script src="/resources/js/inc/topHeader.js"></script>
<script src="/resources/js/main/mainHead.js"></script>


<header id="header">
		<div id="header-wrap">
	<spring:authorize access="isAnonymous()">
			<div class="hamburger">
				<img src="/resources/images/hambuger.png" alt="" id="hamburgericon" />
				<img src="/resources/images/put.png" alt="" id="puticon" />

			</div>
			<div class="login">

				<ul>
					<li><a href="../member/login">로그인</a></li>
					<li><a href="../member/join">회원가입</a></li>
				</ul>


			</div>
	</spring:authorize>
	<spring:authorize access="isAuthenticated()">
		<div class="after-login">
			<span class="mobile-hidden" name="id">${pageContext.request.userPrincipal.name}</span>
			<img src="/resources/images/joboa.png" />
			<div class="my-menu hidden">
				<ul>
					<li>1500P</li>
					<li>마이페이지</li>
					<li class="prof">프로필</li>
					<li><a href="/member/logout">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</spring:authorize>
	<div class="logo">SELLENT</div>
	<div class="search">
		<input type="text" placeholder="검색" />
	</div>
	</div>
	<jsp:include page="../inc/profile.jsp" />
</header>
