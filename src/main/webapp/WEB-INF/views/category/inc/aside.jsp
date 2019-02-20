<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>  
<tiles:importAttribute name="CtList"/>
<link href="/resources/css/category/inc/aside.css" rel="stylesheet"/>
<script src="/resources/js/category/inc/aside.js"></script>
<section class="aside aside-close">
	<h1 class="hidden">사이드 메뉴</h1>	
	<div class="ct-wrapper">	
		<h2></h2>
		<div class="ct-price hidden">
			<h3>가격</h3>
			<ul>
				<li class="search-option" >
					<input type="checkbox" class="hidden"/>
					<img src="/resources/images/blank-check-box.png"/>
					<span>주니어</span>
				</li>
				<li class="search-option">
					<input type="checkbox" class="hidden"/>
					<img src="/resources/images/blank-check-box.png"/>
					<span>프로</span>
				</li>
			</ul>
		</div>
		<div class="ct-sell-chk">
			<h3>판매여부</h3>
			<ul>
				<li class="search-option">
					<input type="checkbox" name="yes" class="hidden" value="1"/>
					<img src="/resources/images/blank-check-box.png"/>
					<span>YES</span>
				</li>
				<li class="search-option">
					<input type="checkbox" name="no" class="hidden" value="0"/>
					<img src="/resources/images/blank-check-box.png"/>
					<span>NO</span>
				</li>
			</ul>
		</div>
		<div class="ct-sub-category">
			<h3>카테고리</h3>
			<ul>
				<c:forEach var="sc" items="${subCtList }">
					<li><a href="${sc.parentName }?sub=${sc.name }">${sc.name }</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="close-button">
		<input type="button" value="&lt;">
	</div>
</section>