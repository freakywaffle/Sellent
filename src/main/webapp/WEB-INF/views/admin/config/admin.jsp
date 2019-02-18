<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/config/admin.css" />
<script src="/resources/js/admin/config/admin.js"></script>

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
	        
	        <div class="condition-form">
	
	            <label class="condition-title">회원등급</label>
	            
	            <div class="condition-content">
	                <select>
	                    <option>전체</option>
	                    <option>관리자</option>
	                    <option>일반회원</option>
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
	                    <option>아이디</option>
	                    <option>이름</option>
	                </select>
	                <input class="mg-left-5" type="text">
	            </div>
	        </div>
	
	        <div class="search-form">
				<button type="button" class="btn btn-primary">검색하기</button>
	        </div>
	
			<div class="explan">
				<p>1: 관리자</p>
				<p>0: 일반회원</p>
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
						<td>등록일</td>
						<td>등급</td>
						<td>등급변경</td>
	                </tr>
				</thead>
				
	            <tbody class="tbody">
	                <tr>
	                    <td>4</td>
						<td>asds30</td>
						<td>장독대</td>
						<td>관리자</td>
						<td>2019.01.02</td>
						<td>
							<input class="spinner" name="value" value="1">
							<button type="button" class="btn btn-danger check-button">확인</button>
						</td>
	                </tr>
	                <tr>
						<td>2</td>
						<td>qwoeod22</td>
						<td>김꺽정</td>
						<td>일반회원</td>
						<td>2019.01.20</td>
						<td>
							<input class="spinner" name="value" value="0">
							<button type="button" class="btn btn-danger check-button">확인</button>
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