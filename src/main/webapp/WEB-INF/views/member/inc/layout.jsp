<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/common.css" rel="stylesheet"/>
<link href="/resources/css/center.css" rel="stylesheet"/>
<title>Insert title here</title>
</head>
<body>
	<header id="header">
	<!-- header -->
	<tiles:insertAttribute name="topHeader"/>
	<tiles:insertAttribute name="bottomHeader"/>
	</header>
 	
	<div id="center">
	<!-- aside -->
	<tiles:insertAttribute name="aside"/>
	<tiles:insertAttribute name="main"/>
	<tiles:insertAttribute name="floatingBar"/> 
	</div>
	
	<!-- floating -->
	
	
	<!-- footer -->
	<tiles:insertAttribute name="footer"/>
</body>
</html>