<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/board/banner.css" />
<script src="/resources/js/admin/board/banner.js"></script>

<main id="main">

    <section class="category-list bd-2 bd-color-gray  border-box">

        <section class="banner-box">
            <ul class="banner-list">
                <li style="margin-right:1px" class="left-move"></li>
                <li class="banner">
                    <div class="banner-title">
                        <label>제목</label>
                        <span>X</span>
                    </div>
                    <div class="banner-img">이미지</div>
                </li>
                <li class="banner">
                    <div class="banner-title">
                        <label>제목</label>
                        <span>X</span>
                    </div>
                    <div class="banner-img">이미지</div>
                </li>
                <li class="banner">
                    <div class="banner-title">
                        <label>제목</label>
                        <span>X</span>
                    </div>
                    <div class="banner-img">이미지</div>
                </li>
                <li class="banner">
                    <div class="banner-title">
                        <label>제목</label>
                        <span>X</span>
                    </div>
                    <div class="banner-img">이미지</div>
                </li>
                <li style="margin-left:1px" class="right-move"></li>
            </ul>
        </section>

        <div class="category-sub">
            <div>총 배너수 : 4</div>
        </div>

        <table class="category-list-table">
            <thead class="thead">
                <tr>
                    <td>
                        <input type="checkbox"/>
                    </td>
                    <td>번호</td>
                    <td>이미지</td>
                    <td>제목</td>
                    <td>시작일</td>
                    <td>마감일</td>
                    <td>남은기간</td>
                    <td>순서</td>
                    <td>관리</td>
                    <td>편집</td>
                </tr>
            </thead>
            <tbody class="tbody">
                <tr>
                    <td>
                        <input type="checkbox"/>
                    </td>
                    <td>3</td>
                    <td>이미지</td>
                    <td>사이트 홍보</td>
                    <td>2019.01.13</td>
                    <td>2019.02.23</td>
                    <td>20</td>
                    <td>3</td>
                    <td>
                        <!-- Rounded switch -->
                        <label class="switch">
                            <input type="checkbox">
                            <span class="slider round"></span>
                        </label>
                    </td>
                    <td>
                        <button type="button" class="btn btn-primary edit-button">수정</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox"/>
                    </td>
                    <td>3</td>
                    <td>이미지</td>
                    <td>사이트 홍보</td>
                    <td>2019.01.13</td>
                    <td>2019.02.23</td>
                    <td>20</td>
                    <td>2</td>
                    <td>
                        <!-- Rounded switch -->
                        <label class="switch">
                            <input type="checkbox">
                            <span class="slider round"></span>
                        </label>
                    </td>
                    <td>
                        <button type="button" class="btn btn-primary edit-button">수정</button>
                    </td>
                </tr>
            </tbody>
        </table>


        <div class="select-delete">
            <button type="button">선택삭제</button>
            <button class="reg-button" type="button">배너등록</button>
        </div>

        <div class="last-check">
            <button type="button" class="btn btn-danger">확인</button>
            <button type="button" class="btn btn-danger">초기화</button>
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
        <div class="container">
            <form action="action_page.php">
                <div style="width:100%; text-align:end">
                    <span class="glyphicon glyphicon-remove cancel-button" aria-hidden="true"></span>
                </div>
                <div class="row">
                <div class="col-25">
                    <label for="fname">제목</label>
                </div>
                <div class="col-75">
                    <input type="text" id="fname" name="firstname" placeholder="제목을 입력하세요..">
                </div>
                </div>
                <div class="row">
                <div class="col-25">
                    <label for="lname">기간</label>
                </div>
                <div class="col-75">
                    <input type="text" id="lname" name="lastname" placeholder="기간을 입력하세요..">
                </div>
                </div>
                <div class="row">
                <div class="col-25">
                    <label for="country">이미지</label>
                </div>
                <div class="col-75">
                    <select id="country" name="country">
                    <option value="australia">Australia</option>
                    <option value="canada">Canada</option>
                    <option value="usa">USA</option>
                    </select>
                </div>
                </div>
                <div class="row">
                <div class="col-25">
                    <label for="subject">내용</label>
                </div>
                <div class="col-75">
                    <textarea id="subject" name="subject" placeholder="내용을 입력하세요.." style="height:200px"></textarea>
                </div>
                </div>
                <div class="row">
                <input type="button" value="배너등록">
                </div>
            </form>
        </div>
    </div>


</main>