<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/trade/total.css" />
<script src="/resources/js/admin/trade/total.js"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="aside">
	<div class="aside-title">
		거래관리
	</div>
	<ul class="aside-category-list">
		<li><a href="/admin/trade/total">전체거래</a></li>
		<li><a href="/admin/trade/person">개인거래</a></li>
	</ul>
</section>

<section class="content">
	<div class="top-content">
		<label>거래관리 > 개인거래</label>
		<div class="top-right-content">
			
		</div>
	</div>
	<main id="main">
	
	    <section class="content-box">
	
			<form action="">
		        <div class="condition-form">
		        
		            <label class="condition-title">거래상태</label>
		            
		            <div class="condition-content">
		                <select name="state">
		                    <option value="">전체</option>
		                    <option value="미확인">미확인</option>
		                    <option value="거절됨">거절됨</option>
		                    <option value="작업중">작업중</option>
		                    <option value="작업완료">작업완료</option>
		                </select>
		            </div>
		        </div>
		
		        <div class="condition-form" style="border-top:none">
		            <label class="condition-title">거래일자</label>
		            
		            <div class="condition-content">
		                <input name="startDate" id="datepicker"type="text"/>
		                <span class="mg-left-5">~</span>
		                <input name="endDate" id="datepicker2" class="mg-left-5" type="text"/>
		            </div>
		        </div>
		
		        <div class="condition-form" style="border-top:none">
		            <label class="condition-title">키워드검색</label>
		    
		            <div class="condition-content">
		                <label>구매자</label>
		                <input name="buyer" class="mg-left-5" type="text"> 
		                <label class="mg-left-5">판매자</label>
		                <input name="seller" class="mg-left-5" type="text">
		            </div>
		        </div>
		
		        <div class="search-form">
		            <button type="submit" class="btn btn-primary">검색하기</button>
		        </div>
	        </form>
	
	        <div class="table-top">
	            <div>총 거래수 : ${paging.totalCount }</div>
	        </div>
	
	        <table class="table-main">
      		<colgroup>
      			<col width="60px">
				<col width="100px">
			</colgroup>
	            <thead class="thead">
	                <tr>
	                    <td>
	                        <input id="total-check" type="checkbox"/>
	                    </td>
	                    <td>번호</td>
	                    <td>구매자</td>
	                    <td>판매자</td>
	                    <td>상품가격</td>
	                    <td>거래일자</td>
	                    <td>거래상태</td>
	                </tr>
	            </thead>
	            <tbody class="tbody">
	            <c:forEach items="${list }" var="total"> 
	                <tr class="total-obj">
	                    <td>
	                        <input class="check-box" type="checkbox"/>
	                    </td>
	                    <td class="total-no">${total.no }</td>
	                    <td>${total.buyer_id }</td>
	                    <td>${total.seller_id }</td>
	                    <td>
	                    	<fmt:formatNumber value="${total.price}" pattern="#,###원"/>
	                    </td>
	                    <td>
	                    	<fmt:formatDate value="${total.regdate}" pattern="yyyy-MM-dd"/>	
	                    </td>
	                    
	                    <c:choose>
                 	        <c:when test="${total.state == '거절됨'}">
	                    		<td style="font-weight: bold;">${total.state }</td>
	                    	</c:when>
	                    	<c:when test="${total.state == '작업중'}">
	                    		<td style="font-weight: bold; color:coral">${total.state }</td>
	                    	</c:when>
	                    
	                    	<c:when test="${total.state == '미확인'}">
	                    		<td style="font-weight: bold; color:blue">${total.state }</td>
	                    	</c:when>
	                    
	                    	<c:when test="${total.state == '작업완료'}">
	                    		<td style="font-weight: bold; color:red">${total.state }</td>
	                    	</c:when>
	                    </c:choose>
	                </tr>
				</c:forEach>
	            </tbody>
	        </table>
	
			<div class="table-bottom">
	            <button id="select-remove" type="button">선택삭제</button>
	        </div>
	
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
	
	
	
	
	
	
	
	
