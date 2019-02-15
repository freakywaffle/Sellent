<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/member/point.css" />
<script src="/resources/js/admin/member/point.js"></script>

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
	        
	        <div class="condition-form">
	
	            <label class="condition-title">분류</label>
	            
	            <div class="condition-content">
	                <select>
	                    <option>전체</option>
	                    <option>지급</option>
	                    <option>사용</option>
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
	                    <option>전체</option>
	                    <option>아이디</option>
	                    <option>이름</option>
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
	                    <td>번호</td>
						<td>아이디</td>
						<td>이름</td>
						<td>제목</td>
						<td>지급</td>
	                    <td>사용</td>
	                    <td>합계</td>
	                    <td>등록일</td>
	                    <td>기능</td>
	                </tr>
				</thead>
				
	            <tbody class="tbody">
	                <tr>
	                    <td>4</td>
	                    <td>asds00</td>
	                    <td>장독대</td>
	                    <td>게시물작성</td>
	                    <td></td>
	                    <td>-200</td>
	                    <td>600</td>
	                    <td>2019.02.01</td>
	                    <td>
	                        <button type="button" class="btn btn-primary point-button">포인트
	                            <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>
	                        </button>
	                    </td>
	                </tr>
	                <tr>
	                    <td>2</td>
	                    <td>sodo90</td>
	                    <td>이구아</td>
	                    <td>평가</td>
	                    <td>100</td>
	                    <td></td>
	                    <td>400</td>
	                    <td>2019.01.22</td>
	                    <td>
	                        <button type="button" class="btn btn-primary point-button">포인트
	                            <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>
	                        </button>
	                    </td>
	                </tr>
	            </tbody>
			</table>
		
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
	            <h1>포인트 지급</h1>
	            
	            <div class="input-box">
	                <label>지급사유</label>
	                <select>
	                    <option>첫로그인</option>
	                    <option>게시글작성</option>
	                    <option>평가작성</option>
	                    <option>후기작성</option>
	                    <option>거래완료</option>
	                    <option>기타</option>
	                </select>
	            </div>
	
	            <div class="input-box">
	                <label>포인트</label>
	                <select>
	                    <option>500</option>
	                    <option>400</option>
	                    <option>300</option>
	                    <option>200</option>
	                    <option>100</option>
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