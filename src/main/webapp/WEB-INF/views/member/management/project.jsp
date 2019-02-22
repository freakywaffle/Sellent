<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/resources/css/member/project.css" rel="stylesheet" />
<script src="/resources/js/management/project.js"></script>
<script src="/resources/js/member/inc/aside.js"></script>

<section class="content">
	<div class="menu-button mobile-block">
		<input type="button" value=">" />
	</div>
	<div id="top-content">
		<div class="small-title">
			<a>프로젝트</a> <a>→</a> <a>평가</a>
		</div>
		<div class="select">
			<select id="options">
				<option name="anl" value=0 class="selec">평가</option>
				<option name="sell" value=1 class="selec">판매</option>
			</select>
		</div>
	</div>
	<div id="main-content">
		<c:forEach var="n" items="${product }">
			<div class="contents">
				<div class="title-img">
					<img alt="타이틀 이미지"
					src='<spring:url value="/sellent/upload/"/>${n.no}/${n.thumbnail}' onerror="this.src='/sellent/default/기본.gif'"/>
				</div>
				<div class="detail">
					<div class="prolike">
						<input type="hidden" name="pno" value="${n.no }"/>
						<i class="fas fa-heart ${fav }"></i>
					</div>
					<div class="protitle">${n.title }</div>
					<div class="detail-data">
						<div class="proedit">
							<div class="proedit-img">
								<img alt="편집횟수" src="/resources/images/edit.png">
							</div>
							<div>편집 횟수:</div>
							<div>
								<a>${n.editCnt }</a>회
							</div>
						</div>
						<div class="promake">
							<div class="promake-img">
								<img alt="소요일" src="/resources/images/clock.png">
							</div>
							<div>작업 일:</div>
							<div>
								<a>${n.duration }</a>일
							</div>
						</div>
						<div class="proname"><span>${n.writerId }</span></div>
					</div>
					<div class="won-star">
						<div class="won">
							<div class="won-img">
								<img alt="돈" src="/resources/images/save-money.png">
							</div>
							<div class="money">${n.price }</div>
						</div>
						<div class="star-point">
							<c:forEach begin="1" end="${n.avgStarPoint-(n.avgStarPoint%1) }">
								<div><img alt="별점" src="/resources/images/small-fullstar.png"/></div>
							</c:forEach>
							<c:forEach begin="${n.avgStarPoint-(n.avgStarPoint%1)+1}" end="5">
								<div><img alt="별점" src="/resources/images/small-binstar.png"/></div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>
	<div id="page">
		<ul>
			<c:if test="${prev}">
				<li><a href="?p=${startpage }"><img alt="이전"
						src="/resources/images/prev.png"></a></li>
			</c:if>
			<c:forEach var="n" begin="${startpage+1}" end="${endpage }">
				<li><a href="?p=${n }">${n }</a></li>
			</c:forEach>
			<c:if test="${next && endpage >0 }">
				<li><a href="?p=${endpage+1} "><img alt="다음"
						src="/resources/images/next.png"></a></li>
			</c:if>
		</ul>
	</div>
</section>