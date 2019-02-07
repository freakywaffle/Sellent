<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <link href="/resources/css/profile/editinfo.css" rel="stylesheet" />
<section class="content">
	<div class="profile">
		<img alt="프로필" src="/resources/images/person.jpg">
		<div class=profilebtn>
			<input type="button" value="수정" />
			<input type="button" value="삭제" />
		</div> 
	</div>
	<div class="edit-info">
		<div class="nickname">
			<div class="title" dir="rtl">닉네임</div>
			<div><input type="text" placeholder=""/></div>
		</div>
		<div class="new-pwd">
			<div class="title" dir="rtl">새 비밀번호</div>
			<div><input type="text" placeholder=""/></div>
		</div>
		<div class="new-pwdchk">
			<div class="title" dir="rtl">새 비밀번호 확인</div>
			<div><input type="text" placeholder=""/></div>
		</div>
		<div class="email">
			<div class="title" dir="rtl">이메일</div>	
			<div>		
			<input type="text" placeholder=""/>
			<input type="submit" value="인증"/>
			</div>
			
		</div>
		
	</div>
	<div class="complete">
		<div><input type="submit" value="수정하기"/></div>
	</div>
</section>