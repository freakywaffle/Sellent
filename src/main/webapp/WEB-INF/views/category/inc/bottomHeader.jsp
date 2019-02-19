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
				<c:forEach var="ct" items="${CtList }">
				<li class="ct-name">
					<div>${ct[0].parentName}</div>
					<div class="header-sub-category hidden">
						<div>
							<c:forEach var="sc" items="${ct }">
								<a href="${ct[0].parentName }?sub=${sc.name }">${sc.name }</a>
							</c:forEach>
						</div>
					</div>
				</li>
				</c:forEach>
			</ul>
		</li>
		<li class="arrow visual-hidden">&gt;</li>
	</ul>
</section>