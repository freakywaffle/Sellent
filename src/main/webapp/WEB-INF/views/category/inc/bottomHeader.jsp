<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>  
<tiles:importAttribute name="CtList"/>
<link href="/resources/css/category/inc/bottomHeader.css" rel="stylesheet"/>
<script src="/resources/js/category/inc/bottomHeader.js"></script>
<section class="bottom-header">
	<ul>
		<li class="arrow visual-hidden">&lt;</li>
		<li class="ct-menu">
			<ul>
				<c:set var="chk" value="0" />
				<c:forEach var="ct" items="${CtList }" varStatus="idx">
					<c:if test="${idx.index == 4}">
						<c:set var="chk" value="1" />
					</c:if>
					<c:if test="${chk == 0}">
						<li class="ct-name">
							<div><a href="/category/${ct[0].parentName }">${ct[0].parentName}</a></div>
							<div class="header-sub-category hidden">
								<div>
									<c:forEach var="sc" varStatus="idx" items="${ct }">
										
										
											<a href="/category/${ct[0].parentName }?sub=${sc.name }">${sc.name }</a>
										
									</c:forEach>
								</div>
							</div>
						</li>
					</c:if>
					<c:if test="${chk == 1}">
						<li class="ct-name mobile-hidden">
							<div><a href="/category/${ct[0].parentName }">${ct[0].parentName}</a></div>
							<div class="header-sub-category hidden">
								<div>
									<c:forEach var="sc" varStatus="idx" items="${ct }">
										
										
											<a href="/category/${ct[0].parentName }?sub=${sc.name }">${sc.name }</a>
										
									</c:forEach>
								</div>
							</div>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</li>
		<li class="arrow visual-hidden">&gt;</li>
	</ul>
</section>