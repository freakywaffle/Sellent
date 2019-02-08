<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/config/admin.css" />
<script src="/resources/js/admin/config/admin.js"></script>

<main id="main">

	<section class="content-box">
		
		<div class="condition-form">
			
			<label class="condition-title">게시판 검색</label>
			
			<div class="condition-content">
				<select id="group-select">
					<option>그룹검색</option>
					<option>IT개발</option>
					<option>디자인</option>
					<option>번역</option>
					<option>음악/더빙</option>
				</select>
				<select id="category-select" class="mg-left-5">
						<option>카테고리검색</option>
						<option>프로그래밍</option>
						<option>데이터베이스</option>
						<option>웹 퍼블리셔</option>
						<option>홈페이지 제작</option>
						<option>서버</option>
					</select>
				<input id="text" class="mg-left-5" type="text"/>
				<button id="search-button" type="button" class="btn btn-primary">검색</button>
			</div>
		</div>

		<div class="table-top">
			<div>총 게시판수 : 24</div>
			<button id="total-edit-button" type="button">게시판편집</button>
		</div>

		<table class="table-main">
			<thead class="thead">
				<tr>
					<td class="w-60">
						<input id="total-check" type="checkbox"/>
					</td>
					<td class="w-100">번호</td>
					<td>그룹명</td>
					<td>게시판명</td>
					<td class="w-100">게시물수</td>
					<td class="w-100">기능</td>
				</tr>
			</thead>

			<tbody class="tbody">
				<tr>
					<td>
						<input type="checkbox"/>
					</td>
					<td>4</td>
					<td>IT개발</td>
					<td>웹 개발</td>
					<td>54</td>
					<td>
						<button type="button" class="btn btn-danger edit-button">수정</button>
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox"/>
					</td>
					<td>3</td>
					<td>IT개발</td>
					<td>프로그래밍 언어</td>
					<td>33</td>
					<td>
						<button type="button" class="btn btn-danger edit-button">수정</button>
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox"/>
					</td>
					<td>2</td>
					<td>IT개발</td>
					<td>데이터베이스</td>
					<td>22</td>
					<td>
						<button type="button" class="btn btn-danger edit-button">수정</button>
					</td>
				</tr>
			</tbody>
		</table>

		<div class="table-bottom">
			<button type="button">선택삭제</button>
		</div>

		<div class="paging">
			<div>
				<ul class="paging-number">
					<li><a href=""> << </a></li>
					<li><a href=""> < </a></li>
					<li><a href=""> 1 </a></li>
					<li><a href=""> 2 </a></li>
					<li><a href=""> 3 </a></li>
					<li><a href=""> > </a></li>
					<li><a href=""> >> </a></li>
				</ul>
			</div>
		</div>

	</section>
	
</main>