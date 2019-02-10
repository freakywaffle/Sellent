<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
href="/resources/css/admin/trade/person.css" />
<script src="/resources/js/admin/trade/person.js"></script>

<main id="main">

    <section class="content-box">

        <div class="condition-form">
    
            <label class="condition-title">조건</label>
            
            <div class="condition-content">
                <select>
                    <option>전체</option>
                    <option>구매</option>
                    <option>판매</option>
                </select>
                <select class="mg-left-5">
                    <option>전체</option>
                    <option>거래중</option>
                    <option>거래완료</option>
                </select>
            </div>
        </div>

        <div class="condition-form" style="border-top:none">
            <label class="condition-title">거래일자</label>
            
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
                    <option>글번호</option>
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
                    <td>아이디</td>
                    <td>종류</td>
                    <td>거래일자</td>
                    <td>거래금액</td>
                    <td>입금액</td>
                    <td>수령액</td>
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
                    <td>구매</td>
                    <td>2019.01.10</td>
                    <td>150,000</td>
                    <td>150,000</td>
                    <td>-</td>
                    <td>거래중</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox"/>
                    </td>
                    <td>3</td>
                    <td>sasdd993</td>
                    <td>판매</td>
                    <td>2019.01.07</td>
                    <td>220,000</td>
                    <td>-</td>
                    <td>220,000</td>
                    <td>거래완료</td>
                </tr>
            </tbody>
        </table>

        <div class="result-box">
            <span>합계  </span>
            <span>거래건수 : 4</span>
            <span>입금액 : 150,000</span>
            <span>수령액 : 50,000</span>
            <span>손익 : 100,000</span>
        </div>

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