<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/board/category.css" />
<script src="/resources/js/admin/board/category.js"></script>


<section class="aside">
	<div class="aside-title">
		게시판관리
	</div>
	
	<ul class="aside-category-list">
		<li><a href="/admin/board/category">카테고리</a></li>
		<li><a href="/admin/board/board">게시물</a></li>
		<li><a href="/admin/board/sale">판매요청</a></li>
		<li><a href="/admin/board/comment">후기</a></li>
		<li><a href="/admin/board/consult">1:1상담</a></li>
	</ul>
</section>

<section class="content">	
	<div class="top-content">
		<label>게시판관리 > 카테고리</label>
		<div class="top-right-content">
			
		</div>
	</div>
	
	<main id="main">
	
		<section class="content-box">
			
			<div class="condition-form">
				
				<label class="condition-title">게시판 검색</label>
				
				<form action="category">
					<div class="condition-content">
						<select name="parent" id="group-select">
							<option value="">그룹선택</option>
							<c:forEach items="${parentList }" var="parent">
								<option value="${parent.name }">${parent.name}</option>
							</c:forEach>
						</select>
						<select name="sub" id="category-select" class="mg-left-5">
							<option class="category-total" value="">카테고리선택</option>
							
							<c:forEach items="${subList }" var="sub">
								<option class="category-opt hidden" name="${sub.parentName}" value="${sub.name }">${sub.name}</option>
							</c:forEach>
							
						</select>
						<button id="search-button" type="submit" class="btn btn-primary">검색</button>
					</div>
				</form>
			</div>
	
			<div class="table-top">
				<div>총 게시판수 : ${paging.totalCount }</div>
				<button id="total-edit-button" class="btn btn-success" type="button">게시판편집</button>
			</div>
	
			<table class="table-main">
				<thead class="thead">
					<tr>
						<!-- <td class="w-60">
							<input id="total-check" type="checkbox"/>
						</td> -->
						<td class="w-100">번호</td>
						<td>그룹명</td>
						<td>게시판명</td>
						<td class="w-100">게시물수</td>
						<td class="w-100">기능</td>
					</tr>
				</thead>
	
				<tbody class="tbody">
				<c:forEach items="${viewList }" var="category">
					<tr class="category-obj tr-hover">
						<!-- <td>
							<input type="checkbox"/>
						</td> -->
						<td>${category.num }</td>
						<td class="parentCategory">${category.parentCategory}</td>
						<td class="subCategory">${category.subCategory }</td>
						<td>${category.cnt }</td>
						<td>
							<button type="button" class="btn btn-danger edit-button">수정</button>
						</td>
					</tr>
				</c:forEach>
					
				</tbody>
			</table>
	
			<div class="paging">
				<div>
					<ul class="paging-box">
						<li class="paging-prev"><a href="?parent=${parent }&sub=${sub }&page=${paging.prevPage}"> < </a></li>
						
						<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}" step="1">
							
							<c:set var="cls" value="${i==paging.page?'strong':''}" />
							
							<li class="paging-number">
								<a class="${cls}" href="?parent=${parent }&sub=${sub }&page=${i}">${i }</a>
							</li>
	
						</c:forEach>
						
						<li class="paging-next"><a href="?parent=${parent }&sub=${sub }&page=${paging.nextPage}"> > </a></li>
					</ul>
				</div>
			</div>
	
		</section>
	
		<!--------modal-게시판편집----------------------------->
	
		<div id="modal">
			<div class="modal-content">
	
				<div class="cancel-box">
					<span id="modal-close-button" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
				</div>
	
				<h1>게시판편집</h1>
	
				<style>
					.category-list .ui-selecting { background: #FECA40; }
	  				.category-list .ui-selected { background: #F39814; color: white; }
				</style>
	
				<div class="flex-box">
					<div class="category-edit">
						<ul class="list-box">

						</ul>
					</div>

					<div class="input-box-container">
						<div class="input-box">
							<fieldset>
								<legend>그룹</legend>
								<div class="flex">
									<label>그룹명</label>
									<input id="parent-value" type="text" />
									<button id="parent-add" type="button" class="btn btn-danger">추가</button>
								</div>
	
							</fieldset>
						</div>
	
						<div class="input-box mg-top-10">
							<fieldset>
								<legend>카테고리</legend>
								<div class="flex">
									<label>그룹명</label>
									<input id="parent-name" type="text" readonly style="background-color:#eee"/>
								</div>
								<div class="flex mg-top-5">
									<label>카테고리명</label>
									<input id="sub-name" type="text"/>
									<button id="sub-add" type="button" class="btn btn-danger">추가</button>
								</div>
							</fieldset>
						</div>
	
						
					</div>
				</div>
	
				<div class="reg-box">
					<button id="modal-check" type="button" class="btn btn-success">확인</button>
				</div>
			</div>
		</div>
	
		<!--------------modal2-삭제확인------------------->
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
	
		<!-------------modal3-카테고리수정--------------->
		<div id="modal3">
			<div class="modal3-content">
				<div class="cancel-box">
					<span id="modal3-close-button" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
				</div>
				<h1>게시판수정</h1>
	
				<fieldset class="edit-before mg-top-10">
					<legend>현재</legend>
					<div class="flex">
						<label>그룹</label>
						<input id="modal3-parent-before" type="text" readonly/>
					</div>
					<div class="flex mg-top-5">
						<label>카테고리명</label>
						<input id="modal3-sub-before" type="text" readonly/>
					</div>
				</fieldset>	
	
				<fieldset class="edit-after mg-top-10">
					<legend>변경 후</legend>
					<div class="flex">
						<label>그룹</label>
						<input id="modal3-parent-after" type="text" readonly/>
					</div>
					<div class="flex mg-top-5">
						<label>카테고리명</label>
						<input id="modal3-sub-after" type="text"/>
					</div>
				</fieldset>	
	
				<div class="modal3-checkbox">
					<button id="modal3-check" type="button" class="btn btn-success">확인</button>
				</div>
			</div>
		</div>
	
	</main>

</section>














