<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/resources/css/profile/point.css" rel="stylesheet" />
<script src="/resources/js/member/profile/point.js"></script>
<script src="/resources/js/member/inc/aside.js"></script>

<section class="content">
	<div class="menu-button mobile-block">
		<input type="button" value=">" />
	</div>
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
	<div class="total-point" dir="rtl">
		<span>
			Total:<a>&nbsp;${point1 }</a>P
		</span>
	</div>
	
	<div id="point">
		<table class="table">
			<thead>
				<tr>
					<th>날짜</th>
					<th>사용내역</th>
					<th>포인트</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="n" items="${pointHistory}">
				<tr>
					<td>${n.date}</td>
					<td>${n.content}</td>
					<td>${n.point}P</td>
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