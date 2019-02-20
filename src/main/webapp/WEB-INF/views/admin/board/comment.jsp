<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/board/comment.css" />
<script src="/resources/js/admin/board/comment.js"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="aside">
	<div class="aside-title">
		게시판관리
	</div>
	<ul class="aside-category-list">
		<li><a href="/admin/board/category">카테고리</a></li>
		<li><a href="/admin/board/board">게시물</a></li>
		<li><a href="/admin/board/sale">판매요청</a></li>
		<li><a href="/admin/board/comment">후기</a></li>
		<li><a href="/admin/board/consult">1:1상담</a></li>
	</ul>
</section>

<section class="content">

	<div class="top-content">
		<label>게시판관리 > 후기</label>
		<div class="top-right-content">
			
		</div>
	</div>
	
	<main id="main">
	
        <section class="content-box">
            
            <form action="comment">
        
                <div class="condition-form" style="border-top:none">
                    <label class="condition-title">등록일</label>
                
                    <div class="condition-content">
                        <input name="startDate" id="datepicker"type="text" readonly/>
                        <span class="mg-left-5">~</span>
                        <input name="endDate" id="datepicker2" class="mg-left-5" type="text" readonly/>
                    </div>
                </div>
        
                <div class="condition-form" style="border-top:none">
                    <label class="condition-title">키워드검색</label>
            
                    <div class="condition-content">
                        <select name="condition">
                            <option value="content">후기내용</option>
                            <option value="writer_id">작성자</option>
                        </select>
                        <input name="text" class="mg-left-5" type="text">
                    </div>
                </div>
        
                <div class="search-form">
                    <button id="search-button" type="submit" class="btn btn-primary">검색하기</button>
                </div>
            </form>
    
            <div class="table-top">
                <div>총 게시물수 : ${paging.totalCount }</div>
            </div>
    
            <table class="table-main">
                <colgroup>
                    <col width="60px">
                    <col width="100px">
                    <col width="100px">
                    <col width="300px">
                    <col width="150px">
                    <col width="150px">
                    <col width="140px">
                </colgroup>

                <thead class="thead">
                    <tr>
                        <td>
                            <input id="total-check" type="checkbox"/>
                        </td>
                        <td>리뷰번호</td>
                        <td>상품번호</td>
                        <td>후기내용</td>
                        <td>평점</td>
                        <td>작성자</td>
                        <td>등록일자</td>
                    </tr>
                </thead>
                
                <tbody class="tbody">
                    <c:forEach items="${list }" var="comment">
	                    <tr class="comment-obj">
	                        <td>
	                            <input class="check-box" type="checkbox"/>
	                        </td>
	                        <td class="comment-no">${comment.no }</td>
	                        <td>${comment.product_no }</td>
	                        <td>${comment.content}</td>
	                        <td>
             	                <div class="star-ratings-css">
								  <div class="star-ratings-css-top" style="width: ${comment.starpoint * 16}%"><span><i class='fa fa-star fa-fw'></i></span><span><i class='fa fa-star fa-fw'></i></span><span><i class='fa fa-star fa-fw'></i></span><span><i class='fa fa-star fa-fw'></i></span><span><i class='fa fa-star fa-fw'></i></span></div>
								  <div class="star-ratings-css-bottom"><span><i class='fa fa-star fa-fw'></i></span><span><i class='fa fa-star fa-fw'></i></span><span><i class='fa fa-star fa-fw'></i></span><span><i class='fa fa-star fa-fw'></i></span><span><i class='fa fa-star fa-fw'></i></span></div>
								</div>
	                        </td>
	                        <td>${comment.writer_id }</td>
	                        <td>
	                       		<fmt:formatDate value="${comment.regdate}" pattern="yyyy-MM-dd"/>
                            </td>
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