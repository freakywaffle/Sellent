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
						<li><a href="#" class="a-color p-catrgory"><i class="fa fa-caret-right"></i>전체카테고리</a></li>
					</ul>
					<ul class="aside-lsit">
						<c:forEach var="p" items="${PC_list}">
						<li><a href="#" class="a-color p-catrgory">${p.parent_category} (${p.cnt})</a></li>
						</c:forEach>
						
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
				
				<div class="content bbb" style="">
						<a href="/category/${a.no}">
							<div class="img-box bbb">
								<div class="img">${a.thumbnail}</div>
								<div class="profile">${a.photo}</div>
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
												<i class="fa fa-heart fav" style="left: 10px; top: 3px;"><div class="hidden">${a.no}</div></i>
											</div>
										</div>
									</div>
								<div class="star"> ★★★★★${a.avgStarPoint} (${a.reviewCnt})</div>
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


	$('.p-catrgory').click(function () {

		var a = $(this).text().split(' ');
		var c= a[0]
		
		$.ajax({
		    method      : 'POST',
		    url         : '/member/my_bookmarks_ajax',
		    data        : { "category" : c},
		    success     : function(json) {
 				var b = JSON.parse(json)
 				$(".content-box").remove();
 				var qq = b.length/4
 				
 				if(b.length%4 !=0)
 					qq+=1;
 				var main = $('.main');
 				var ff = b.length;
				var size = 4;
 				for(var j=0; j<qq; j++) {
 					
	 				
 					var cv = $("<div class='content-box flex'>"); 	
	 				
 					if(ff<4)
 						size=ff;
 					
 					for(var i=0; i <size; i++) {
				
	 				var aaaa = b[i].price;
	 				var price = aaaa.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
	
								
				
	 				
	 				
						
						
 					var q = $("<div class='content bbb'></div>"); 	
					
		 			var cc = $("<a href='/category/"+b[i].no+"'><div class='img-box bbb'><div class='img'></div><div class='profile'></div></div></a>")
				
		 			
		 			var dd = $("<div class='text'></div>")
		 			var qqq = $("<a href='#'></a>")
		 			var www = $("<div class='writer-id'>"+b[i].writerId+"</div>")
		 			var eee = $("<div class='title' style='height: 40px'>"+b[i].title+"</div>")
		 			var rrr = $("<div class='price'>"+price+"원~"+"</div>")
		 			
		 			var flex = $("<div class='flex'></div>")
					var product = $("<div class='product'></div>")
					var star = $("<div class='star'>"+"("+b[i].reviewCnt+")"+"</div>")
					
					var fornt = $("<div class='fornt'></div>")
					var imgWrap = $("<div class='img-wrap'></div>")
					var heart = $("<i class='fa fa-heart fav' style='left: 10px; top: 3px;'><div class='hidden'>"+b[i].no+"</div></i>")
					
					qqq.append(www)	
					qqq.append(eee)	
					qqq.append(rrr)	
					imgWrap.append(heart)
					fornt.append(imgWrap)
					product.append(fornt)
					flex.append(product)
					flex.append(star)
		 			dd.append(qqq)
		 			dd.append(flex)
					q.append(cc)
		 			q.append(dd)
					
	 				cv.append(q);
					
		 				
						}
 				main.append(cv);
 				ff -= 4;
 				}
		    },
		    error       : function(request, status, error) {
 				alert("실패")
		    }	
			
		 	   
		});
		
	})
	
	
	
	
			// for fav
			$(document).on('click', '.fa-heart', function(e){
				
				var pno = $(this).text()
				
				if($(this).hasClass('fav')){						
					$.ajax({
						url: '/member/'+pno+'/delike',
						type: 'get',
						success: function(){
							$(e.target).removeClass('fav');
						}
						
					});	
				}
				else if(!$(this).hasClass('fav')){		
					$.ajax({
						url: '/member/'+pno+'/like',
						type: 'get',
						success: function(){
							$(e.target).addClass('fav');
						}
						
					});
				}
			});
			
			

	
	

		
	
	
	
	
	</script>
</body>
