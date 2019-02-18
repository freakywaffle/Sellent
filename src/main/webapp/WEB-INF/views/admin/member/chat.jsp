<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/member/chat.css" />
<script src="/resources/js/admin/member/chat.js"></script>

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
		<label>회원관리 > 채팅</label>
		<div class="top-right-content">
			
		</div>
	</div>
	
	<main id="main">
	    <section class="content-box">
	
	        <div class="condition-form">
	            <label class="condition-title">등록일</label>
	        
	            <div class="condition-content">
	                <input id="datepicker"type="text"/>
	                <span class="mg-left-5">~</span>
	                <input id="datepicker2" class="mg-left-5" type="text"/>
	            </div>
	        </div>
	
	        <div class="condition-form" style="border-top:none">
	            <label class="condition-title">키워드검색</label>
	    
	            <div class="condition-content">
	                <select>
	                    <option>전체</option>
	                    <option>보낸이</option>
	                </select>
	                <input class="mg-left-5" type="text">
	                <select class="mg-left-5">
	                    <option>전체</option>
	                    <option>받는이</option>
	                </select>
	                <input class="mg-left-5" type="text">
	            </div>
	        </div>
	
	        <div class="search-form">
	            <button type="button" class="btn btn-primary">검색하기</button>
	        </div>
	
	
	        <div class="table-top">
	            <div>총 회원수 : 51</div>
	        </div>
	
	        <table class="table-main">
	            <thead class="thead">
	                <tr>
	                    <td>
	                        <input id="total-check" type="checkbox"/>
	                    </td>
	                    <td>번호</td>
	                    <td>보낸이</td>
	                    <td>받는이</td>
	                    <td>첫 채팅</td>
	                    <td>최근 채팅</td>
	                    <td>내용</td>
	                </tr>
	            </thead>
	            <tbody class="tbody">
	                <tr>
	                    <td>
	                        <input type="checkbox"/>
	                    </td>
	                    <td>4</td>
	                    <td>sadkkas02</td>
	                    <td>992oeed</td>
	                    <td>2019.01.10</td>
	                    <td>2019.01.22</td>
	                    <td>
	                        <button type="button" class="btn btn-info talk">내용
	                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
	                        </button>
	                    </td>
	                </tr>
	                <tr>
	                    <td>
	                        <input type="checkbox"/>
	                    </td>
	                    <td>2</td>
	                    <td>ddms22</td>
	                    <td>asd123</td>
	                    <td>2019.01.03</td>
	                    <td>2019.01.11</td>
	                    <td>
	                        <button type="button" class="btn btn-info talk">내용
	                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
	                        </button>
	                    </td>
	                </tr>
	            </tbody>
	        </table>
	
	        <div class="table-bottom">
				<button id="select-remove" type="button">선택삭제</button>
	        </div>
	        
	        <div class="paging">
	            
	            <div>
	                <ul class="paging-number">
	                    <li><a href=""> << </a></li>
	                    <li><a href=""> < </a></li>
	                    <li><a href=""> 1 </a></li>
	                    <li><a href=""> 2 </a></li>
	                    <li><a href=""> 3 </a></li>
	                    <li><a href=""> > </a></li>
	                    <li><a href=""> >> </a></li>
	                </ul>
	            </div>
	        </div>
	    </section>
	
	    <div id="modal">
	        <div class="modal-content">
	            <div class="cancel-box">
					<span id="modal-close-button" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
	            </div>
	            
	            <div class="reg-box">
					<button id="modal-check" type="button" class="btn btn-primary">지급하기</button>
				</div>
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
	
	
	</main>
</section>














