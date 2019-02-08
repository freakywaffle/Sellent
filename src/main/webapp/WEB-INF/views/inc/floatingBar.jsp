<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!--link href="/resources/css/floatingBar.css" rel="stylesheet"/-->
<!--div>
	
	<div class="floating-bar fixed">
		<div class="floating-item">찜</div>
		<div class="floating-item">가이드</div>
		<div class="floating-item">고객센터</div>
		<div class="floating-item move-top">△top</div>
		<div class="floating-item hidden mobile-block open">+</div>
	</div>
	
</div-->	

<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	
	<!-- Optional JavaScript -->
	

	<!-- 슬라이드 -->
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>  
	
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> 
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
    
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="../../resources/css/guide2.css">

	<div>
		

	
	<div id="modal" class="hidden" style="position: fixed; width: 100%; height: 100%; display: flex; align-items: center; z-index: 998; top:0; left: 0;">
		<div id="ccc" style="width: 100%; height: 100%; background: rgba(0,0,0,.5) ; display: flex; align-items: center; z-index: 999">
			<div style="margin: auto;">
			<img id="vv" src="../../resources/images/aa.png">
		</div>
	</div>
	</div>
	
     
	<div id="guide" class="guide-tab hidden"  style="position: fixed; z-index: 9999; top: 0px;" >
		<h1 class="hidden">Tabs Header</h1>
		<div class="tab_container">
			<input id="tab1" type="radio" name="tabs" checked>
			<label for="tab1"><span>자주 묻는 질문</span></label>

			<input id="tab2" type="radio" name="tabs">
			<label for="tab2"><span>고객센터</span></label>

			<input id="tab3" type="radio" name="tabs">
			<label for="tab3"><span>안내</span></label>
			
			<label class="close-label"><i class="fa fa-close 999"></i></label>
			
			
			<section id="content1" class="tab-content">
				<h3 class="hidden">Headline 1</h3>
				<div id="wrap">
				       <div id="container">
				         <div id="slide" class="">
				           <div id="first" class="box y-scroll">
				           
				           
				           		<div class="search-box">
		      		<h1>문의 전 확인</h1>
		      		<h5>아래 검색창을 통해 원하시는 답변을 빠르게 찾아 보실수 있습니다.</h5>
			      	<input class="block search-bar" type="text" name="search" placeholder="검색어를 입력해주세요"></input>
			      	<div>
				      	<i class="fa fa-search"></i>
				      	<i class="fa fa-close text-del"></i>
			      	</div>
		      	</div>
		      			      	<!-- panel -->
		      	<div style="height: calc(100% - 176px);">
	      		 	<div class="wrapper center-block">
					    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					    
					    
					  <div class="panel panel-default">
					      <div class="panel-heading" role="tab" id="headingOne">
					        <h4 class="panel-title">
					          <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
					            	이용안내
					          </a>
					        </h4>
					      </div>
					      <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
					        <div class="panel-body">
					          <ul class="dd">
					          	<li><a href="#" class="tab1">크몽은 어떤 사이트 인가요?</a></li>
					          	<li><a href="#" class="tab1">고객센터 이용시간이 궁금합니다.</a></li>
					          	<li><a href="#" class="tab1">휴대폰으로 크몽을 할수 있나요?</a></li>
					          
					          </ul>
					        </div>
					      </div>
					    </div>
					    
					    <div class="panel panel-default">
					      <div class="panel-heading" role="tab" id="headingTwo">
					        <h4 class="panel-title">
					          <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					            가입/인증/탈퇴
					          </a>
					        </h4>
					      </div>
					      <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
					        <div class="panel-body">
					          <ul class="dd">
					          <li><a href="#">회원가입은 어떻게 하나요?</a></li>
					          	<li><a href="#">외국인도 회원가입 할 수 있나요?</a></li>
					          	<li><a href="#">ID를 여러개 사용 할 수 있나요?</a></li>					          
					          </ul>
					        </div>
					      </div>
					    </div>
					    
					    
					    <div class="panel panel-default">
					      <div class="panel-heading" role="tab" id="headingThree">
					        <h4 class="panel-title">
					          <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					            로그인/계정정보
					          </a>
					        </h4>
					      </div>
					      <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
					        <div class="panel-body">
					          333333333333333333333333
					        </div>
					      </div>
					    </div>
					     
					    
					    <div class="panel panel-default">
					      <div class="panel-heading" role="tab" id="headingOne">
					        <h4 class="panel-title">
					          <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
					            서비스 구매하기
					          </a>
					        </h4>
					      </div>
					      <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
					        <div class="panel-body">
					          1111111111111111111111111
					        </div>
					      </div>
					    </div>
					    
					    
					    <div class="panel panel-default">
					      <div class="panel-heading" role="tab" id="headingTwo">
					        <h4 class="panel-title">
					          <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					            전문가에게 문의하기
					          </a>
					        </h4>
					      </div>
					      <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
					        <div class="panel-body">
					          22222222222222222222222222222222222222222
					        </div>
					      </div>
					    </div>
					    
					    
					    <div class="panel panel-default">
					      <div class="panel-heading" role="tab" id="headingThree">
					        <h4 class="panel-title">
					          <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					           서비스 결제하기
					          </a>
					        </h4>
					      </div>
					      <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
					        <div class="panel-body">
					          333333333333333333333333
					        </div>
					      </div>
					    </div>
					     
					    
					    <div class="panel panel-default">
					      <div class="panel-heading" role="tab" id="headingOne">
					        <h4 class="panel-title">
					          <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
					           구매 확정하기
					          </a>
					        </h4>
					      </div>
					      <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
					        <div class="panel-body">
					          1111111111111111111111111
					        </div>
					      </div>
					    </div>
					    
					    
					    <div class="panel panel-default">
					      <div class="panel-heading" role="tab" id="headingTwo">
					        <h4 class="panel-title">
					          <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					            할인수단
					          </a>
					        </h4>
					      </div>
					      <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
					        <div class="panel-body">
					          22222222222222222222222222222222222222222
					        </div>
					      </div>
					    </div>
					    
					    
					    <div class="panel panel-default">
					      <div class="panel-heading" role="tab" id="headingThree">
					        <h4 class="panel-title">
					          <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					           영수증 발행
					          </a>
					        </h4>
					      </div>
					      <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
					        <div class="panel-body">
					          333333333333333333333333
					        </div>
					      </div>
					    </div>
					     
					    
					    <div class="panel panel-default">
					      <div class="panel-heading" role="tab" id="headingOne">
					        <h4 class="panel-title">
					          <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
					            전문가 평가하기
					          </a>
					        </h4>
					      </div>
					      <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
					        <div class="panel-body">
					          1111111111111111111111111
					        </div>
					      </div>
					    </div>
					    
					    
					    <div class="panel panel-default">
					      <div class="panel-heading" role="tab" id="headingTwo">
					        <h4 class="panel-title">
					          <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					           서비스 후기 작성
					          </a>
					        </h4>
					      </div>
					      <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
					        <div class="panel-body">
					          22222222222222222222222222222222222222222
					        </div>
					      </div>
					    </div>
					    
					    
					    <div class="panel panel-default">
					      <div class="panel-heading" role="tab" id="headingThree">
					        <h4 class="panel-title">
					          <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					            작업물 수정 요청
					          </a>
					        </h4>
					      </div>
					      <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
					        <div class="panel-body">
					          333333333333333333333333
					        </div>
					      </div>
					    </div>
					     
					    
					    <div class="panel panel-default">
					      <div class="panel-heading" role="tab" id="headingOne">
					        <h4 class="panel-title">
					          <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
					            구매 취소/환불
					          </a>
					        </h4>
					      </div>
					      <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
					        <div class="panel-body">
					          1111111111111111111111111
					        </div>
					      </div>
					    </div>
					    
					    
					    <div class="panel panel-default">
					      <div class="panel-heading" role="tab" id="headingTwo">
					        <h4 class="panel-title">
					          <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					            분쟁 조정
					          </a>
					        </h4>
					      </div>
					      <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
					        <div class="panel-body">
					          22222222222222222222222222222222222222222
					        </div>
					      </div>
					    </div>
					    
					    
					    <div class="panel panel-default">
					      <div class="panel-heading" role="tab" id="headingThree">
					        <h4 class="panel-title">
					          <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					            프로모션
					          </a>
					        </h4>
					      </div>
					      <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
					        <div class="panel-body">
					          333333333333333333333333
					        </div>
					      </div>
					    </div>
					    
					    <div class="panel panel-default">
					      <div class="panel-heading" role="tab" id="headingThree">
					        <h4 class="panel-title">
					          <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					            페널티 제도
					          </a>
					        </h4>
					      </div>
					      <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
					        <div class="panel-body">
					          333333333333333333333333
					        </div>
					      </div>
					    </div>
					    
					    
					  </div>
  					</div>
		      	</div>
				           
				           
				           
				           
				           </div>
				           
				           
				           
				           
				           <div id="second" class="box">
				         	  	<div id="taba3" class="tab">들어가</div>
							    <div id="taba4" class="tab">저리가</div>
							    <div id="taba5" class="tab">사라져</div>
				           	우힣우힣우히웋이후이훙휭휭후이ㅜ힝;휭휘웋이후이휭후이후이휭후이ㅜ이후이후이후히
				           
				           
				           
				           
				           </div>
				         </div>
				       </div>
				     </div>
		      	
			</section>





			<section id="content2" class="tab-content">
				<h3 class="hidden">Headline 2</h3>
				<div class="question">
					<h1>안녕하세요, Sellent 고객센터 입니다.</h1>
					<h5>문의내용을 상세히 작성하여 보내주시면, 입력된 이메일 주소을 통해 빠르게 답변해드리도록 하겠습니다.</h5>
				</div>
				<div class="question-box">
					<h6>이메일</h6>
			      	<input class="block e-mail-bar" type="text" name="e-mail" placeholder="이메일 땡겨오기"></input>
					<h6>제목</h6>
			      	<input class="block title-bar" type="text" name="title" placeholder="제목을 작성해주세요."></input>
					<h6>내용</h6>
					<div class="area">
						<textarea rows="9" cols="" placeholder="문의 내용을 작성해주세요."></textarea>
					</div>
					<div class="file-box">
						<!-- 
						<div class="file flex">
							<div style="position:relative; height: 88.5px; width: 25%; border: 1px solid black; border-radius: 25px;">
								<i class="fa fa-times-circle" style="position:absolute; right: -5px; top:-5px;"></i>
							</div>
							<div style="position:relative; height: 88.5px; width: 25%; border: 1px solid black; border-radius: 25px;">
								<i class="fa fa-times-circle" style="position:absolute; right: -5px; top:-5px;"></i>
							</div>
							<div style="position:relative; height: 88.5px; width: 25%; border: 1px solid black; border-radius: 25px;">
								<i class="fa fa-times-circle" style="position:absolute; right: -5px; top:-5px;"></i>
							</div>
							<div style="position:relative; height: 88.5px; width: 25%; border: 1px solid black; border-radius: 25px;">
								<i class="fa fa-times-circle" style="position:absolute; right: -5px; top:-5px;"></i>
							</div>
						</div>
						 -->
						
						<section class="sec sec-select" id="fileDrag">
							<span id="span">drag & drop</span>
							<section class="sec sec-list">
								<ul id="list" style="display:flex;">
								</ul>
							</section>
						</section>
							<input type="file" id="file" multiple="">
							<label class="btn file-btn" for="file">파일첨부</label>
							
							
							
							
							
					</div>
					<div style="width: 100%; height: 50px; margin-top: 20px">
						<a class="btn a">문의 하기</a>
					</div>
					
					<div>
						<ul style="padding: 10px 0px 0px 20px; list-style: initial!important;">
							<li>주말·공휴일은 답변이 늦어질 수 있습니다.</li>
							<li>파일 첨부는 최대 4개까지 가능합니다.</li>							
						</ul>
					</div>
				</div>
			</section>





			<section id="content3" class="tab-content">
				<h3 class="hidden">Headline 3</h3>
		      	<div style="width: 100%">
		      		<ul>
		      			<li style="padding: 20px; height: 100px; border: 1px solid #cdcdcd; margin-bottom: 10px;">
		      				<div class="flex" style="height: 100%;">
		      					<div style="height: 100%; width: 20%;">
		      						<img style="height: 100%; border-radius: 500px;" src="../../resources/css/aaaa.png" />
		      					</div>
		      					<div style="height: 100%; width: 80%;">
		      						<div style="height: 50%;">
										<h1 style="color: #ee3b27">Sellent
											<span style="float: right; font-size: 13px; color: #999">4일전</span>	
										</h1>				
		      						</div>
		      						<div style="height: 50%;">
		      							(회원아이디)님, Sellent에 오신 것을 환영합니다.
		      						</div>
		      					</div>
		      				</div>
		      			</li>
		      			
		      			<li style="padding: 20px; height: 100px; border: 1px solid #cdcdcd; margin-bottom: 10px;">
		      				<div class="flex" style="height: 100%;">
		      					<div style="height: 100%; width: 20%;">
		      						<img style="height: 100%; border-radius: 500px;" src="../../resources/css/aaaa.png" />
		      					</div>
		      					<div style="height: 100%; width: 80%;">
		      						<div style="height: 50%;">
										<h1 style="color: #ee3b27">Sellent
											<span style="float: right; font-size: 13px; color: #999">4일전</span>	
										</h1>				
		      						</div>
		      						<div style="height: 50%;">
		      							(회원아이디)님, Sellent에 오신 것을 환영합니다.
		      						</div>
		      					</div>
		      				</div>
		      			</li>		
		      		</ul>
		      	</div>
			</section>		
			
			
		</div>


	
	
	
	
	
	
	
	</div>	
	
	

  
  <script>
  
  /*panel*/
 
	$('.panel-collapse').on('show.bs.collapse', function () {
    $(this).siblings('.panel-heading').addClass('active');
  });

  $('.panel-collapse').on('hide.bs.collapse', function () {
    $(this).siblings('.panel-heading').removeClass('active');
  });
  
  window.addEventListener("load",function(){
	    var close = document.querySelector(".close-label");
	    var guideTab = document.querySelector("#guide");	    
	    var del = document.querySelector(".text-del");
	    var search = document.querySelector("#search");

	    close.onclick = function(){
	    	guideTab.classList.add("hidden");
	    };
	});
  
  
  

		
	  var a = $(".tab");
	  var b = $(".tab1");
	 
  
  for(var i = 0; i < a.length; i++)
  	a.eq(i).click(moveToFirst);
	
  for(var i = 0; i < b.length; i++)
	  	b.eq(i).click(moveToSecond);	  
  
	

	
	
	function moveToFirst() {
	  $("#slide").attr('class', 'move-to-first');
	  $(".tab").attr('class', 'tab');
	  $("#tab1").attr('class', 'tab selected');
	}
	
	function moveToSecond() {
	  $("#slide").attr('class', 'move-to-second');
	  $(".tab").attr('class', 'tab');
	  $("#tab2").attr('class', 'tab selected');
	}
	
	
	
 

  
  

  
  </script>

<div class="inner-fabs" id="aaaaaa">
  <div class="fab" id="fab5" data-tooltip="FAQ"><a href="#"><i class="material-icons">help</i></a></div>
  
  <div class="fab" id="fab4" data-tooltip="About"><a href="#"><i class="material-icons">account_circle</i></a></div>
  
  <div class="fab" id="fab3" data-tooltip="Work"><a href="/member/my_bookmarks"><i class="material-icons">computer</i></a></div>
  
    <div class="fab" id="fab2" data-tooltip="Contact"><a href="#"><i class="material-icons">send</i></a></div>
</div>

<div class="fab" id="fab1"><i class="material-icons" id="fabIcon">add</i></div>

<script>
var fab1 = document.getElementById('fab1');
var fab4 = document.getElementById('fab4');
var fab5 = document.getElementById('fab5');
var aaa = document.getElementById('guide');
var bbb = document.getElementById('modal');
var innerFabs = document.getElementsByClassName('inner-fabs')[0];

fab1.addEventListener('click', function () {
	innerFabs.classList.toggle('show');
});
fab4.addEventListener('click', function () {	
	bbb.classList.remove('hidden');
});

fab5.addEventListener('click', function () {
	aaa.classList.remove('hidden');
});

document.addEventListener('click', function (e) {
	switch (e.target.id) {
		case "fab1":
		case "fab2":
		case "fab3":
		case "fab4":
		case "fabIcon":
			break;
		default:
			innerFabs.classList.remove('show');
			break;	
	}

});


var ccc = document.getElementById('ccc');
ccc.addEventListener('click', function () {
	bbb.classList.add('hidden');
});







//파일 첨부


var fileList = []
var fileDrag = document.getElementById("fileDrag")
var span = document.getElementById("span")
// get file list when user click on Select button
document.getElementById("file").addEventListener("change", (e) => {
	fileList = e.target.files

	handleFiles(fileList);
}, false)



fileDrag.addEventListener("dragenter", (e) => {
	e.stopPropagation()
	e.preventDefault()

	fileDrag.classList.add("dragenter") 
}, false)

fileDrag.addEventListener("dragover", (e) => {
	e.stopPropagation()
	e.preventDefault()
}, false)

fileDrag.addEventListener("dragleave", (e) => {
	e.stopPropagation()
	e.preventDefault()

	fileDrag.classList.remove("dragenter")
	span.innerHTML = ""
}, false)

fileDrag.addEventListener("drop", (e) => {
	e.stopPropagation()
	e.preventDefault()
	fileDrag.classList.remove("dragenter")

	fileList = e.dataTransfer.files

	handleFiles(fileList);
}, false)



var handleFiles = (files) => {
	span.innerHTML = ""
	let list = document.getElementById("list")
	let imageType = /^image\//;

	for (let file of files) {

		let li = document.createElement("li")
		let thumbWrapper = document.createElement("div")
		
		// remove folders
		if (file.type == "") {
			continue
		}
		// check if the file type is image
		else if (imageType.test(file.type)) {

			let img = document.createElement("img")
			let i = document.createElement("i")
			img.file = file

			thumbWrapper.appendChild(img)
			thumbWrapper.appendChild(i)
			// read image content
			
			let reader = new FileReader()
			reader.readAsDataURL(file)

			reader.onload = ((aImg) => {
				i.classList.add("fa")
				i.classList.add("fa-times-circle")
				return (e) => {
					aImg.src = e.target.result
				}
				
			})(img)
		}
		// other file types
		else {
			let divThumb = document.createElement("div")
			divThumb.classList.add("thumb-ext")
			divThumb.innerText = file.name.split('.').pop().toUpperCase();
			thumbWrapper.appendChild(divThumb)
		}

		thumbWrapper.classList.add("thumb-wrapper")
		li.appendChild(thumbWrapper)


		


		list.appendChild(li)


	}

}



















</script>
	

	</div>