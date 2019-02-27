<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/member/member.css" />
<script src="/resources/js/admin/member/member.js"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 

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
		<label>회원관리 > 회원목록</label>
		<div class="top-right-content">
			
		</div>
	</div>
	
	<main id="main">
	
		<section class="content-box">
	
			<form action="member">
				<div class="condition-form">
					<label class="condition-title">가입일</label>
				
					<div class="condition-content">
						<input name="startDate" id="datepicker"type="text"/>
						<span class="mg-left-5">~</span>
						<input name="endDate" id="datepicker2" class="mg-left-5" type="text"/>
					</div>
				</div>
		
				<div class="condition-form" style="border-top:none">
					<label class="condition-title">키워드검색</label>
			
					<div class="condition-content">
						<select name="condition">
							<option value="id">아이디</option>
							<option value="nickname">닉네임</option>
						</select>
						<input name="text" class="mg-left-5" type="text">
					</div>
				</div>
		
				<div class="search-form">
					<button id="search-button" type="submit" class="btn btn-primary">검색하기</button>
				</div>
			</form>
	
	
			<div class="table-top">
				<div>총 회원수 : ${paging.totalCount }</div>
				<button id="member-reg" type="button" class="btn btn-success">회원등록</button>
			</div>
	
			<table class="table-main">
				<colgroup>
					<col width="60px">
					<col width="150px">
					<col width="150px">
					<col width="250px">
					<col width="100px">
					<col width="150px">
					<col width="150px">
				</colgroup>
				<thead class="thead">
					<tr>
						<td>
							<input id="total-check" type="checkbox"/>
						</td>
						<td>아이디</td>
						<td>닉네임</td>
						<td>이메일</td>
						<td>포인트</td>
						<td>가입일</td>
						<td>관리</td>
					</tr>
				</thead>
				<tbody class="tbody">
				<c:forEach items="${list }" var="member">
					<tr class="member-obj tr-hover">
						<td>
							<input class="check-box" type="checkbox"/>
						</td>
						<td class="member-id">${member.id }</td>
						<td>${member.nickname }</td>
						<td class="member-email">${member.email }</td>
						<td>${member.point}</td>
						<td>
							<fmt:formatDate value="${member.regdate}" pattern="yyyy-MM-dd"/>
						</td>
						<td>
							<button type="button" class="btn btn-danger member-info">정보
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
							</button>
							
							<button type="button" class="btn btn-info member-mail">메일
								<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
							</button>
						</td>

						<td class="member-simple hidden">${member.simple_introduction}</td>
						<td class="member-detail hidden">${member.detail_introduction}</td>
						<td class="member-photo hidden">${member.photo}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
	      	<div class="whirly-loader loding-bar hidden">
           		Loading...
       		</div>
			<div class="table-bottom">
				<button id="select-remove" type="button">선택삭제</button>
			</div>
	
			<div class="paging">
				<div>
					<ul class="paging-box">
						<li class="paging-prev"><a href="${query}&page=${paging.prevPage}"> < </a></li>
						
						<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}" step="1">
							
							<c:set var="cls" value="${i==paging.page?'strong':''}" />
							
							<li class="paging-number">
								<a class="${cls}" href="${query}&page=${i}">${i }</a>
							</li>

						</c:forEach>
						
						<li class="paging-next"><a href="${query}&page=${paging.nextPage}"> > </a></li>
					</ul>
				</div>
			</div>
		</section>
	
		<div id="modal">
			<div class="modal-content">
				<div style="width:100%; text-align:end">
					<span id="modal-close-button" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
				</div>
	
				<h1>회원등록</h1>
		
				<div>
					<div class="col-25">
						<label>프로필 사진</label>
					</div>
					<div class="modal-photo-box">
						<img id="modal-photo" src="/sellent/admin/업로드아이콘.png"/>
					</div>
					<div>
						<input class="hidden" name="image" id="modal-file" type="file" multiple value="이미지첨부"/>
						<button id="modal-img-button" class="img-upload" type="button">이미지첨부</button>
					</div>
				</div>
				
				<div>
					<div class="col-25">
						<label>아이디</label>
					</div>
					<div>
						<input id="modal-id" class="height-30" type="text" placeholder="아이디 입력">
					</div>
				</div>
				<div>
					<div class="col-25">
						<label>닉네임</label>
					</div>
					<div>
						<input id="modal-nickname" class="height-30" type="text" placeholder="닉네임 입력">
					</div>
				</div>
				<div>
					<div class="col-25">
						<label>비밀번호</label>
					</div>
					<div>
						<input id="modal-pwd" class="height-30" type="text" placeholder="비밀번호를 입력">
					</div>
				</div>
				<div>
					<div class="col-25">
						<label>비밀번호 재확인</label>
						<span class="pwd-message">비밀번호가 일치하지 않습니다</span>
					</div>
					<div>
						<input id="modal-pwd2" class="height-30" type="text" placeholder="비밀번호 확인">
					</div>
				</div>
				<div>
					<div class="col-25">	
						<label>이메일</label>
					</div>
					<div>
						<input id="modal-mail" class="height-30" type="text" placeholder="이메일 입력">
					</div>
				</div>
				<h1 style="margin-top:30px">자기소개</h1>
				<div>
					<div class="col-25">	
						<label>간단소개</label>
					</div>
					<div>
						<input id="modal-simple" class="height-30" type="text" placeholder="제목 입력">
					</div>
				</div>
				<div>
					<div class="col-25">
						<label>상세소개</label>
					</div>
					<div>
						<textarea id="modal-detail" placeholder="내용을 입력하세요.."></textarea>
					</div>
				</div>
				<div>
					<div class="col-25">	
						<label>보유기술</label>
					</div>
					<div>
						<input id="modal-skill" class="height-30" type="text" placeholder="보유기술 입력">
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
			<div class="mail">
				<div style="width:100%; text-align:end">
					<span id="modal3-close-button" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
				</div>
	
				<h1>메일보내기</h1>
	
				<div>
					<div class="col-25">
						<label for="fname">아이디</label>
					</div>
					<div>
						<input id="modal3-id" class="height-30 readonly" type="text" readonly>
					</div>
				</div>
				<div>
					<div class="col-25">
						<label for="lname">이메일</label>
					</div>
					<div>
						<input id="modal3-mail"class="height-30 readonly" type="text" readonly>
					</div>
				</div>
				<div>
					<div class="col-25">
						<label for="lname">제목</label>
					</div>
					<div>
						<input id="modal3-title" class="height-30" type="text" placeholder="제목을 입력하세요..">
					</div>
				</div>
				<div>
					<div class="col-25">
						<label>내용</label>
					</div>
					<div>
						<textarea id="modal3-content" placeholder="내용을 입력하세요.."></textarea>
					</div>
				</div>
				<div class="reg-box">
					<button id="modal3-check" type="button" class="btn btn-info">보내기</button>
				</div>
			</div>
		</div>
	
		<div id="modal4">
			<div class="modal4-content">
				<form action="action_page.php">
					<div style="width:100%; text-align:end">
						<span id="modal4-close-button" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</div>
	
					<h1>기본정보</h1>
	
					<div>
						<div class="col-25">
							<label for="fname">프로필 사진</label>
						</div>
						<div class="profile-photo">
							<!-- <div class="photo-alert">등록된 사진이 없습니다.</div> -->
							<img id="modal4-photo" 
							onerror="this.src = '/sellent/admin/대체이미지.png'"/>
						</div>
					</div>
	
					<h1 style="margin-top:30px">자기소개</h1>
					<div>
						<div class="col-25">	
							<label>간단소개</label>
						</div>
						<div>
							<input id="modal4-simple" class="height-30" type="text" readonly>
						</div>
					</div>
					<div>
						<div class="col-25">
							<label>상세소개</label>
						</div>
						<div>
							<textarea id="modal4-detail" readonly></textarea>
						</div>
					</div>
					<div>
						<div class="col-25">	
							<label>보유기술</label>
						</div>
						<div>
							<input id="modal4-skill" class="height-30" type="text" readonly>
						</div>
					</div>
					<div class="reg-box">
						<button id="modal4-check" type="button" class="btn btn-danger">확인</button>
					</div>
				</form>
			</div>
		</div>
	
	</main>
</section>