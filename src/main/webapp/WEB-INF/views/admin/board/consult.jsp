<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/board/consult.css" />
<script src="/resources/js/admin/board/consult.js"></script>

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
		<label>게시판관리 > 1:1상담</label>
		<div class="top-right-content">
			
		</div>
	</div>
	
	<main id="main">
	
	    <section class="content-box">
	
	        <div class="condition-form">
	            
	            <label class="condition-title">처리상태</label>
	            
	            <div class="condition-content">
	                <select>
	                    <option>전체</option>
	                    <option>대기</option>
	                    <option>처리완료</option>
	                </select>
	            </div>
	        </div>
	
	        <div class="condition-form" style="border-top:none">
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
	                    <option>제목</option>
	                    <option>내용</option>
	                    <option>작성자</option>
	                    <option>제목+내용</option>
	                </select>
	                <input class="mg-left-5" type="text">
	            </div>
	        </div>
	
	        <div class="search-form">
	            <button type="button" class="btn btn-primary">검색하기</button>
	        </div>
	
	
	        <div class="table-top">
	            <div>총 게시판수 : 441</div>
	        </div>
	
	        <table class="table-main">
	            <thead class="thead">
	                <tr>
	                    <td>
	                        <input id="total-check" type="checkbox"/>
	                    </td>
	                    <td>번호</td>
	                    <td>제목</td>
	                    <td>작성자</td>
	                    <td>등록일자</td>
	                    <td>처리상태</td>
	                </tr>
	            </thead>
	            <tbody class="tbody">
	                <tr>
	                    <td>
	                        <input type="checkbox"/>
	                    </td>
	                    <td>40</td>
	                    <td>사이트 관련 질문드립니다</td>
	                    <td>dkdkd000</td>
	                    <td>2019.01.13</td>
	                    <td>
	                            <button type="button" class="btn btn-primary">대기</button>
	                    </td>
	                </tr>
	                <tr>
	                    <td>
	                        <input type="checkbox"/>
	                    </td>
	                    <td>40</td>
	                    <td>거래 방법 문의드립니다</td>
	                    <td>newnewlec</td>
	                    <td>2019.01.09</td>
	                    <td>처리완료</td>
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
	            
	            <h1>1:1문의 답변하기</h1>
	            
	            <section class="customer-info">
	                <div>
	                    <label>제목</label>
	                    <span>평가글 시스템 질문드립니다.</span>
	                </div>
	
	                <div>
	                    <label>작성자</label>
	                    <span>newlec</span>
	                </div>
	
	                <div class="border-bottom">
	                    <label>이메일</label>
	                    <span>newlec@naver.com</span>
	                </div>
	            </section>
	
	            <section class="customer-content">
	                <div class="question">
	                    <label style="display: block">질문내용</label>
	                    <textarea style="width:100%" placeholder="내용~~" readonly></textarea>
	                </div>
	
	                <div class="admin-answer">
	                    <label>답변내용</label>
	                    <textarea></textarea>
	                </div>
	            </section>
	            <div class="reg-box">
					<button id="modal-check" type="button" class="btn btn-primary">답변하기</button>
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