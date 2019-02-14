/*panel*/

	

  window.addEventListener("load",function(){
	    var close = document.querySelector(".close-label");
	    var guideTab = document.querySelector("#guide");	    
	    var del = document.querySelector(".text-del");
	    var search = document.querySelector("#search");

	    close.onclick = function(){
	    	guideTab.classList.add("hidden");
	    };
	});
  
  
  
  window.addEventListener("load",function(){
 
	  var a = $(".tab");
	  var b = $(".tab1");
	  var c = $(".dd");
	 
  
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
		//alert($(this).text())
		var title = $(this).text();
		var contentTitle = $("#contentTitle")
		contentTitle.text(title);
		
		$.ajax({
				    method      : 'POST',
				    url         : '/Qna/ajax',
				    data        : { "title" : title },
				    success     : function(json) {
				    	
				    	var a = JSON.parse(json)
				    	
				    	var content = $(".qna_content")
				    	content.remove();
				    	contentTitle.text(title)
				    	var contentBox = $(".qna_contentBox")
				    	
				    	var contentList = new Array( a[0].content1,a[0].content2, a[0].content3, a[0].content4, a[0].content5 );
				    	
				    	for(var i=0; i<contentList.length; i++){
				    		if(contentList[i]!=null) {
				    			var a = $("<div class='qna_content'></div><br class='qna_content'>").text(contentList[i]);   // Create with jQuery		    		
				    			contentBox.append(a);
				    		}
				    	}
				    	

  
				    	
				    },
				    error       : function(request, status, error) {
				    	var content = $(".qna_content")
				    	content.remove();
				    	contentTitle.text(title)
				    }	
					
				 	   
		});
		
		
		$("#slide").attr('class', 'move-to-second');
		$(".tab").attr('class', 'tab');
		$("#tab2").attr('class', 'tab selected');
	}
	
  });
	
 

  
  
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	window.addEventListener('load',function(){
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
		var bb = document.querySelector("#question_btn");
		//var img = document.querySelector("input[name='file_name']");
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
			
		}, false)

		fileDrag.addEventListener("drop", (e) => {
			e.stopPropagation()
			e.preventDefault()
			span.innerHTML = ""
			fileDrag.classList.remove("dragenter")

			fileList = e.dataTransfer.files

			handleFiles(fileList);
		}, false)


		var a = 0;
		var formData = new FormData();
		var handleFiles = (files) => {
			formData = new FormData();
			a += files.length;
			span.innerHTML = ""
			let list = document.getElementById("list")
			let imageType = /^image\//;
			
			if(a<5) {
				for (let file of files) {
					let li = document.querySelector(".li")
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
						formData.append('img',file)	

						reader.onload = ((aImg) => {
							i.classList.add("fa")
							i.classList.add("fa-times-circle")
							return (e) => {
								aImg.src = e.target.result
							}
							
						})(img);
						
						
					}
					// other file types
					//else {
					//	let divThumb = document.createElement("div")
				//		divThumb.classList.add("thumb-ext")
				//		divThumb.innerText = file.name.split('.').pop().toUpperCase();
				//		thumbWrapper.appendChild(divThumb)
				//	}
					thumbWrapper.classList.add("thumb-wrapper")
					li.appendChild(thumbWrapper)
			
					//img.value += file.name+","
					list.appendChild(li)
					
					
				}
				
			}
			else{
				a -= files.length;
				alert("파일첨부는 4개까지 가능합니다.")
			}
			$.ajax({
			    method      : 'POST',
			    url         : '/Qna/Attachments',
			    processData: false,
		        contentType: false,
			    data        : formData,
			    success     : function(data) {
			        alert("이미지"); 
			        
			    },
			    error       : function(request, status, error) {
			        alert("실패");
			    }	
				
			 	   
			});
			
			
		}

		var email = document.querySelector("input[name='e-mail']");
		var title = document.querySelector("input[name='title']");
		var content = document.querySelector(".area textarea");

		bb.onclick=function() {
			var arr = [email.value, title.value, content.value];
			

			
			$.ajax({
			    method      : 'POST',
			    url         : '/Qna/question',
			    traditional : true,
			    data        : {
			        'main' : arr
			    },
			    success     : function(data) {
			      alert(a); 
			    	
			      email.value = "";
			 	  title.value = "";
			 	  content.value = "";
			 	  span.innerHTML = "drag & drop"
			 	  for(var i = 0; i < a; i++)
			 		  
			 	  $(".thumb-wrapper").eq(0).remove();  
			 	  a = 0;
			    },
			    error       : function(request, status, error) {
			        alert(error);
			    }	
				
			 	   
			});
			
			
			   
			  	
		};

		});



		
	
	
	
	
	
	//검색어 삭제
	window.addEventListener('load',function(){
		var del = document.getElementById("del")
		 $(".search-bar").bind("change paste keyup", function() {
			 if($(this).val() == "") {
				 $("#del").addClass("hidden")
			 }
		     else if ($(this).val() != "") {
		    	 $("#del").removeClass("hidden")
		     }
		 
		 });
	
		 
		 

	
	
	del.onclick = function() {
		search.value = "";
		 $("#del").addClass("hidden")
	}
	});
	
	$(function () {
		$('.panel-collapse').on('show.bs.collapse', function () {
		
		    $(this).siblings('.panel-heading').addClass('active');
		  });

			$('.panel-collapse').on('hide.bs.collapse', function () {
	
		    $(this).siblings('.panel-heading').removeClass('active');
		  });
		});
   
	