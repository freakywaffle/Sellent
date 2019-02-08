<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/resources/css/category/content/reg.css" rel="stylesheet"/>
<script src="/resources/js/category/content/reg.js"></script>
<section id="main">
	<div>
		<ul class="navi">
			<li><a class="nav-1 during">STEP1</a></li>
			<li><a class="nav-2">STEP2</a></li>
			<li><a class="nav-3">STEP3</a></li>
		</ul>
	</div>
	<form class="reg-form" action="reg" method="post">
		<div class="step step1">
			<div class="sell-toggle-form">
				<h3>판매희망</h3>
				<div class="sell-radio">
					<div class="radio-bt selected"></div>
					<input class="sell-chk" type="radio" checked="checked" value="0" name="sellCheck"/>
					<label>비판매</label>
					<div class="radio-bt"></div>
					<input class="sell-chk" type="radio" value="1" name="sellCheck"/>
					<label>판매</label>
				</div>
				<div class="toggle-btn">
					<div class="toggle-move"></div>
				</div>
			</div>
			<div class="title">
				<h3>제목</h3>
				<div>
					<textarea rows="5" cols="30" name="title"></textarea>
					<div class="txt-cnt">
						<span>0</span>/100byte
					</div>
				</div>
			</div>
			<div class="category">
				<h3>카테고리</h3>
				<div class="parent-category">
					<label>상위카테고리</label>
					<select name="parentCategory">
						<option>선택해주세요</option>
						<option>상위1</option>
						<option>상위2</option>
						<option>상위3</option>
						<option>상위4</option>
					</select>
				</div>
				<div class="sub-category">
					<label>하위카테고리</label>
					<select name="subCategory">
						<option>선택해주세요</option>
						<option>하위1</option>
						<option>하위2</option>
						<option>하위3</option>
						<option>하위4</option>
					</select>
				</div>
			</div>
		</div>
		<div class="step step2 hidden">
			<div>
				<h3>기본옵션</h3>
				<div class="basic">
					<div class="table">
						<div class="row">
							<div>
								<label>설명</label>
							</div>
							<textarea class="simple-content" name="simpleContent"></textarea>
						</div>
					</div>
					<div class="table option">
						<div class="row">
							<label>가격</label>
							<div class="price">
								<label>\</label> 
								<input type="number" name="price" placeholder="가격을 입력하세요"/>
							</div>
							<label>수정횟수</label>
							<div class="edit-cnt select">
								<select>
									<option>선택</option>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>직접입력</option>
								</select>
								<input type="number" min="0" placeholder="직접입력"/>
								<label>회</label>
								<input type="hidden" name="editCnt"/>
							</div>
							<label>작업기간</label>
							<div class="term select">
								<select>
									<option>선택</option>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>직접입력</option>
								</select>
								<input type="number" min="0" placeholder="직접입력"/>
								<label>일</label>
								<input type="hidden" name="duration"/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="step step3 hidden">
			<div>
				<h3>서비스 설명</h3>
				<div class="editor">
					<textarea rows="5" cols="10" name="detailContent"></textarea>
					<div class="txt-cnt">
						<span>0</span>/500byte
					</div>
				</div>
			</div>
			<div>
				<h3>이미지 첨부</h3>
				<div>
					<div class="up-images">
					</div>
					<input type="file" class="openfolder hidden"/>
					<div class="img-list">
						<ul>
							<li><img src="/resources/images/650_400/post_img_650_400.png" /></li>
							<li><img src="/resources/images/650_400/post_img2_650_400.png" /></li>
							<li><img src="/resources/images/650_400/post_img4_650_400.png" /></li>
							<li><img src="/resources/images/650_400/post_img5_650_400.png" /></li>
						</ul>
					</div>
					
				</div>
			</div>
		</div>
		<div class="bts">
			<input class="prev hidden" type="button" value="이전"/>
			<input class="next" type="button" value="다음"/>
			<input class="submit hidden" type="submit" value="완료"/>				
		</div>
	</form>
	
</section>