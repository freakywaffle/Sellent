<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 구글 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Jquery -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- Jquery UI -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
</head>
<body>
	<div id="content-container">
		<!-- header -->
		<tiles:insertAttribute name="header"/>
		
		<div id="center">
		
			<!-- aside -->
			<tiles:insertAttribute name="aside"/>
			
			<section class="content">	
			
				<!-- topContent -->
				<tiles:insertAttribute name="topContent"/>
			
				<!-- main -->
				<tiles:insertAttribute name="main"/>
	
			</section>
		</div>
	</div>
	<!-- footer -->
	<tiles:insertAttribute name="footer"/>
</body>
</html>