<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<script src="/resources/js/inc/profile.js"></script>    
<link href="/resources/css/inc/profile.css" rel="stylesheet" />
<div class="modal">
   <div class="modal-content">
    <span class="close-button">&times;</span>
    <div class="head">
        <img alt="프로필 사진" src='<spring:url value="/sellent/profile/"/>${sessionScope.member.id }/${sessionScope.member.photo}' name="photo" class="profile">
        <div class="nameTalk">
            <a name="nickname">${sessionScope.member.nickname }</a>
            <img alt="message" src="/resources/images/speech-bubble.png">
        </div>
        <div class="intro"  name="simple_introduction">${sessionScope.member.simple_introduction }</div>
    </div>
    <div class="introduce1">
        <div class="title"><a>○</a><a>자기소개</a></div>
        <div class="introContent " name="detail_introduction">${sessionScope.member.detail_introduction }</div>
    </div>
    <div class="technic">
        <div class="title"><a>○</a><a>보유기술</a></div>
        <div class="techContent" name="skill">
        <c:forEach var="result" items="${sessionScope.skill}">
        <a class="techname">${result.name }</a>
        </c:forEach>
        </div>
    </div>
    <div class="bestBanner">
        <div class="bannerTitle"><a>BEST5</a></div>
        <div class="bestPic">
            <img alt="best5" src="/resources/images/img2.jpg" class="bestSlides">
            <img alt="best5" src="/resources/images/img5.jpg" class="bestSlides">
            <img alt="best5" src="/resources/images/img3.jpg" class="bestSlides">
            <img alt="best5" src="/resources/images/img4.jpg" class="bestSlides">
            <img alt="best5" src="/resources/images/img5.jpg" class="bestSlides">
        </div>
    </div>
   </div>
</div>
