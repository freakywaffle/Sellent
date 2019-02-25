<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>  
<tiles:importAttribute name="syskill"/>
<tiles:importAttribute name="symember"/>
<script src="/resources/js/inc/profile.js"></script>    
<link href="/resources/css/inc/profile.css" rel="stylesheet" />
<div class="modal">
   <div class="modal-content">
    <span class="close-button2">&times;</span>
    <div class="head">
        <img alt="프로필 사진" src='<spring:url value="/sellent/profile/"/>${member.id}/${member.photo}' name="photo" class="profile"  onerror="this.src='/resources/images/profile.png'">
        <div class="nameTalk">
            <a name="nickname">${symember.nickname }</a>
            <img alt="message" src="/resources/images/speech-bubble.png">
        </div>
        <div class="intro"  name="simple_introduction">${symember.simple_introduction }</div>
    </div>
    <div class="introduce1">
        <div class="title"><a>○</a><a>자기소개</a></div>
        <div class="introContent " name="detail_introduction">${symember.detail_introduction }</div>
    </div>
    <div class="protechnic">
        <div class="title"><a>○</a><a>보유기술</a></div>
        <div class="techContent" name="skill">
        <c:forEach var="result" items="${syskill}">
        <a class="techname">${result.name }</a>
        </c:forEach>
        </div>
    </div>
    <div class="bestBanner">
        <div class="bannerTitle"><a>BEST5</a></div>
        <div class="bestPic">
        	<c:forEach var="n" items="${sessionScope.photo }">
        	  <img alt="best5" src='<spring:url value="/sellent/upload/"/>${n.no}/${n.thumbnail}'  onerror="this.src='/resources/images/pro404err.gif'" class="bestSlides">      	
        	</c:forEach>
        </div>
    </div>
   </div>
</div>
