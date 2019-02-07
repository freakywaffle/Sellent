<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/resources/css/member/static.css" rel="stylesheet" />
<script src="//www.google.com/jsapi"></script>
<script src="/resources/js/member/management/static.js"></script>
<section class="content">
	<div id="top-content">

		<div class="select">
			<select>
				<option>평가</option>
				<option>판매</option>
				<option>구매</option>
			</select>
		</div>
	</div>
	<div id="chart_div"></div>
	
	<div id="history">
		<div class="title">평점 평균</div>
		<table class="table">
			<thead>
				<tr>
					<th>MONTH</th>
					<th>10</th>
					<th>11</th>
					<th>12</th>
					<th>01</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>평점</td>
					<td>3.5</td>
					<td>2.5</td>
					<td>3.5</td>
					<td>2.0</td>
				</tr>
			</tbody>
		</table>
	</div>
</section>