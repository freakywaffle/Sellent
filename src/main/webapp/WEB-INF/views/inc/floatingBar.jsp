<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>  
<tiles:importAttribute name="list"/>
<tiles:importAttribute name="subList"/>
<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	
	<!-- Optional JavaScript -->
	

	<!-- 슬라이드 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
    
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="/resources/css/guide2.css">
	<script src="/resources/js/inc/floatingBar.js"></script>

	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script> 
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
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
			
			<label class="close-label"><i class="fa fa-close lh-50"></i></label>
			
			
			<section id="content1" class="tab-content">
				<h3 class="hidden">Headline 1</h3>
				<div id="wrap">
				       <div id="container">
				         <div id="slide" class="">
				           <div id="first" class="box y-scroll">
				           
				           
				           		<div class="search-box">
		      		<h1>문의 전 확인</h1>
		      		<h5>아래 검색창을 통해 원하시는 답변을 빠르게 찾아 보실수 있습니다.</h5>
			      	<input class="block search-bar" type="text" id="search" name="search" placeholder="검색어를 입력해주세요"></input>
			      	<div>
				      	<i class="fa fa-search"></i>
				      	<i class="fa fa-close text-del hidden" id = "del"></i>
			      	</div>
		      	</div>
		      			      	<!-- panel -->
		      	<div style="height: calc(100% - 176px);">
	      		 	<div class="wrapper center-block">
					    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
	
					  <c:forEach var="i" items="${list}">
					   <div class="panel panel-default">
					      <div class="panel-heading" role="tab" id="headingOne">
					        <h4 class="panel-title">
					          <a id="mainTitle" class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse${i.parent_no}" aria-expanded="false" aria-controls="collapse${i.parent_no}">
					            	${i.title}
					          </a>
					        </h4>
					      </div>
					      <div id="collapse${i.parent_no}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
					        <div class="panel-body">
					          <ul class="dd">
								<c:forEach var="j" items="${subList}">
							
					          <c:if test="${i.parent_no == j.parent_no}">
							          	<li><a href="#" class="tab1">${j.title}</a></li>
					          </c:if>
							        
								</c:forEach>					         
					          
					          </ul>
					        </div>
					      </div>
					    </div>
					  </c:forEach>  
					     
					 
					    
					  </div>
  					</div>
		      	</div>
				           
				           
				           
				           
				           </div>
				           
				           
				           
				           
				           <div id="second" class="box qna_contentBox">
				          
				         	  	<div id="taba3" class="tab"><i class="fa fa-arrow-left color-gray-d1" aria-hidden="true"></i>&nbsp;&nbsp;뒤로가기</div>
							    <br>
							    <div id="contentTitle" class="tab qna_content">서브title</div>
				           		<br>
				           	
				           	
				           
				           	
				           
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
						
						<!--h6 class="hidden">파일이름</h6>
				      	<input class="block title-bar hidden" type="text" name="file_name"></input-->
						
						<h6>내용</h6>
						<div class="area">
							<textarea rows="9" cols="" placeholder="문의 내용을 작성해주세요."></textarea>
						</div>
						<div class="file-box">
							
							<section class="sec sec-select" id="fileDrag">
								<div id="span">drag & drop</div>
								<section class="sec sec-list">
									<ul id="list" style="display:flex;">
									<li class="li"></li>
									<li class="li"></li>
									<li class="li"></li>
									<li class="li"></li>
									</ul>
								</section>
							</section>
								<input type="file" id="file" multiple="">
								<label class="btn file-btn" for="file">파일첨부</label>										
						</div>
						<div style="width: 100%; height: 50px; margin-top: 20px">
							<a class="btn a" id="question_btn">문의 하기</a>
						</div>
						
						<div>
							<ul style="padding: 10px 0px 0px 20px; list-style: initial!important; font-size: 17px;">
								<li>주말·공휴일은 답변이 늦어질 수 있습니다.</li>
								<li>파일 첨부는 최대 4개까지 가능합니다.</li>							
							</ul>
						</div>
					</div>
			
						 
					
					
					
 
				
			</section>





			<section id="content3" class="tab-content">
				<h3 class="hidden">Headline 3</h3>
		      	<div class="flex" style="position:absolute; width: 100%; height: 100%; overflow: hidden">
		      		<div id="tab1st" style="position:absolute; width: 100%">
			      		<ul>
				      		<c:if test="${not empty sessionScope.member.id}">
				      			<li class="scal" style="padding: 20px; height: 100px; border: 1px solid #cdcdcd; margin-bottom: 10px;">
				      				<div class="flex" style="height: 100%;">
				      					<div style="height: 100%; width: 20%;">
				      						<img style="height: 100%; border-radius: 500px;" src="/resources/images/${sessionScope.member.photo}" />
				      					</div>
				      					<div style="height: 100%; width: 80%;">
				      						<div style="height: 50%;">
												<h1 style="color: #ee3b27; margin-top: 6px!important;">Sellent
													<span class="hidden" style="float: right; font-size: 13px; color: #999">4일전</span>	
												</h1>				
				      						</div>
				      						<div style="height: 50%; font-size: 18px;">
				      							${sessionScope.member.id}님, Sellent에 오신 것을 환영합니다.
				      						</div>
				      					</div>
				      				</div>
				      			</li>
				      		</c:if>
			      		</ul>
		      		</div>
		      		
		      		<div id="tab2nd" style="color: #999s; position:absolute; width: 100%; left:100%; height: 20px; padding: 15px;">
		      		
		      			<div style="cursor: pointer; font-size: 18px; font-weight: bold; width: 100px">
			      			<i class="fa fa-arrow-left color-gray-d1" aria-hidden="true"></i>돌아가기
		      			</div>
		      			<br/>
		      			<br/>
		      			<div>2019-01-25 16:20:30</div>
		      			<div>반갑습니다! 크몽과 함께 즐겁게 일할 준비 되셨나요? </div>
		      			<div>거래를 시작하시기 전에 크몽의 거래매너 가이드를 꼭 읽어주세요.</div>
		      			<br/>
		      			<div>내 일을 해결해줄 전문가에게 매너를 보여주세요 :)</div>
		      			<br/>
		      			<div>· 문의하기 전 서비스설명을 꼼꼼히 읽어주세요.</div>
						<div>· 전문가가 연락가능한 시간에 문의하면 좀 더 빠른 답변이 가능해요.</div>
						<div>· 작업이 완료되면 전문가에게 후기를 남겨주세요. 여러분의 작은 한마디가</div>
		      			<br/>
		      			<br/>
						<div>건강한 거래문화는 의뢰인 - 전문가 모두가 함께 만들어가는 것입니다.</div>
		      			<br/>
		      			<br/>
						<div>· 사람 대 사람간의 거래입니다. 어떠한 상황에서도 악의적인 비방, 욕설은 삼가주세요!</div>
						<div>· 서비스에 명시된 금액, 혹은 서로 합의된 가격으로 거래를 진행해주세요.</div>
						<div>· 결제 전 개인 연락처 요청 및 외부 거래유도는 서로에게 피해를 발생시킬 수 있어요.</div>
						<div>(결제 후 연락처 공유는 가능하지만, 결제 전 연락처 공유시 패널티가 부과됩니다.) </div>
		      			
		      			<div>· 거래가 끝까지 잘 마무리 될 수 있도록 성실히 임해주세요 :)</div>
		      		
		      		</div>
		      	</div>
			</section>		
			
			
		</div>


	
	
	
	
	
	
	
	</div>	
	
	

  
 
	<!-- Floating Bar ======================================================================================== -->

	<div class="inner-fabs" id="aaaaaa">
		<div class="fab" id="fab5" data-tooltip="FAQ"><a href="#"><i class="material-icons">help</i></a></div>
		<div class="fab" id="fab4" data-tooltip="구매 가이드"><a href="#"><i class="material-icons">library_books</i></a></div>
		<div class="fab" id="fab3" data-tooltip="Bookmark"><a href="/member/my_bookmarks"><i class="material-icons">favorite</i></a></div>	  
	</div>
	<div class="fab" id="fab1"><i class="material-icons" id="fabIcon">add</i></div>

	<!-- Floating Bar ======================================================================================== -->

</div>


<script>

</script>	
