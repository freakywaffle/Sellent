<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<link href="/resources/css/category/content/reg.css" rel="stylesheet"/>
<link href="/resources/css/category/content/edit.css" rel="stylesheet"/>
<script src="/resources/js/category/content/reg.js"></script>
<section id="main">
	<form class="reg-form" action="edit" method="post" enctype="multipart/form-data">
		<div class="step step1">
			<div class="sell-toggle-form">
				<h3>판매희망</h3>
				<div class="sell-radio">
					<c:if test="${map.product.sellCheck == 0 }">
						<div class="radio-bt selected"></div>
						<input class="sell-chk" type="radio" checked="checked" value="0" name="sellCheck"/>
						<label>비판매</label>
						<div class="radio-bt"></div>
						<input class="sell-chk" type="radio" value="1" name="sellCheck"/>
						<label>판매</label>
					</c:if>
					<c:if test="${map.product.sellCheck == 1 }">
						<div class="radio-bt"></div>
						<input class="sell-chk" type="radio" value="0" name="sellCheck"/>
						<label>비판매</label>
						<div class="radio-bt selected"></div>
						<input class="sell-chk" type="radio" checked="checked" value="1" name="sellCheck"/>
						<label>판매</label>
					</c:if>
				</div>
				<div class="toggle-btn">
					<div class="toggle-move"></div>
				</div>
			</div>
			<div class="title">
				<h3>제목</h3>
				<div>
					<textarea rows="5" cols="30" name="title">${map.product.title }</textarea>
					<div class="txt-cnt">
						<span>0</span>/100byte
					</div>
				</div>
			</div>
			<div class="category">
				<h3>카테고리</h3>
				<div class="parent-category">
					<label>상위카테고리</label>
					<select id="parentCategory" name="parentCategory">
						<option>선택해주세요</option>
						<c:forEach var="c" items="${parentCategory}">
							<c:if test="${c.name == map.product.parentCategory }">
								<option class="parentCategory" selected="selected">${c.name}</option>
							</c:if>
							<c:if test="${c.name != map.product.parentCategory }">
								<option class="parentCategory">${c.name}</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
				<div class="sub-category">
					<label>하위카테고리</label>
					<select name="subCategory">
						<option>선택해주세요</option>						
						<c:forEach var="s" items="${subCategory}">
							<c:if test="${s.name == map.product.subCategory }">
								<option class="${s.parentName} hidden aa" selected="selected">${s.name}</option>
							</c:if>
							<c:if test="${s.name == map.product.subCategory }">
								<option class="${s.parentName} hidden aa">${s.name}</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
		<div class="step step2">
			<div>
				<h3>기본옵션</h3>
				<div class="basic">
					<div class="table">
						<div class="row">
							<div>
								<label>설명</label>
							</div>
							<textarea class="simple-content" name="simpleContent">${map.product.simpleContent }</textarea>
						</div>
					</div>
					<div class="table option">
						<div class="row">
							<label>가격</label>
							<div class="price">
								<label>\</label> 
								<input type="number" name="price" placeholder="가격을 입력하세요" value="${map.product.price }"/>
							</div>
							<label>수정횟수</label>
							<div class="edit-cnt select">
								<input type="number" min="0" value="${map.product.editCnt }"/>
								<input type="hidden" name="editCnt" value="${map.product.editCnt }"/>
								<label>회</label>
							</div>
							<label>작업기간</label>
							<div class="term select">
								<input type="number" min="0" value="${map.product.duration }"/>
								<input type="hidden" name="duration" value="${map.product.duration }"/>
								<label>일</label>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="step step3">
			<div>
				<h3>서비스 설명</h3>
				<div class="editor">
					<textarea rows="5" cols="10" name="detailContent">${map.product.detailContent }</textarea>
					<div class="txt-cnt">
						<span>0</span>/500byte
					</div>
				</div>
			</div>
			<div>
				<h3>이미지 첨부</h3>
				<div>
					<div class="up-images">
						<img src='<spring:url value="${map.root }"/>${map.product.no}/${map.product.thumbnail}'/>
					</div>
					<input type="file" class="openfolder hidden" multiple="multiple"/>
					<input type="hidden" name="thumbnail" />
					<div class="img-list">
						<ul>
							<c:forEach var="f" items="${map.files }">
								<li><img src='<spring:url value="${map.root }"/>${map.product.no}/${f.saveName}'/></li>
							</c:forEach>
						</ul>
					</div>
					
				</div>
			</div>
		</div>
		<div class="bts">
			<input class="cancel" type="button" value="취소"/>
			<input class="submit" type="submit" value="완료"/>				
		</div>
	</form>
	
	<script>

	 	$("#parentCategory").change(function() {
	 		var parentName = "."+$(this).val()
	 		for(var i=0; i<$(".aa").length; i++)
		 		if(!$(".aa").eq(i).hasClass("hidden"))
		 			$(".aa").eq(i).addClass("hidden")
	 		$(parentName).removeClass("hidden");
	 		});	

	
	 	//이미지 업로드
	 	var openBt = $('.openfolder');
		var preview = $('.img-list ul');
		
		openBt.on('change', function() {
			var fileList = openBt.prop('files');
			
			var thumbnail = $('input[name="thumbnail"]');
			thumbnail.val(fileList[0].name);
			
			var formData = new FormData();
			//업로드할 이미지 리스트화
			for(var i=0;i<fileList.length;i++){
				var li = $('<li><img/></li>');

				//이미지 업로드
				formData.append('img', fileList[i]);
				
			}
			
			$.ajax({
		        url: 'imageUp',
		        data: formData,
		        processData: false,
		        contentType: false, 
		        type: 'POST',

		        success: function (data) {
		        	
		        	var json = jQuery.parseJSON(data);
		        	
		        	for(var i = 0; i<json.length; i++){
		        		var li = $('<li></li>');
		        		var preImg = $('<img/>');
		        		preImg.attr('src', '<spring:url value="/sellent/upload/"/>'+json[i].productNo+'/'+json[i].saveName);
		        		console.log(preImg.attr('src'));
		        		
		        		li.append(preImg);
		        		preview.append(li);
		        	}
		        	preview.find('img').eq(0).trigger('click');
		        }
		    });
			
		});
		 
	</script>
	
</section>