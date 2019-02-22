<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/config/admin.css" />
<script src="/resources/js/admin/config/admin.js"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="aside">
	<div class="aside-title">
		환경설정
	</div>
	<ul class="aside-category-list">
		<li><a href="/admin/config/banner">배너관리</a></li>
		<li><a href="/admin/config/point">포인트설정</a></li>
		<li><a href="/admin/config/admin">관리자설정</a></li>
	</ul>
</section>

<section class="content">
	<div class="top-content">
		<label>환경설정 > 관리자설정</label>
		<div class="top-right-content">
			
		</div>
	</div>
	
	<main id="main">
	
	    <section class="content-box">
	        <form action="">
		        <div class="condition-form">
		
		            <label class="condition-title">회원등급</label>
		            
		            <div class="condition-content">
		                <select name="role">
		                    <option value="">전체</option>
		                    <option value="ROLE_ADMIN">관리자</option>
		                    <option value="ROLE_MEMBER">일반회원</option>
		                </select>
		            </div>
		        </div>
		
		        <div class="condition-form" style="border-top:none">
		            <label class="condition-title">가입일</label>
		        
		            <div class="condition-content">
		                <input name="startDate" id="datepicker"type="text"/>
		                <span class="mg-left-5">~</span>
		                <input name="endDate" id="datepicker2" class="mg-left-5" type="text"/>
		            </div>
		        </div>
		
		        <div class="condition-form" style="border-top:none">
		            <label class="condition-title">키워드검색</label>
		    
		            <div class="condition-content">
		                <select name="condition">
		                    <option value="id">아이디</option>
		                    <option value="nickname">닉네임</option>
		                </select>
		                <input name="text" class="mg-left-5" type="text">
		            </div>
		        </div>
		
		        <div class="search-form">
					<button type="submint" class="btn btn-primary">검색하기</button>
		        </div>
			</form>
			<div class="explan">
				<p>1: 관리자</p>
				<p>0: 일반회원</p>
			</div>
	
	        <div class="table-top">
	            <div>총 회원 수 : ${paging.totalCount }</div>
	        </div>
	
	        <table class="table-main">
			<colgroup>
				<col width="100px">
			</colgroup>
	            <thead class="thead">
	                <tr>
	                    <td>번호</td>
						<td>아이디</td>
						<td>닉네임</td>
						<td>등급</td>
						<td>가입일</td>
						<td>등급변경</td>
	                </tr>
				</thead>
				
	            <tbody class="tbody">
	            <c:forEach items="${list }" var="adminConf">
	                <tr class="adminConf-obj">
	                    <td class="adminConf-no">${adminConf.no }</td>
						<td class="adminConf-id">${adminConf.id }</td>
						<td>${adminConf.nickname }</td>
						<c:choose>
							<c:when test="${adminConf.role eq 'ROLE_ADMIN'}">
								<td class="adminConf-role">관리자</td>
							</c:when>
								
							<c:when test="${adminConf.role eq 'ROLE_MEMBER'}">
								<td class="adminConf-role">일반회원</td>
							</c:when>
						</c:choose>
						<td>
							<fmt:formatDate value="${adminConf.regdate}" pattern="yyyy-MM-dd"/>
						</td>
						<td>
						<c:choose>
							<c:when test="${adminConf.role eq 'ROLE_ADMIN'}">
								<input class="spinner role-change" name="value" value="1">
								<button type="button" class="btn btn-danger role-button">확인</button>
							</c:when>
							
							<c:when test="${adminConf.role eq 'ROLE_MEMBER'}">
								<input class="spinner role-change" name="value" value="0">
								<button type="button" class="btn btn-danger role-button">확인</button>
							</c:when>
						</c:choose>
						</td>
	                </tr>
                </c:forEach>
	            </tbody>
			</table>
			
			<div class="table-bottom">
					<button id="save-button" type="button" class="btn btn-warning">저장</button>
			</div>
			
			<div class="paging">
				<div>
					<ul class="paging-box">
						<li class="paging-prev"><a href="?parent=${parent }&sub=${sub }&page=${paging.prevPage}"> < </a></li>
						
						<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}" step="1">
							
							<c:set var="cls" value="${i==paging.page?'strong':''}" />
							
							<li class="paging-number">
								<a class="${cls}" href="?parent=${parent }&sub=${sub }&page=${i}">${i }</a>
							</li>
	
						</c:forEach>
						
						<li class="paging-next"><a href="?parent=${parent }&sub=${sub }&page=${paging.nextPage}"> > </a></li>
					</ul>
				</div>
			</div>
	
	    </section>
	
	    <!--삭제확인-->
		<div id="modal2">
			<div class="modal2-content">
				<div class="cancel-box">
					<span id="modal2-close-button" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
				</div>
				
				<h1>정말 삭제하시겠습니까?</h1>
	
				<div class="modal2-checkbox">
					<button id="modal2-check" type="button">확인</button>
					<button id="modal2-cancel" type="button">취소</button>
				</div>
			</div>
		</div>
	</main>
</section>