<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/board/category.css" />
<script src="/resources/js/admin/board/category.js"></script>

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

	<!--------modal-게시판편집----------------------------->

	<div id="modal">
		<div class="modal-content">

			<div class="cancel-box">
				<span id="modal-close-button" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
			</div>

			<h1>게시판편집</h1>

			<style>
				.category-list .ui-selecting { background: #FECA40; }
  				.category-list .ui-selected { background: #F39814; color: white; }
			</style>

			<div class="flex-box">
				<div class="category-edit">
					<ul class="list-box">
						<li class="group-box">
							<div class="group-name">
								<label>그룹명1
									<span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true" style="font-size:12px"></span>
								</label>
								<span class="glyphicon glyphicon-remove remove-button" aria-hidden="true"></span>
							</div>
							<ul class="category-list">
								<li class="category-name">
									<label>카테고리명1</label>
									<span class="glyphicon glyphicon-remove remove-button" aria-hidden="true"></span>
								</li>
								<li class="category-name">
									<label>카테고리명2</label>
									<span class="glyphicon glyphicon-remove remove-button" aria-hidden="true"></span>
								</li>
								<li class="category-name">
									<label>카테고리명3</label>
									<span class="glyphicon glyphicon-remove remove-button " aria-hidden="true"></span>
								</li>	
							</ul>
						</li>
									
						<li class="group-box">
							<div class="group-name">
								<label>그룹명2
									<span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true" style="font-size:12px"></span>
								</label>
								<span class="glyphicon glyphicon-remove remove-button" aria-hidden="true"></span>
							</div>
							<ul class="category-list">
								<li class="category-name">
									<label>카테고리명1</label>
									<span class="glyphicon glyphicon-remove remove-button" aria-hidden="true"></span>
								</li>
								<li class="category-name">
									<label>카테고리명2</label>
									<span class="glyphicon glyphicon-remove remove-button" aria-hidden="true"></span>
								</li>
								<li class="category-name">
									<label>카테고리명3</label>
									<span class="glyphicon glyphicon-remove remove-button " aria-hidden="true"></span>
								</li>	
							</ul>
						</li>
					</ul>

				</div>

				<div class="input-box-container">
					<div class="input-box">
						<fieldset>
							<legend>그룹</legend>
							<div class="flex">
								<label>그룹명</label>
								<input type="text" />
								<button type="button" class="btn btn-danger">추가</button>
							</div>

						</fieldset>
					</div>

					<div class="input-box mg-top-10">
						<fieldset>
							<legend>카테고리</legend>
							<div class="flex">
								<label>그룹명</label>
								<input id="groupName" type="text" readonly style="background-color:#eee"/>
							</div>
							<div class="flex mg-top-5">
								<label>카테고리명</label>
								<input type="text"/>
								<button type="button" class="btn btn-danger">추가</button>
							</div>
						</fieldset>
					</div>

					
				</div>
			</div>

			<div class="reg-box">
				<button id="modal-check" type="button" class="btn btn-success">확인</button>
			</div>
		</div>
	</div>

	<!--------------modal2-삭제확인------------------->
	<div id="modal2">
		<div class="modal2-content">
			<div class="cancel-box">
				<span id="modal2-close-button" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
			</div>
			<h1>정말 삭제하시겠습니까?</h1>
			<div class="modal2-checkbox">
				<button id="modal2-check" type="button">확인</button>
				<button id="modal2-cancel" type="button">취소</button>
			</div>
		</div>
	</div>

	<!-------------modal3-카테고리수정--------------->
	<div id="modal3">
		<div class="modal3-content">
			<div class="cancel-box">
				<span id="modal3-close-button" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
			</div>
			<h1>게시판수정</h1>

			<fieldset class="edit-before mg-top-10">
				<legend>현재</legend>
				<div class="flex">
					<label>그룹</label>
					<input type="text" readonly/>
				</div>
				<div class="flex mg-top-5">
					<label>카테고리명</label>
					<input type="text" readonly/>
				</div>
			</fieldset>	

			<fieldset class="edit-after mg-top-10">
				<legend>변경 후</legend>
				<div class="flex">
					<label>그룹</label>
					<select>
						<option>IT개발</option>
						<option>디자인</option>
						<option>번역</option>
						<option>애니</option>
					</select>
				</div>
				<div class="flex mg-top-5">
					<label>카테고리명</label>
					<input type="text"/>
				</div>
			</fieldset>	

			<div class="modal3-checkbox">
				<button id="modal3-check" type="button" class="btn btn-success">확인</button>
			</div>
		</div>
	</div>

</main>














