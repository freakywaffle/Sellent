<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/board/sale.css" />
<script src="/resources/js/admin/board/sale.js"></script>

<main id="main">

    <section class="category-list bd-2 bd-color-gray  border-box">

        <div class="category-search-form bd-1 bd-color-gray ">
            
            <label class="search-name lb-gray">처리상태</label>
            
            <div class="search-content">
                <select>
                    <option>전체</option>
                    <option>대기</option>
                    <option>승인</option>
                    <option>거절</option>
                </select>
            </div>
        </div>

        <div class="category-search-form bd-1 bd-color-gray" style="border-top:none">
            <label class="search-name lb-gray">등록일</label>
        
            <div class="search-content">
                <input type="date"/>
                <span style="margin-right: 5px" class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                ~
                <input class="mg-left-5" type="date"/>
                <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
            </div>
        </div>

        <div class="category-search-form bd-1 bd-color-gray" style="border-top:none">
            <label class="search-name lb-gray">키워드검색</label>
    
            <div class="search-content">
                <select>
                    <option>제목</option>
                    <option>내용</option>
                    <option>작성자</option>
                    <option>제목+내용</option>
                </select>
                <input class="mg-left-5" type="text">
            </div>
        </div>

        <div class="search-button">
            <button type="button" class="btn btn-primary">검색하기</button>
        </div>


        <div class="category-sub">
            <div>총 게시판수 : 441</div>
        </div>

        <table class="category-list-table">
            <thead class="thead">
                <tr>
                    <td>
                        <input type="checkbox"/>
                    </td>
                    <td>번호</td>
                    <td>그룹명</td>
                    <td>카테고리명</td>
                    <td>제목</td>
                    <td>작성자</td>
                    <td>금액</td>
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
                    <td>IT개발</td>
                    <td>데이터베이스</td>
                    <td>ERD 만들어드립니다.</td>
                    <td>dkdkd000</td>
                    <td>99,000</td>
                    <td>2019.01.13</td>
                    <td>대기</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox"/>
                    </td>
                    <td>40</td>
                    <td>디자인</td>
                    <td>일러스트</td>
                    <td>아이콘 제작해드려요</td>
                    <td>newnewlec</td>
                    <td>58,000</td>
                    <td>2019.01.09</td>
                    <td>승인</td>
                </tr>
            </tbody>
        </table>


        <div class="select-delete">
            <button type="button">선택삭제</button>
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



</main>