<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/board/board.css" />
<script src="/resources/js/admin/board/board.js"></script>

<main id="main">

    <section class="content-box">
    
        <div class="condition-form">
            
            <label class="condition-title">조건설정</label>
            
            <div class="condition-content">
                <select>
                    <option>그룹검색</option>
                    <option>IT개발</option>
                    <option>디자인</option>
                    <option>번역</option>
                    <option>음악/더빙</option>
                </select>
                <select class="mg-left-5">
                    <option>카테고리검색</option>
                    <option>프로그래밍</option>
                    <option>데이터베이스</option>
                    <option>시스템</option>
                </select>
                <select class="mg-left-5">
                    <option>구분</option>
                    <option>주니어</option>
                    <option>프로</option>
                </select>
                <select class="mg-left-5">
                    <option>판매여부</option>
                    <option>Yes</option>
                    <option>No</option>
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
                    <td>구분</td>
                    <td>판매여부</td>
                    <td>그룹명</td>
                    <td>카테고리명</td>
                    <td>제목</td>
                    <td>작성자</td>
                    <td>등록일자</td>
                </tr>
            </thead>
            <tbody class="tbody">
                <tr>
                    <td>
                        <input type="checkbox"/>
                    </td>
                    <td>40</td>
                    <td>주니어</td>
                    <td>Yes</td>
                    <td>IT개발</td>
                    <td>데이터베이스</td>
                    <td>DB구축해드립니다.</td>
                    <td>마계동굴</td>
                    <td>2019.01.13</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox"/>
                    </td>
                    <td>35</td>
                    <td>프로</td>
                    <td>No</td>
                    <td>디자인</td>
                    <td>일러스트</td>
                    <td>아이콘 그려드립니다</td>
                    <td>디자이너</td>
                    <td>2019.01.10</td>
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