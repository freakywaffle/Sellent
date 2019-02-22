<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<link href="/resources/css/member/aside.css" rel="stylesheet"/>
<section class="aside aside-close">
	<h1 class="hidden">사이드 메뉴</h1>	
	<div class="ct-wrapper">	
		<h2>${pageTitle }</h2>
		
		<c:if test="${pageTitle == '관리'}">
			<div class="ct-sub-category">
			<h3>카테고리</h3>
			<ul>
				<li><a href="../member/project"><div>ㅡ</div><div>프로젝트</div></a></li>
				<li><a href="../member/history"><div>ㅡ</div><div>HISTORY</div></a></li>
				<li><a href="../member/statics"><div>ㅡ</div><div>통계</div></a></li>
				
			</ul>
		</div>
		</c:if>
		
		<c:if test="${pageTitle == '대화'}">
			<div class="ct-sub-category">
			<h3>카테고리</h3>
			<ul>
				<li><div>ㅡ</div><div>대화</div></li>		
			</ul>
		</div>
		</c:if>
		
		<c:if test="${pageTitle == '계정'}">
			<div class="ct-sub-category">
			<h3>카테고리</h3>
			<ul>
				<li><a href="../member/editInfo"><div>ㅡ</div><div>정보소개</div></a></li>
				<li><a href="../member/introduce"><div>ㅡ</div><div>자기소개</div></a></li>
				<li><a href="../member/point"><div>ㅡ</div><div>포인트내역</div></a></li>
				
			</ul>
		</div>
		</c:if>
		
		<c:if test="${pageTitle == '후기'}">
			<div class="ct-sub-category">
			<h3>카테고리</h3>
			<ul>
				<li><a href="../member/review"><div>ㅡ</div><div>후기</div></a></li>				
			</ul>
		</div>
		</c:if>
		
	</div>
	<div class="close-button">
		<input type="button" value="&lt;">
	</div>
</section>