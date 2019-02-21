<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/resources/css/member/findInfo.css" rel="stylesheet"/>
<link href="/resources/css/common.css" rel="stylesheet"/>
<script src="/resources/js/member/findInfo.js"></script>
 <main id="main">
     <div class="findId">
         <div><a>아이디 찾기</a></div>
         <div><input type="text" name="nickname" placeholder="닉네임"/></div>
         <div><input type="text" name="email" placeholder="E-mail"/></div>
     </div>
     <div id="idFind">
        <input type="button" name="idBtn" value="찾기"/>
    </div>

    <div class="findPwd">
         <div><a>비밀번호 찾기</a></div>
         <div><input type="text" name="id" placeholder="ID"/></div>
         
         <div><input type="text" name="email" placeholder="E-mail"/></div>
     </div>
     <div id="pwdFind">
        <input type="button" name="pwdBtn" value="찾기"/>
    </div>
    <div class="modalFind">
       <div class="modal-content">
        <span class="close-button">&times;</span>
        <div class="pwdInput">
        <input type="text" placeholder="비밀번호" name="newPwd" class="newPwd"/>
        	<div class="pwdDoubleChk">
        		<input type="text" placeholder="비밀번호 재확인" name="newpwdChk" class="newpwdChk"/>
        	</div>
        	<div><span class="warning"></span></div>
        	<div><input type="button" value="비밀번호 변경" name="changeBtn" class="changeBtn"/></div>
        	<div class="notID">존재하지 않는 아이디 입니다</div>
        </div>     
       </div>
    </div>
   </main>