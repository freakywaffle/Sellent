<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spr" uri="http://www.springframework.org/tags" %>
     
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

        <div class="loading">
            <img style="width: 170px; top:620px; position: fixed;"src="http://a.top4top.net/p_1990j031.gif" alt="Loading">
       

	<div class="main-container h-100" alt="loading">
		<div class="main-head">
			<h1>찜한 서비스</h1>
		</div>
		<div class="m-felx flex h-cal">
			<div class="aside flex" style="height: 70px!important">
				<div class="main-list">
					<ul>
						<li><a href="#" class="a-color p-catrgory"><i class="fa fa-caret-right"></i>전체카테고리</a></li>
					</ul>
					<ul class="aside-lsit">
						<c:forEach var="p" items="${PC_list}">
						<li><a href="#" class="a-color p-catrgory">${p.parent_category} (${p.cnt})</a></li>
						</c:forEach>
						
					</ul>
				</div>
			</div>
			<div class="main h-100">
				
		
			<c:forEach var="a" items="${likeList}" varStatus="index">
				
				<c:if test="${index.count%4 eq 1}">
				
					<div class="content-box flexa">
				</c:if>
				
				<div class="content bbb" style="">
						<a href="/category/${a.parentCategory}/${a.no}">
							<div class="img-box bbb">
								<div class="img"><img style="width: 100%; height: 100%" src="<spr:url value="/sellent/upload/"/>${a.no}/${a.thumbnail}"  onerror="this.src='/sellent/default/기본.gif'"/></div>
								<div class="profile"><img style="height: 45px; border-radius: 500px"  src="<spr:url value="/sellent/profile"/>/${a.writerId}/${a.photo}"/></div>
							</div>
						</a>
						<div class="text">
							<a href="/category/${a.parentCategory}/${a.no}">
								<div class="writer-id">${a.writerId}</div>
								<div class="title" style="height: 40px">${a.title}</div>
								<div class="price"><fmt:formatNumber value="${a.price}" type="currency" currencySymbol="￦"/></div>
							</a>
							<div class="flex">
								<div class="product">
										<div class="fornt">
											<div class="img-wrap">
												<i class="fa fa-heart fav" style="left: 10px; top: 3px;"><div class="hidden">${a.no}</div></i>
											</div>
										</div>
									</div>
								<div class="star flex" > <div class="star-ratings-css">
  <div class="star-ratings-css-top" style="width: ${a.avgStarPoint*25}%"><span><i class='fa fa-star fa-fw'></i></span><span><i class='fa fa-star fa-fw'></i></span><span><i class='fa fa-star fa-fw'></i></span><span><i class='fa fa-star fa-fw'></i></span><span><i class='fa fa-star fa-fw'></i></span></div>
  <div class="star-ratings-css-bottom"><span><i class='far fa-star fa-fw'></i></span><span><i class='far fa-star fa-fw'></i></span><span><i class='far fa-star fa-fw'></i></span><span><i class='far fa-star fa-fw'></i></span><span><i class='far fa-star fa-fw'></i></span></div>
</div>
 (${a.reviewCnt})</div>
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
				var t = 0;
 				for(var j=0; j<qq; j++) {
 					
	 				
 					var cv = $("<div class='content-box flexa'>"); 	
	 				
 					if(ff<4)
 						size=ff;
 					
 					for(var i=0; i <size; i++) {
				
	 				var aaaa = b[t].price;
	 				var price = aaaa.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
					
								
					var title = b[t].title
					
					 
	 				if(title.length >=27)
					 title = title.substring(0,27)+"..."
	 					
	 				
	 				var c = "<spr:url value='/sellent/upload/'/>"+b[t].no+"/"+b[t].thumbnail
					var profile = "<spr:url value='/sellent/profile'/>/" + b[t].writerId +"/"+ b[t].photo
						
 					var q = $("<div class='content bbb'></div>"); 	
					
		 			var cc = $("<a href='/category/"+b[t].parentCategory + "/" + b[t].no+"'><div class='img-box bbb'><div class='img'><img style='width: 100%; height: 100%' src='"+c+"'/></div><div class='profile'><img style='height: 45px;' src='"+ profile +"'/></div></div></a>")
				
		 			
		 			var dd = $("<div class='text'></div>")
		 			var qqq = $("<a href='/category/"+b[t].parentCategory + "/" + b[t].no+"'></a>")
		 			var www = $("<div class='writer-id'>"+b[t].writerId+"</div>")
		 			var eee = $("<div class='title' style='height: 40px'>"+title+"</div>")
		 			var rrr = $("<div class='price'>"+"￦"+price+"</div>")
		 			
		 			var flex = $("<div class='flex'></div>")
					var product = $("<div class='product'></div>")
					var star = $("<div class='star flexa'>"+"<div class='star-ratings-css'> <div class='star-ratings-css-top' style='width: "+b[t].avgStarPoint*25+"%'><span><i class='fa fa-star fa-fw'></i></span><span><i class='fa fa-star fa-fw'></i></span><span><i class='fa fa-star fa-fw'></i></span><span><i class='fa fa-star fa-fw'></i></span><span><i class='fa fa-star fa-fw'></i></span></div><div class='star-ratings-css-bottom'><span><i class='far fa-star fa-fw'></i></span><span><i class='far fa-star fa-fw'></i></span><span><i class='far fa-star fa-fw'></i></span><span><i class='far fa-star fa-fw'></i></span><span><i class='far fa-star fa-fw'></i></span></div></div>"+"("+b[t].reviewCnt+")"+"</div>")
					
					var fornt = $("<div class='fornt'></div>")
					var imgWrap = $("<div class='img-wrap'></div>")
					var heart = $("<i class='fa fa-heart fav' style='left: 10px; top: 3px;'><div class='hidden'>"+b[t].no+"</div></i>")
					
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
					t++
		 				
						}
 				main.append(cv);
 				ff -= 4;
 				}
		    },
		    error       : function(request, status, error) {
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
	 </div>
</body>
