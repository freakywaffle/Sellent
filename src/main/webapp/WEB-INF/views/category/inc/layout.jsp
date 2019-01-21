<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/resources/js/category/layout.js" type="text/javascript"></script>

<link href="/resources/css/common.css" rel="stylesheet"/>
<link href="/resources/css/category/center.css" rel="stylesheet"/>
<title><tiles:getAsString name="title" /></title>

</head>

<body>
	<header id="header">
		<!-- top header-->
		<tiles:insertAttribute name="topHeader"/>
		<!-- bottom-header-->
		<tiles:insertAttribute name="bottomHeader"/>
	</header>

	<div id="center">
		<!-- category-->
		<tiles:insertAttribute name="aside"/>
		<!-- main-->
		<tiles:insertAttribute name="main"/>
		<!-- floating bar-->
		<tiles:insertAttribute name="floatingBar"/>
	</div>
	<!--footer-->
	<tiles:insertAttribute name="footer"/>
</body>

</html>