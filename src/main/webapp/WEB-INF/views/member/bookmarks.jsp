<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
     
<!DOCTYPE html>

<head>
	<meta charset="UTF-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
	<!-- font Awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	<link rel="stylesheet" href="../../resources/css/member/bookmarks.css">
	
	<title>sellent</title>
	

</head>

<body>
	<div class="main-container h-100">
		<div class="main-head">
			<h1>찜한 서비스</h1>
		</div>
		<div class="m-felx flex h-cal">
			<div class="aside flex 	h-100">
				<div class="main-list">
					<ul>
						<li><a href="#" class="a-color"><i class="fa fa-caret-right"></i>전체 카테고리 (0)</a></li>
					</ul>
					<ul class="aside-lsit">
						<li><a href="#" class="a-color">디자인 (0)</a></li>
						<li><a href="#" class="a-color">IT·프로그래밍 (0)</a></li>
						<li><a href="#" class="a-color">콘텐츠 제작 (0)</a></li>
						<li><a href="#" class="a-color">마케팅 (0)</a></li>
						<li><a href="#" class="a-color">번역·통역 (0)</a></li>
						<li><a href="#" class="a-color">문서·취업 (0)</a></li>				
						<li><a href="#" class="a-color">비즈니스컨설팅 (0)</a></li>
						<li><a href="#" class="a-color">운세·상담 (0)</a></li>
						<li><a href="#" class="a-color">레슨 (0)</a></li>
						<li><a href="#" class="a-color">기프트·커스텀 (0)</a></li>
					</ul>
					<ul>
						<li><a href="#" class="a-color"><i class="fa fa-caret-right"></i>포트폴리오 (0)</a></li>
					</ul>
				</div>
			</div>
			<div class="main h-100">
				
		
			<c:forEach var="a" items="${likeList}" varStatus="index">
				
				<c:if test="${index.count%4 eq 1}">
				
					<div class="content-box flex">
				</c:if>
				
				<div class="content bbb">
						<a href="/category/${a.no}">
							<div class="img-box bbb">
								<div class="img"></div>
								<div class="profile"></div>
							</div>
						</a>
						<div class="text">
							<a href="#">
								<div class="writer-id">${a.writerId}</div>
								<div class="title" style="height: 40px">${a.parentCategory}  ${a.title}</div>
								<div class="price"><fmt:formatNumber value="${a.price}" type="number"/>원 ~</div>
							</a>
							<div class="flex">
								<div class="product">
										<div class="fornt">
											<div class="img-wrap">
												<i class="fa fa-heart fav" style="left: 10px; top: 3px;"></i>
											</div>
										</div>
									</div>
								<div class="star"> ★★★★★ (${a.reviewCnt})</div>
							</div>
						</div>
					</div>
					
					<c:if test="${index.count%4 eq 0}">
				
					</div>
					</c:if>
					
					
				
				</c:forEach>
 
			
			
			</div>
		</div>
	</div>
	
	<script>

	
	
	
		$(document).ready(function(){
			
			// for fav
			$('.fa-heart').click(function(){
				$(this).toggleClass('fav');	
			});
			

		});
	

	
	
	</script>
</body>
