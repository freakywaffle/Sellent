<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/resources/css/profile/introduce.css" rel="stylesheet" />
<script src="/resources/js/member/introduce.js"></script>
<script src="/resources/js/member/inc/aside.js"></script>

<section class="content">
	<div class="menu-button mobile-block">
		<input type="button" value=">" />
	</div>
	<form id="wrap" action="introduce" method="post">
		<div class="main">
			<div class="introduce">
				<div class="title">
					<div class="title-title" dir="rtl">제목</div>
					<div class="title-content">
						<input type="text" name="simple_introduction"
							value="${member.simple_introduction }" />
					</div>
				</div>

				<div class="content">
					<div class="title-title" dir="rtl">내용</div>
					<div class="title-content">
						<textarea name="detail_introduction" placeholder="">${member.detail_introduction }</textarea>
					</div>
				</div>

				<div class="tech techtech">
					<div class="title-title" dir="rtl">보유기술</div>
					<span class="techroom">
						<!-- <span> -->
						<c:forEach var="result" items="${skill }">
							<div class="introtechnic">
								<a class="techname" name="name">${result.name }</a> 
								<span class="introclose-button">&times;</span>
							</div>
						</c:forEach>
						<!-- </span> -->
					</span>
				</div>

				<div class="tech-add">
					<div>
						<input type="text" name="name" placeholder="내용입력" />
					</div>
					<div>
						<input type="button" name="skillPut" value="+" />
					</div>
				</div>
			</div>

			<div class="complete">

				<input type="submit" value="수정하기" />

			</div>
		</div>
	</form>
</section>