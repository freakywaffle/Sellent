<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <header id="header">
		<!-- top header-->
		<section class="top-header">
			<div class="logo-bar">
				<div class="logo">
					<span class="main-title"><a href="/admin/board/category">ADMINISTRATOR</a></span>
					<span class="sub-title">(관리자페이지)</span>
				</div>
				<div class="member-menu">
					로그아웃
				</div>
			</div>
			
		</section>
		<!-- bottom-header-->
		<section class="bottom-header">
			<ul class="bottom-header-menu">
				<div class="first-list">
				</div>
				<li><a href="/admin/board/category">게시판관리</a>
					<ul class="bottom-sub-menu">
						<li><a href="/admin/board/category">카테고리</a></li>
						<li><a href="/admin/board/board">게시물</a></li>
						<li><a href="/admin/board/sale">판매요청</a></li>
						<li><a href="/admin/board/comment">후기</a></li>
						<li><a href="/admin/board/consult">1:1상담</a></li>
					</ul>
				</li>
				<li><a href="/admin/member/member">회원관리</a>
					<ul class="bottom-sub-menu">
						<li><a href="/admin/member/member">회원목록</a></li>
						<li><a href="/admin/member/point">포인트</a></li>
					</ul>
				</li>
				<li><a href="/admin/trade/total">거래관리</a>
					<ul class="bottom-sub-menu">
						<li><a href="/admin/trade/total">전체거래</a></li>
						<li><a href="/admin/trade/person">개인거래</a></li>
					</ul></li>
				<li><a href="/admin/config/banner">환경설정</a>
					<ul class="bottom-sub-menu">
						<li><a href="/admin/config/banner">배너관리</a></li>
						<li><a href="/admin/config/point">포인트설정</a></li>
						<li><a href="/admin/config/admin">관리자설정</a></li>
					</ul>
				</li>
			</ul>
		</section>
	</header>