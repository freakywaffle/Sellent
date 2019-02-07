<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/resources/css/member/join.css" rel="stylesheet"/>

<main id="main">
	<div id="wrap">
		<div class="basic">
			<div class="head-title">기본정보</div>
			<div class="profile">
				<div><img alt="" src="/resources/images/profile.png"></div>
				<div class="plus">+</div>
			</div>
			<div class="twobind name">
				<div class="sub-title">이름</div>
				<input type="text"/>
			</div>
			
			<div class="threebind">
				<div class="sub-title">아이디</div>
				<div>
					<input type="text"/>
					<input type="button" value="중복확인"/>
				</div>
			</div>
			
			<div class="twobind">
				<div class="sub-title">비밀번호</div>
				<input type="text"/>
			</div>
			<div class="twobind">
				<div class="sub-title">비밀번호 재확인</div>
				<input type="text"/>
			</div>
			
			<div class="threebind email">
				<div class="sub-title">이메일</div>
				<div>
					<input type="text"/>
					<input type="button" value="인증확인"/>
				</div>
			</div>
			
		</div>
		<div class="introduce">
			<div class="head-title">자기소개</div>
			<div class="twobind">
				<div class="sub-title">제목</div>
				<input type="text"/>
			</div>
			
			<div class="ttwobind">
				<div class="sub-title">내용</div>
				<textarea></textarea>
			</div>
			
				<div class="twobind tech">
				<div class="sub-title">보유기술</div>
				<input type="text"/>
			</div>
		</div>
	</div>
	<div id="joinbtn">
		<input type="submit" value="가입완료"/>
	</div>
</main>