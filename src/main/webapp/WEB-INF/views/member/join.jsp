<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/resources/css/member/join.css" rel="stylesheet"/>

<main id="main">
	<div id="content-wrap">
		<div class="first-content">
			<div class="content-title">기본정보</div>
			<div class="detail-content">
				<div>
					<div class="detail-title">이름</div>
					<div class="detail-text"><input type="text"/></div>
				</div>
				<div>
					<div class="detail-title">아이디</div>
					<div class="detail-text"><input type="text"/></div>
					<div class="checkbtn"><input type="text" value="중복확인"/></div>
				</div>
				<div>
					<div class="detail-title">비밀번호</div>
					<div class="detail-text2"><input type="text"/></div>
				</div>
				<div>
					<div class="detail-title">비밀번호 재확인</div>
					<div class="detail-text2"><input type="text"/></div>
				</div>
				<div>
					<div class="detail-title">이메일</div>
					<div class="detail-text"><input type="text"/></div>
					<div class="checkbtn"><input type="text" value="중복확인"/></div>
				</div>
			</div>
		</div>
		
		
		<div class="second-content">
			<div class="content-title">자기소개</div>
			<div class="detail-content">
				<div>
					<div class="detail-ctitle">제목</div>
					<div class="detail-ctext"><input type="text"/></div>
				</div>
				
				<div>
					<div class="detail-ctitle">내용</div>
					<div class="detail-ctext"><textarea></textarea></div>
				</div>
				
				<div class="tech">
					<div class="detail-ctitle">보유기술</div>
					<div class="detail-ctext"><input type="text"/></div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="joinbtn"><input type="button" value="가입하기"/></div>
</main>