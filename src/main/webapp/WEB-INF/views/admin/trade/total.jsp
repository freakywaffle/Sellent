<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/trade/total.css" />
<script src="/resources/js/admin/trade/total.js"></script>

<main id="main">

    <section class="content-box">

        <div class="condition-form">
        
            <label class="condition-title">거래상태</label>
            
            <div class="condition-content">
                <select>
                    <option>전체</option>
                    <option>거래중</option>
                    <option>거래완료</option>
                </select>
            </div>
        </div>


        <div class="condition-form" style="border-top:none">
            <label class="condition-title">등록일</label>
            
            <div class="condition-content">
                <input type="date"/>
                <span style="margin-right: 5px" class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                ~
                <input class="mg-left-5" type="date"/>
                <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
            </div>
        </div>

        <div class="condition-form" style="border-top:none">
            <label class="condition-title">키워드검색</label>
    
            <div class="condition-content">
                <label>구매자</label>
                <input class="mg-left-5" type="text"> 
                <label class="mg-left-5">판매자</label>
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
                        <input type="checkbox"/>
                    </td>
                    <td>번호</td>
                    <td>구매자</td>
                    <td>판매자</td>
                    <td>거래일자</td>
                    <td>결제금액</td>
                    <td>거래상태</td>
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
                    <td>150,000</td>
                    <td>거래중</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox"/>
                    </td>
                    <td>2</td>
                    <td>ddms22</td>
                    <td>asd123</td>
                    <td>2019.01.03</td>
                    <td>99,000</td>
                    <td>거래완료</td>
                </tr>
            </tbody>
        </table>

		<div class="table-bottom">
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








