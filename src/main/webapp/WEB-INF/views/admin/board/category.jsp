<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/board/category.css" />
<script src="/resources/js/admin/board/category.js"></script>
<main id="main">

	<section class="category-list bd-2 bd-color-gray  border-box">
		
		<div class="category-search-form bd-1 bd-color-gray ">
			
			<label class="search-name lb-gray">게시판 검색</label>
			
			<div class="search-content">
				<select>
					<option>그룹검색</option>
					<option>IT개발</option>
					<option>디자인</option>
					<option>번역</option>
					<option>음악/더빙</option>
				</select>
				<input  type="text"/>
				<input class="color-blue" type="button" value="검색"/>
			</div>
		</div>

		<div class="category-sub">
			<div>총 게시판수 : 24</div>
			<input class="edit-btn" type="button" value="게시판편집"/>
		</div>

		<table class="category-list-table">
			<thead class="thead">
				<tr>
					<td>번호</td>
					<td>그룹명</td>
					<td>게시판명</td>
					<td>게시물수</td>
					<td class="td-last">기능</td>
				</tr>
			</thead>
			<tbody class="tbody">
				<tr>
					<td>4</td>
					<td>IT개발</td>
					<td>웹 개발</td>
					<td>54</td>
					<td>
						<input class="edit-button" type="button" value="수정"/>
						<input class="delete-button" type="button" value="삭제"/>
					</td>
				</tr>
				<tr>
					<td>3</td>
					<td>IT개발</td>
					<td>프로그래밍 언어</td>
					<td>33</td>
					<td>
						<input class="edit-button" type="button" value="수정"/>
						<input class="delete-button" type="button" value="삭제"/>
					</td>
				</tr>
				<tr>
					<td>2</td>
					<td>IT개발</td>
					<td>데이터베이스</td>
					<td>22</td>
					<td>
						<input class="edit-button" type="button" value="수정"/>
						<input class="delete-button" type="button" value="삭제"/>
					</td>
				</tr>
			</tbody>
		</table>

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

	<!--------category-edit----------------------------->

	<div id="modal">
		<section class="category-box">
		
			<span class="close cancel-button">X</span>

			<div class="family-box">
			
				<section class="parent-box">
					<label>그룹명</label>
		
					<div class="parent-content">
						<div class="parent-category">
							<ul>
								<li>IT개발<img src=""></li>
								<li>디자인</li>
								<li>번역</li>
							</ul>
						</div>
		
						<div class="parent-direction">
							<input class="sm-button" type="button" value="up" /> <input
								class="sm-button mt" type="button" value="down" />
						</div>
					</div>
		
					<div class="parent-check">
						<input class="sm-button add-button" type="button" value="추가" /> <input
							class="sm-button ml delete-button" type="button" value="삭제" />
					</div>
		
				</section>

				<section class="child-box">
					<label>게시판명</label>
		
					<div class="child-content">
						<div class="child-category">
							<ul>
								<li>프로그래밍</li>
								<li>웹 개발</li>
								<li>어플리케이션</li>
							</ul>
						</div>
		
						<div class="child-direction">
							<input class="sm-button" type="button" value="up" /> <input
								class="sm-button mt" type="button" value="down" />
						</div>
					</div>
		
					<div class="child-check">
						<input class="sm-button add-button" type="button" value="추가" /> <input
							class="sm-button ml delete-button" type="button" value="삭제" />
					</div>
					
				</section>
			</div>
			
			<!-- 확인/삭제 버튼 -->
			<div class="box-check">
				<input class="md-button check-button" type="button" value="확인" /> <input
					class="md-button ml cancel-button" type="button" value="취소" />
			</div>
				
		</section>
	</div>
		






<!--------category-add----------------------------->

	<div id="modal2">
		<section class="parent-category-add">
			<div class="input-group">
				<span class="input-group-addon" id="basic-addon1">그룹명</span>
				<input type="text" class="form-control" placeholder="GroupName" aria-describedby="basic-addon1">
				</div>
			<div class="text-align mg-top-10 ">
				<input class="sm-button check-button" type="button" value="확인" /> <input
					class="sm-button cancel-button" type="button" value="취소" />
			</div>
		</section>
	</div>

	<div id="modal3">
		<section class="child-category-add">
	
			<div class="input-group">
				<span style="width:100px" class="input-group-addon" id="basic-addon1">그룹명</span>
				<select class="form-control">
					<option>IT개발</option>
					<option>디자인</option>
					<option>번역</option>
				</select>
				
			</div>	

			<div class="input-group" style="margin-top:5px">
				<span style="width:100px"class="input-group-addon" id="basic-addon1">카테고리명</span>
				<input type="text" class="form-control" placeholder="GategoryName" aria-describedby="basic-addon1">
			</div>


			<div class="text-align mg-top-10">
				<input class="sm-button check-button" type="button" value="확인" /> <input
					class="sm-button cancel-button" type="button" value="취소" />
			</div>
		</section>
	</div>


	<div id="modal4">
		<div class="delete-check">
			<p>삭제하시겠습니까?</p>

			<div class="text-align">
				<button class="yes-button" type="button">Yes</button>
				<button class="no-button" type="button">No</button>
			</div>
		</div>
	</div>



</main>














