<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>    
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
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