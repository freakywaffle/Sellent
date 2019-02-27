<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  
  
<link href="/resources/css/main/mainMain.css" rel="stylesheet"/>
<link href="/resources/css/common.css" rel="stylesheet"/>
<script src="/resources/js/main/mainMain.js"></script>
<main id="main">
      <div class="banner">
		<a href="../join"><img class="mySlides" alt="" src="/resources/images/image11.jpg" class="myslides"/></a>

		<c:forEach items="${bannerList }" var="banner">
			
			<img class="mySlides myslides" src='<spring:url value="/sellent/admin/"/>${banner.image}' />
			
		</c:forEach>

      </div>
      <div class="main-icones">
        <div class="top-icon">
           <div class="left-top-icon">
              <ul>
                 <li><a href="/category/IT개발"><img src="/resources/images/it.png" alt=""></a></li>
                  <li><a href="/category/번역"><img src="/resources/images/translate.png" alt=""></a></li>
              </ul>
              <ul class="left-top-icontitle">
                  <li>IT개발</li>
                  <li>번역</li>
               </ul>
           </div>
           <div class="right-top-icon">
               <ul>
                  <li><a href="/category/디자인"><img src="/resources/images/design.png" alt=""></a></li>
                  <li><a href="/category/영상·애니"><img src="/resources/images/media.png" alt=""></a></li>
               </ul>
               <ul class="right-top-icontitle">
                     <li>디자인</li>
                     <li>영상·애니</li>
               </ul>
            </div>
        </div>
        <div class="bottom-icon">
            <div class="left-bottom-icon">
               <ul>
                  <li><a href="/category/이벤트"><img src="/resources/images/event.png" alt=""></a></li>
                  <li><a href="/category/레슨"><img src="/resources/images/lesson.png" alt=""></a></li>
               </ul>
               <ul class="left-bottom-icontitle">
                     <li>이벤트</li>
                     <li>레슨</li>
               </ul>
            </div>
            <div class="right-bottom-icon">
                <ul>
                   <li><a href="/category/비즈니스"><img src="/resources/images/business.png" alt=""></a></li>
                   <li><a href="/category/음악"><img src="/resources/images/music.png" alt=""></a></li>
                </ul>
                <ul class="right-bottom-icontitle">
                     <li>비즈니스</li>
                     <li>음악</li>
                </ul>
             </div>
         </div>
      </div>
      <div class="hotsellent">
         <div class="hotsellent-title">Hot Sellent</div>
         <div class="hotsellent-image">
            <ul class="hotsellent-image-top">
	            <c:forEach var="sc" items="${topSellent }">
	               <li><img src='<spring:url value="/sellent/profile/"/>${sc.id}/${sc.photo}'alt=""/></li>
	             </c:forEach>
            </ul>
            <ul class="hotsellent-image-bottom">
                 <c:forEach var="sc" items="${topSellent2 }">
	               <li><img src='<spring:url value="/sellent/profile/"/>${sc.id}/${sc.photo}'alt=""/></li>
            	 </c:forEach>
            </ul>
         </div>
      </div>
   </main>