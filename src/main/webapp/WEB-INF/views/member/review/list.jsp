<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/resources/css/review/review.css" rel="stylesheet" />
<script src="/resources/js/review/comment.js"></script>

<section class="content">
	<div id="top-content">

		<div class="select">
			<select id="options">
				<option name="total" value=0 class="selec">total</option>
				<option name="week" value=1 class="selec">1week</option>
				<option name="month" value=2 class="selec">1month</option>
				<option name="year" value=3 class="selec">1year</option>
			</select>
		</div>

	</div>


	<div id="point">
		<table class="table">
			<thead>
				<tr>
					<th>날짜</th>
					<th>글 쓴 내용</th>
					<th>별점</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="n" items="${review}">
				<tr>
					<td>${n.regdate}</td>
					<td class="title-content">${n.content}</td>
					<td>${n.starpoint}</td>
				</tr>
			</c:forEach>
				
			</tbody>
		</table>
		<div id="page">
			<ul>
				<c:if test="${prev}">
					<li><a href="?p=${startpage }"><img alt="이전"
							src="/resources/images/prev.png"></a></li>
				</c:if>
				<c:forEach var="n" begin="${startpage+1}" end="${endpage }">
					<li><a href="?p=${n }">${n }</a></li>
				</c:forEach>
				<c:if test="${next && endpage >0 }">
					<li><a href="?p=${endpage+1} "><img alt="다음"
							src="/resources/images/next.png"></a></li>
				</c:if>
			</ul>
		</div>
	</div>

</section>