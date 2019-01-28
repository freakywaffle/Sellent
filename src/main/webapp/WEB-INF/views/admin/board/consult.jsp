<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/board/consult.css" />
<script src="/resources/js/admin/board/consult.js"></script>


<main id="main">

    <section class="category-list bd-2 bd-color-gray  border-box">

        <div class="category-search-form bd-1 bd-color-gray ">
            
            <label class="search-name lb-gray">처리상태</label>
            
            <div class="search-content">
                <select>
                    <option>전체</option>
                    <option>대기</option>
                    <option>처리완료</option>
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

    <div id="modal">

        <div class="modal-content">
            
            <h1>1:1문의 답변하기</h1>
            
            <div class="customer-info border-top">
                <label>제목</label>
                <span>평가글 시스템 질문드립니다.</span>
            </div>

            <div class="customer-info border-top">
                <label>작성자</label>
                <span>newlec</span>
            </div>

            <div class="customer-info border-top border-bottom">
                <label>이메일</label>
                <span>newlec@naver.com</span>
            </div>

            <div class="question anser-box border-bottom">
                <label>질문내용</label>
                <div>
                    <span>내용</span>
                </div>
            </div>

            <div class="admin-answer anser-box">
                <label>답변내용</label>
                <textarea>
                    
                </textarea>
            </div>

            <div class="check-box text-align">
                <button class="check-button">확인</button>
                <button class="cancel-button">취소</button>
            </div>
        </div>
    </div>

</main>