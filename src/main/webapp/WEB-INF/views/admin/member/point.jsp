<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/member/point.css" />
<script src="/resources/js/admin/member/point.js"></script>

<main id="main">

	<section class="content-box">

		<div class="condition-form">
			<label class="condition-title">등록일</label>
		
			<div class="condition-content">
				<input type="date"/>
				<span style="margin-right: 5px" class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
				~
				<input class="mg-left-5" type="date"/>
				<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
			</div>
		</div>

		<div class="condition-form" style="border-top:none">
			<label class="condition-title">키워드검색</label>
	
			<div class="condition-content">
				<select>
					<option>아이디</option>
					<option>이름</option>
				</select>
				<input class="mg-left-5" type="text">
			</div>
		</div>

		<div class="search-form">
			<button type="button" class="btn btn-primary">검색하기</button>
		</div>


		<div class="table-top">
			<div>총 회원수 : 51</div>
		</div>

		<table class="table-main">
			<thead class="thead">
				<tr>
					<td>
						<input type="checkbox"/>
					</td>
					<td>번호</td>
					<td>이름</td>
					<td>아이디</td>
					<td>일시</td>
					<td>내용</td>
					<td>지급</td>
					<td>합계</td>
					<td>포인트</td>
				</tr>
			</thead>
			<tbody class="tbody">
				<tr>
					<td>
						<input type="checkbox"/>
					</td>
					<td>4</td>
					<td>뉴렉</td>
					<td>newlec</td>
					<td>2019.01.20 15:20:35</td>
					<td>첫로그인</td>
					<td>300</td>
					<td>800</td>
					<td>
						<button type="button" class="btn btn-primary point-button">포인트
							<span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>
						</button>
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox"/>
					</td>
					<td>2</td>
					<td>김두식</td>
					<td>kingdusik</td>
					<td>2019.01.17 19:33:40</td>
					<td>후기</td>
					<td>200</td>
					<td>500</td>
					<td>
						<button type="button" class="btn btn-primary point-button">포인트
							<span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>
						</button>
					</td>
				</tr>
			</tbody>
		</table>

		<div class="table-bottom">
			<button type="button">선택삭제</button>
			<button type="button">선택지급</button>
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

	<div id="modal">
		<div class="modal-content">

			<div class="cancel-box">
				<span class="glyphicon glyphicon-remove cancel-button" aria-hidden="true"></span>
			</div>

			<h1>포인트 지급</h1>

			<div class="input-box">
				<div>
					<label>포인트</label>
				</div>
				<div>
					<select>
						<option>100</option>
						<option>200</option>
						<option>300</option>
						<option>400</option>
						<option>500</option>
					</select>
				</div>
			</div>

			<div class="input-box">
				<div>
					<label>내용</label>
				</div>
				<div>
					<select>
						<option>첫로그인</option>
						<option>게시물작성</option>
						<option>리뷰작성</option>
						<option>평가작성</option>
						<option>기타</option>
					</select>
				</div>
			</div>

			<div class="input-box">
				<div>	
					<label>기타사유</label>
				</div>
				<div>
					<textarea placeholder="내용을 입력하세요.."></textarea>
				</div>
			</div>

			<div class="reg-box">
				<button type="button" class="btn btn-primary">수정하기</button>
			</div>
		</div>

	</div>
</main>