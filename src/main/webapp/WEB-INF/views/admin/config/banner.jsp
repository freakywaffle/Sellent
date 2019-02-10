<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/config/banner.css" />
<script src="/resources/js/admin/config/banner.js"></script>

<main id="main">
    <section class="content-box">
        <div class="table-top">
            <div>총 배너수 : 4</div>
            <button id="reg-button" type="button" class="btn btn-success">배너등록</button>
        </div>

        <table class="table-main">
            <thead class="thead">
                <tr>
                    <td>
                        <input id="total-check" type="checkbox"/>
                    </td>
                    <td>순서</td>
                    <td>이미지</td>
                    <td>제목</td>
                    <td>사용여부</td>
                    <td>종료일</td>
                    <td>관리</td>
                </tr>
            </thead>
            <tbody class="tbody">
                <tr>
                    <td>
                        <input type="checkbox"/>
                    </td>
                    <td>2</td>
                    <td class="text-align">
                        <div class="img-box">

                        </div>
                    </td>
                    <td>제목</td>
                    <td>
                        <label class="switch">
                            <input type="checkbox">
                            <span class="slider round"></span>
                        </label>
                        <p>ON</p><p style="display:none;">OFF</p>
                    </td>
                    <td>종료일</td>
                    <td>
                        <button type="button" class="btn btn-danger edit-button">수정
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox"/>
                    </td>
                    <td>1</td>
                    <td class="text-align">
                            <div class="img-box">
    
                            </div>
                        </td>
                    <td>제목</td>
                    <td>
                        <label class="switch">
                            <input type="checkbox">
                            <span class="slider round"></span>
                        </label>
                        <p>ON</p><p style="display:none;">OFF</p>
                    </td>
                    <td>종료일</td>
                    <td>
                        <button type="button" class="btn btn-danger edit-button">수정
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>
                    </td>
                </tr>
            </tbody>
        </table>
    </section>
		<div class="table-bottom">
            <button id="select-remove" type="button">선택삭제</button>
            <button id="save-button" type="button" class="btn btn-warning">저장</button>
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

            <h1>배너등록하기</h1>

            <div>
                <div class="col-25">
                    <label>제목</label>
                </div>
                <div>
                    <input class="height-30" type="text">
                </div>
            </div>
            <div>
                <div class="col-25">
                    <label>기간</label>
                </div>
                <div class="end-date">
                    <span class="mg-left-5">종료일 : </span>
                    <input id="datepicker2" class="mg-left-5" type="text" style="width:150px"/>
                </div>
            </div>
            <div>
                <div class="col-25">
                    <label>이미지</label>
                </div>

                <div class="modal-img-box">
                    <img id="modal-img"/>
                </div>

                <div>
                    <input id="modal-file" type="file" multiple="multiple"/>
                    <button id="modal-img-button" class="img-upload" type="button">이미지첨부</button>
                </div>
            </div>
            <div>
                <div class="col-25">
                    <label>내용</label>
                </div>
                <div>
                    <textarea placeholder="내용을 입력하세요."></textarea>
                </div>
            </div>

            <div class="reg-box">
                <button id="modal-check" type="button" class="btn btn-success">확인</button>
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
    <div id="modal3">
        <div class="modal3-content">
            <div class="cancel-box">
                <span id="modal3-close-button" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
            </div>

            <h1>배너수정</h1>

            <div>
                <div class="col-25">
                    <label>제목</label>
                </div>
                <div>
                    <input class="height-30" type="text">
                </div>
            </div>
            <div>
                <div class="col-25">
                    <label>기간</label>
                </div>
                <div class="end-date">
                    <span class="mg-left-5">종료일 : </span>
                    <input id="datepicker3" class="mg-left-5" type="text" style="width:150px"/>
                </div>
            </div>
            <div>
                <div class="col-25">
                    <label>이미지</label>
                </div>

                <div class="modal3-img-box">
                    <img id="modal3-img"/>
                </div>
                <div>
                    <input id="modal3-file" type="file" multiple="multiple"/>
                    <button id="modal3-img-button" class="img-upload" type="button">이미지첨부</button>
                </div>
            </div>
            <div>
                <div class="col-25">
                    <label>내용</label>
                </div>
                <div>
                    <textarea placeholder="내용을 입력하세요."></textarea>
                </div>
            </div>

            <div class="reg-box">
                <button id="modal3-check" type="button" class="btn btn-success">확인</button>
            </div>
        </div>
    </div>
</main>