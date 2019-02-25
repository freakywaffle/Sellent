<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/config/banner.css" />
<script src="/resources/js/admin/config/banner.js"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib prefix="spr" uri="http://www.springframework.org/tags" %>

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
		<label>환경설정 > 배너관리</label>
		<div class="top-right-content">
			
		</div>
	</div>
	
	<main id="main">
	    <section class="content-box">
	        <div class="table-top">
	            <div>총 배너수 : ${paging.totalCount }</div>
	            <button id="reg-button" type="button" class="btn btn-success">배너등록</button>
	        </div>
	
	        <table class="table-main">
	            <thead class="thead">
	                <tr>
	                    <td>
	                        <input id="total-check" type="checkbox"/>
	                    </td>
	                    <td>번호</td>
	                    <td>순서</td>
	                    <td>이미지</td>
	                    <td>제목</td>
	                    <td>사용여부</td>
	                    <td>종료일</td>
	                    <td>관리</td>
	                </tr>
	            </thead>
	            <tbody class="tbody">
	            <c:forEach items="${list }" var="banner">
	                <tr class="banner-obj">
	                    <td>
	                        <input class="check-box" type="checkbox"/>
	                    </td>
	                    <td class="banner-id">${banner.id }</td>
	                    <td class="banner-order">${banner.order}</td>
	                    <td class="text-align">
	                        <div class="img-box">
								<img style="width:100%;height:100%" src="<spr:url value="/sellent/admin"/>/${banner.image}" />
	                        </div>
	                    </td>
	                    <td>${banner.title }</td>
	                    <td>
	                        <label class="switch">
	                            <input class="banner-toggle banner-use" type="checkbox">
	                            <span class="slider round"></span>
	                        </label>
	                        <p>ON</p><p style="display:none;">OFF</p>
	                    </td>
	                    <td>
	                    	<%-- <fmt:formatDate value="${banner.end_date}" pattern="yyyy-MM-dd"/> --%>
	                    	${fn:substring(banner.end_date,0,10)}
	                    </td>
	                    <td>
	                        <button type="button" class="btn btn-danger edit-button">수정
	                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
	                        </button>
	                    </td>
	                </tr>
				</c:forEach>
	            </tbody>
	        </table>
	    </section>
			<div class="table-bottom">
	            <button id="select-remove" type="button">선택삭제</button>
	            <button id="save-button" type="button" class="btn btn-warning">저장</button>
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
	
		<div id="modal">
			<div class="modal-content">
	            <div class="cancel-box">
	                <span id="modal-close-button" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
	            </div>
	
	            <h1>배너등록하기</h1>
	
				<form action="bannerInsert" method="POST" enctype="multipart/form-data">
					<div>
						<div class="col-25">
							<label>제목</label>
						</div>
						<div>
							<input name="title" id="modal-title" class="height-30" type="text">
						</div>
					</div>
					<div>
						<div class="col-25">
							<label>기간</label>
						</div>
						<div class="end-date">
							<span class="mg-left-5">종료일 : </span>
							<input name="endDate" id="datepicker2" class="mg-left-5" type="text" style="width:150px"/>
						</div>
					</div>
					<div>
						<div class="col-25">
							<label>이미지</label>
						</div>
		
						<div class="modal-img-box">
							<img id="modal-img"/>
						</div>
		
						<div>
							<!-- <input id="modal-file" class="form-control" type="file" name="files" multiple> -->
							<input name="image" id="modal-file" type="file" multiple value="이미지첨부"/>
							<button id="modal-img-button" class="img-upload" type="button">이미지첨부</button>
						</div>
					</div>
					<div>
						<div class="col-25">
							<label>내용</label>
						</div>
						<div>
							<textarea name="content" id="modal-content" placeholder="내용을 입력하세요."></textarea>
						</div>
					</div>
		
					<div class="reg-box">
						<button id="modal-check" type="submit" class="btn btn-success">확인</button>
					</div>
				</form>
			</div>
		</div>
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
	    <div id="modal3">
	        <div class="modal3-content">
	            <div class="cancel-box">
	                <span id="modal3-close-button" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
	            </div>
	
	            <h1>배너수정</h1>
	
	            <div>
	                <div class="col-25">
	                    <label>제목</label>
	                </div>
	                <div>
	                    <input class="height-30" type="text">
	                </div>
	            </div>
	            <div>
	                <div class="col-25">
	                    <label>기간</label>
	                </div>
	                <div class="end-date">
	                    <span class="mg-left-5">종료일 : </span>
	                    <input id="datepicker3" class="mg-left-5" type="text" style="width:150px"/>
	                </div>
	            </div>
	            <div>
	                <div class="col-25">
	                    <label>이미지</label>
	                </div>
	
	                <div class="modal3-img-box">
	                    <img id="modal3-img"/>
	                </div>
	                <div>
	                    <input id="modal3-file" type="file" multiple="multiple"/>
	                    <button id="modal3-img-button" class="img-upload" type="button">이미지첨부</button>
	                </div>
	            </div>
	            <div>
	                <div class="col-25">
	                    <label>내용</label>
	                </div>
	                <div>
	                    <textarea placeholder="내용을 입력하세요."></textarea>
	                </div>
	            </div>
	
	            <div class="reg-box">
	                <button id="modal3-check" type="button" class="btn btn-success">확인</button>
	            </div>
	        </div>
	    </div>
	</main>
</section>