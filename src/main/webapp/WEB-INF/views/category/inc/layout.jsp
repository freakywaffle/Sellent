<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- header -->
	<tiles:insertAttribute name="header"/>
	
	<!-- nav -->
	<tiles:insertAttribute name="nav"/>
	
	<!-- aside -->
	<tiles:insertAttribute name="aside"/>
	
	<!-- main -->
	<tiles:insertAttribute name="main"/>
	
	<!-- floating -->
	<tiles:insertAttribute name="floating"/>
	
	<!-- footer -->
	<tiles:insertAttribute name="footer"/>
</body>
</html>