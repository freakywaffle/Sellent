<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/resources/css/member/join.css" rel="stylesheet"/>
<script src="/resources/js/member/join.js"></script>
<main id="main">
	<form id="wrap" action="join" method="post">
		<div class="basic">
			<div class="head-title">기본정보</div>
			<div class="profile">
				
				<div><img  id="blah"  alt="" src="/resources/images/profile.png"></div>
				<div class="plus">+</div>
				<input type='file' name='photo'  class="imgInp hidden" />
				 
			</div>
			<div class="twobind name">
				<div class="sub-title">닉네임</div>
				<input type="text" name="nickname"/>
			</div>
			
			<div class="threebind">
				<div class="sub-title">아이디</div>
				<div>
					<input type="text" name="id"/>
					<input type="button" value="중복확인" name="idchk"/>
				</div>
			</div>
			
			<div class="twobind">
				<div class="sub-title">비밀번호</div>
				<input type="text" name="password"/>
			</div>
			<div class="twobind pwch">
				<div class="sub-title">비밀번호 재확인</div>
				<input type="text" name="pwdchk"/>
				<span id="warning"></span>
			</div>
			
			<div class="threebind email">
				<div class="sub-title">이메일</div>
				<div>
					<input type="text" name="email"/>
					<input type="button" name="checkbtn" value="인증발송"/>
				</div>
			</div>
			<div class="threebind emailchk">
				<div class="sub-title">인증확인</div>
				<div>
					<input type="text"/>
					<input type="button" name="checkbtn" value="인증확인"/>
				</div>
			</div>
			
		</div>
		<div class="introduce">
			<div class="head-title">자기소개</div>
			<div class="twobind">
				<div class="sub-title">제목</div>
				<input type="text" name="simple_introduction"/>
			</div>
			
			<div class="ttwobind">
				<div class="sub-title">내용</div>
				<textarea name="detail_introduction"></textarea>
			</div>
			
				<div class="twobind tech">
				<div class="sub-title">보유기술</div>
				<input type="text" name="skill"/>
			</div>
		</div>
		<div id="join">
		<input type="submit" name="joinbtn" value="가입완료"/>
		</div>
	</form>
	
</main>