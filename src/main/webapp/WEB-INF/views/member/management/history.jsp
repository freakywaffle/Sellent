<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<link href="/resources/css/member/history.css" rel="stylesheet" />
<script src="/resources/js/management/history.js"></script>
<script src="/resources/js/member/inc/aside.js"></script>
<section class="content">
	<div class="menu-button mobile-block">
		<input type="button" value=">" />
	</div>
	<div id="top-content">

		<div class="select">
			<select id="options">
				<option name="sell" value=0 class="selec">판매</option>
				<option name="buy"  value=1 class="selec">구매</option>
			</select>
		</div>
	</div>
	<div id="history">
		<table class="table">
			<thead>
				<tr>
					<th class="pdate">날짜</th>
					<th class="ptitle">프로젝트 제목</th>
					<th class="pprice">금액</th>
					<th class="pid">아이디</th>
					<th class="pstate">상태</th>
					<th class="pstate2">처리</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="n" items="${product}">
				<tr>
					<input name='num' type="hidden" value="${n.no }"/>
					<td>${n.date }</td>
					<td><a href="/category/${n.parent_category }/${n.product_no}">${n.title }</a></td>
					<td><fmt:formatNumber value="${n.price}" type="currency" currencySymbol="￦"/></td>				
					<td class="table-id">
						<c:if test="${showPart == '판매' }">
							${n.buyer_id }
						</c:if>
						<c:if test="${showPart == '구매' }">
							${n.seller_id }
						</c:if>
						
	
					
					</td>
					<td class="state" name="state">
						${n.state}
						
					</td>
					<td class="td">
						<input name="accep" class="accep btn1" type="button" value="수락"/>
						<input name="deny" class="deny btn1" type="button" value="거절 "/>
						<input name="complete" class="complete" type="button" value="작업완료"/>
						<input name="buy" class="buy hidden" type="button" value="결제"/>
					</td>
				</tr>
			</c:forEach>	
			</tbody>
		</table>
		<div id="page">
		<ul>
			<c:if test="${prev}">
				<li><a href="?p=${startpage }"><img alt="이전" src="/resources/images/prev.png"></a></li>
			</c:if>
			<c:forEach var="n" begin="${startpage+1}" end="${endpage }">	
				<li><a href="?p=${n }">${n }</a></li>
			</c:forEach>
			<c:if test="${next && endpage >0 }">
				<li><a href="?p=${endpage+1} "><img alt="다음" src="/resources/images/next.png"></a></li>
			</c:if>
		</ul>
	</div>
	</div>

</section>