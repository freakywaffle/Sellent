<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/config/point.css" />
<script src="/resources/js/admin/config/point.js"></script>

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
		<label>환경설정 > 포인트설정</label>
		<div class="top-right-content">
			
		</div>
	</div>
	
	<main id="main">
	
			<section class="content-box">
				<table class="table-main">
					<thead class="thead">
						<tr>
							<td>포인트내역</td>
							<td>포인트</td>
							<td>사용유무</td>
						</tr>
					</thead>
					<tbody class="tbody">
						<tr>
							<td>첫로그인</td>
							<td class="td-text">
								<input type="text" />
							</td>
							<td class="td-radio">
								<div class="div-radio">
									<input type="radio"/>
									<span>사용</span>
									<input type="radio"/>
									<span>사용안함</span>
								</div>
							</td>
						</tr>
						<tr>
							<td>게시글작성</td>
							<td class="td-text">
								<input type="text" />
							</td>
							<td class="td-radio">
								<div class="div-radio">
									<input type="radio"/>
									<span>사용</span>
									<input type="radio"/>
									<span>사용안함</span>
								</div>
							</td>
						</tr>
						<tr>
							<td>댓글작성</td>
							<td class="td-text">
								<input type="text" />
							</td>
							<td class="td-radio">
								<div class="div-radio">
									<input type="radio"/>
									<span>사용</span>
									<input type="radio"/>
									<span>사용안함</span>
								</div>
							</td>
						</tr>
						<tr>
							<td>거래완료</td>
							<td class="td-text">
								<input type="text" />
							</td>
							<td class="td-radio">
								<div class="div-radio">
									<input type="radio"/>
									<span>사용</span>
									<input type="radio"/>
									<span>사용안함</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
	
				<div class="table-bottom">
					<button id="save-button" type="button" class="btn btn-success">저장</button>
				</div>
			</section>
		
	</main>
</section>