<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/member/point.css" />
<script src="/resources/js/admin/member/point.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="aside">
	<div class="aside-title">
		회원관리
	</div>
	<ul class="aside-category-list">
		<li><a href="/admin/member/member">회원목록</a></li>
		<li><a href="/admin/member/point">포인트</a></li>
	</ul>
</section>

<section class="content">
	<div class="top-content">
		<label>회원관리 > 포인트</label>
		<div class="top-right-content">
			
		</div>
	</div>
	
	<main id="main">
	
	    <section class="content-box">
		   
			<form action="">
				<div class="condition-form" style="border-top:none">
					<label class="condition-title">키워드검색</label>
			
					<div class="condition-content">
						<select name="condition">
							<option value="member_id">아이디</option>
						</select>
						<input name="text" class="mg-left-5" type="text">
					</div>
				</div>
		
				<div class="search-form">
					<button type="submit" class="btn btn-primary">검색하기</button>
				</div>
		
				<div class="table-top">
					<div>총 포인트지급수 : ${paging.totalCount}</div>
				</div>	
			</form>
	        <table class="table-main">
			<colgroup>
				<col width="100px">
			</colgroup>
			
	            <thead class="thead">
	                <tr>
	                    <td>번호</td>
						<td>아이디</td>
						<td>지급내용</td>
						<td>지급</td>
	                    <td>등록일</td>
	                    <td>기능</td>
	                </tr>
				</thead>
	            <tbody class="tbody">
		            <c:forEach items="${list }" var="point">
		                <tr class="point-obj tr-hover">
		                    <td>${point.no}</td>
		                    <td class="point-id">${point.member_id}</td>
		                    <td>${point.content}</td>
		                    <td>${point.point}</td>
		                    <td>
		                    	<fmt:formatDate value="${point.regdate}" pattern="yyyy-MM-dd"/>	
		                    </td>
		                    <td>
		                        <button type="button" class="btn btn-primary point-button">포인트
		                            <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>
		                        </button>
		                    </td>
		                </tr>
	                </c:forEach>
	            </tbody>
			</table>
		
	        <div class="paging">
                <div>
                    <ul class="paging-box">
                        <li class="paging-prev"><a href="${query}&page=${paging.prevPage}"> < </a></li>
                        
                        <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}" step="1">
                            
                            <c:set var="cls" value="${i==paging.page?'strong':''}" />
                            
                            <li class="paging-number">
                                <a class="${cls}" href="${query}&page=${i}">${i }</a>
                            </li>

                        </c:forEach>
                        <li class="paging-next"><a href="${query}&page=${paging.nextPage}"> > </a></li>
                    </ul>
                </div>
            </div>
	    </section>
	
	    <div id="modal">
	        <div class="modal-content">
	            <div class="cancel-box">
	                <span id="modal-close-button" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
	            </div>
	            <h1>포인트 지급</h1>
	            
	            <div class="input-box">
	                <label>지급사유</label>
	                <select id="modal-content" name="content">
	                    <c:forEach items="${pointList}" var="pointConf">
	                    	<c:if test="${pointConf.use eq 1}">
                    		<option value="${pointConf.content}">${pointConf.content}</option>
	                    	</c:if>
	                    </c:forEach>
	                </select>
	            </div>
	
	            <div class="input-box">
	                <label>포인트</label>
	                <select id="modal-point" name="point">
	                    <c:forEach items="${pointList }" var="pointConf">
                    		<c:if test="${pointConf.use eq 1}">
                    			<option value="${pointConf.point }">${pointConf.point }</option>
	                    	</c:if>
	                    </c:forEach>
	                </select>
	            </div>
	
	            <div class="input-box">
	                <label>기타</label>
	                <textarea></textarea>
	            </div>
	
				<div class="reg-box">
	                <button id="modal-check" type="button" class="btn btn-primary">확인</button>
				</div>
	        </div>
	    </div>
	</main>
</section>