<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/resources/css/member/login.css" rel="stylesheet"/>

   <main id="main">
   <form id="wrap" method="post">
     <div class="idPw">
         <div><input type="text" placeholder="ID" name="username"/></div>
         <div><input type="password" placeholder="PASSWORD" name="password"/></div>
     </div>
     <div id="login">
        <input type="submit" value="로그인"/>
    </div>
    <div class="radioButton">
        <input type="radio"/>
        <a>로그인 상태 유지</a>
    </div>
    <div class="buttones">
        <div>
            <input type="button" value="ID/PW찾기" />
            <input type="button" value="회원가입" />
        </div>
    </div>
    </form>
   </main>
