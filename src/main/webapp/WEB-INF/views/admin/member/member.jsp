<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/member/member.css" />
<script src="/resources/js/admin/member/member.js"></script>

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
			<button type="button" class="btn btn-success reg-button">회원등록</button>
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
					<td>이메일</td>
					<td>회원등급(수정)</td>
					<td>가입일</td>
					<td>정보보기</td>
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
					<td>asldasdl@naver.com</td>
					<td>일반회원</td>
					<td>2018.10.09</td>
					<td>
						<button type="button" class="btn btn-danger">정보
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						</button>
						
						<button type="button" class="btn btn-info mail-button">메일
							<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
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
					<td>asdasd@daum.net</td>
					<td>일반회원</td>
					<td>2019.01.19</td>
					<td>
						<button type="button" class="btn btn-danger">정보
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						</button>
						<button type="button" class="btn btn-info mail-button">메일
							<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
						</button>
					</td>
				</tr>
			</tbody>
		</table>

		<div class="table-bottom">
			<button type="button">회원삭제</button>
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
			<form action="action_page.php">
				<div style="width:100%; text-align:end">
					<span class="glyphicon glyphicon-remove cancel-button" aria-hidden="true"></span>
				</div>

				<h1>기본정보</h1>

				<div>
					<div class="col-25">
						<label for="fname">이름</label>
					</div>
					<div>
						<input class="height-30" type="text" id="fname" name="firstname" placeholder="이름 입력">
					</div>
				</div>
				<div>
					<div class="col-25">
						<label for="lname">아이디</label>
					</div>
					<div>
						<input class="height-30" type="text" id="lname" name="lastname" placeholder="아이디 입력">
					</div>
				</div>
				<div>
					<div class="col-25">
						<label for="country">비밀번호</label>
					</div>
					<div>
						<input class="height-30" type="text" id="lname" name="lastname" placeholder="비밀번호를 입력">
					</div>
				</div>
				<div>
					<div class="col-25">
						<label for="country">비밀번호 재확인</label>
					</div>
					<div>
						<input class="height-30" type="text" id="lname" name="lastname" placeholder="비밀번호 확인">
					</div>
				</div>
				<div>
					<div class="col-25">	
						<label for="country">이메일</label>
					</div>
					<div>
						<input class="height-30" type="text" id="lname" name="lastname" placeholder="이메일 입력">
					</div>
				</div>

				<h1 style="margin-top:30px">자기소개</h1>
				<div>
					<div class="col-25">	
						<label for="country">제목</label>
					</div>
					<div>
						<input class="height-30" type="text" id="lname" name="lastname" placeholder="제목 입력">
					</div>
				</div>
				<div>
					<div class="col-25">
						<label for="subject">내용</label>
					</div>
					<div>
						<textarea id="subject" name="subject" placeholder="내용을 입력하세요.."></textarea>
					</div>
				</div>
				<div>
					<div class="col-25">	
						<label for="country">보유기술</label>
					</div>
					<div>
						<input class="height-30" type="text" id="lname" name="lastname" placeholder="보유기술 입력">
					</div>
				</div>
				<div class="reg-box height-30">
					<input class="reg-button" type="button" value="등록">
				</div>
			</form>
		</div>
	</div>

	<div id="modal2">
		<div class="mail">
			<form action="action_page.php">
				<div style="width:100%; text-align:end">
					<span class="glyphicon glyphicon-remove cancel-button" aria-hidden="true"></span>
				</div>

				<h1>메일보내기</h1>

				<div>
					<div class="col-25">
						<label for="fname">이름</label>
					</div>
					<div>
						<input class="height-30" type="text" id="fname" name="firstname" placeholder="이름 입력">
					</div>
				</div>
				<div>
					<div class="col-25">
						<label for="lname">아이디</label>
					</div>
					<div>
						<input class="height-30" type="text" id="lname" name="lastname" placeholder="아이디 입력">
					</div>
				</div>
				<div>
					<div class="col-25">
						<label for="lname">이메일</label>
					</div>
					<div>
						<input class="height-30" type="text" id="lname" name="lastname" placeholder="이메일 입력">
					</div>
				</div>
				<div>
					<div class="col-25">
						<label for="subject">내용</label>
					</div>
					<div>
						<textarea id="subject" name="subject" placeholder="내용을 입력하세요.."></textarea>
					</div>
				</div>
				<div class="reg-box height-30">
					<input class="reg-button" type="button" value="보내기">
				</div>
			</form>
		</div>
	</div>



</main>