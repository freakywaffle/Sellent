<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>    
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- header -->
	<tiles:insertAttribute name="header"/>
	
	<div id="center">
	
		<main id="main">
			<section class="content">
				<!-- main -->
				<tiles:insertAttribute name="main"/>
			</section>
		</main>
	</div>
	
	<!-- footer -->
	<tiles:insertAttribute name="footer"/>
</body>
</html>