<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spr" uri="http://www.springframework.org/tags" %>     
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   <link href="/resources/css/profile/editinfo.css" rel="stylesheet" />
   <script src="/resources/js/member/editInfo.js"></script>
   <script src="/resources/js/member/inc/aside.js"></script>
   
<section class="content">
<form id="wrap" action="editInfo" method="post">
	<div class="menu-button mobile-block">
		<input type="button" value=">" />
	</div>
	<div class="profile-box">
		<img  id="blah" src='<spr:url value="/sellent/profile/"/>${member.id}/${member.photo}'
		 onerror="this.src='/resources/images/profile.png'">
		<div class=profilebtn>
			<input type="button" id="blah" class="profileBtn" name='picedit' value="수정" />
			<input type="button" class="profileBtn" name='picdel' value="삭제" />
		</div> 
		<div class=profilebtn2>
			<input type="file" class="profileBtn2" name='photo' value="수정" />
		</div> 
	</div>
	<div class="edit-info">
		<div class="nickname">
			<div class="title" dir="rtl">닉네임</div>
			<div><input type="text" name="nickname" class="Input" placeholder="${member.nickname }"/></div>
		</div>
		<div class="new-pwd">
			<div class="title" dir="rtl">새 비밀번호</div>
			<div><input type="text" name="password" class="Input" placeholder=""/></div>
		</div>
		<div class="new-pwdchk">
			<div class="title" dir="rtl">새 비밀번호 확인</div>
			<div><input type="text" name="pwdDoubleInput" class="Input" placeholder=""/></div>
		</div>
		<span id="warning"></span>
		<div class="email">
			<div class="title" dir="rtl">이메일</div>	
			<div>		
			<input type="text" name="email" class="Input" placeholder="${member.email}"/>
			<input type="button" name="emailBtn" value="인증"/>
			</div>
			
		</div>
		<div class="emailchk hidden">
			<div class="title" dir="rtl">인증확인</div>
			<div>
				<input type="text"/>
				<input type="button" name="checkbtn" value="인증확인"/>
			</div>
		</div>
		
	</div>
	<div class="complete">
		<div><input type="submit" name="editBtn" value="수정하기"/></div>
	</div>
	</form>
</section>