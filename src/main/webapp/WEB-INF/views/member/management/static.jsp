<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/resources/css/member/static.css" rel="stylesheet" />
<script src="//www.google.com/jsapi"></script>
<script src="/resources/js/member/management/static.js"></script>
<script src="/resources/js/member/inc/aside.js"></script>


<section class="content">
	<div id="top-content">

		<div class="select">
			<select id="options">
				<option name="anl" value=0 class="selec">평가</option>
				<option name="sell" value=1 class="selec">판매</option>
				<option name="buy" value=2 class="selec">구매</option>
			</select>
		</div>
	</div>
	<div id="chart_div"></div>

	<div id="history">
		<div class="title">평점 평균</div>
		<table class="table">
			<thead class="thead">
				<tr class="tr1">
					<th>MONTH</th>					
				</tr>
			</thead>
			<tbody class="tbody">
				<tr class="tr2">
					<td >평점</td>
				</tr>
			</tbody>
		</table>
	</div>
</section>