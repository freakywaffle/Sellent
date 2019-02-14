<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


<title><tiles:getAsString name="title" /></title>

</head>

<body>

	<!-- top header-->
	<tiles:insertAttribute name="mainHeader"/>

	<tiles:insertAttribute name="mainMain"/>
	
	<tiles:insertAttribute name="footer"/>
</body>

</html>