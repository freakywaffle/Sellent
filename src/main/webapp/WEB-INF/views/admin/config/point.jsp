<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/config/point.css" />
<script src="/resources/js/admin/config/point.js"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="aside">
	<div class="aside-title">
		환경설정
	</div>
	<ul class="aside-category-list">
		<li><a href="/admin/config/banner">배너관리</a></li>
		<li><a href="/admin/config/point">포인트설정</a></li>
		<li><a href="/admin/config/admin">관리자설정</a></li>
	</ul>
</section>

<section class="content">
	<div class="top-content">
		<label>환경설정 > 포인트설정</label>
		<div class="top-right-content">
			
		</div>
	</div>
	
	<main id="main">
	
			<form action="">
			<section class="content-box">
				<table class="table-main">
					<thead class="thead">
						<tr>
							<td>포인트내역</td>
							<td>포인트</td>
							<td>사용유무</td>
						</tr>
					</thead>
					<tbody class="tbody">
					
					<c:set var="i" value="0" />
					<c:forEach items="${list }" var="pointConf">
				
						<tr class="pointConf-obj">
							<td class="pointConf-content">${pointConf.content }</td>
							<td class="td-text">
								<input class="pointConf-point" name="text" type="text" value="${pointConf.point }"/>
							</td>
							<td class="td-radio">
								<div class="div-radio pointConf-use">
								<c:choose>
									<c:when test="${pointConf.use eq 1}">
										<input name="use${i}" type="radio" checked="checked" value="1"/>
										<span>사용</span>
										<input name="use${i}" type="radio" value="0"/>
										<span>사용안함</span>
									</c:when>
								
									<c:when test="${pointConf.use eq 0}">
										<input name="use${i}" type="radio" value="1"/>
										<span>사용</span>
										<input name="use${i}" type="radio" checked="checked" value="0"/>
										<span>사용안함</span>
									</c:when>
								</c:choose>
								</div>
							</td>
						</tr>
						
						<c:set var="i" value="${i + 1 }"/>
					</c:forEach>
					</tbody>
				</table>
	
				<div class="table-bottom">
					<button id="save-button" type="button" class="btn btn-success">저장</button>
				</div>
			</section>
			</form>
		
	</main>
</section>