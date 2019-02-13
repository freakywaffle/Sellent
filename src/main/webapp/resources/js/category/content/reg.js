$(document).ready(function(){
	
	//step전환
	
	var nextBt = $('.next');
	var prevBt = $('.prev');
	var submitBt = $('.submit');
	
	var navi = $('.navi');
	var step = $('.step');
	
	nextBt.on('click',function(){
		var index = navi.find('.during').parent().index();
		
		if(index == 0)
			prevBt.removeClass('hidden');
		
		if(index == navi.children().length-2){
			nextBt.addClass('hidden');
			submitBt.removeClass('hidden');
		}
		
		navi.find('.during').removeClass('during');
		navi.children().eq(index+1).find('a').addClass('during');
		
		step.eq(index).addClass('hidden');
		step.eq(index+1).removeClass('hidden');
		
	});
	
	
	
	prevBt.on('click',function(){
		var index = navi.find('.during').parent().index();
		if(index == 1)
			prevBt.addClass('hidden');
		if(index == navi.children().length-1){
			submitBt.addClass('hidden');
			nextBt.removeClass('hidden');
		}
		
		navi.find('.during').removeClass('during');
		navi.children().eq(index-1).find('a').addClass('during');
		
		step.eq(index).addClass('hidden');
		step.eq(index-1).removeClass('hidden');
	});	
	
	
	//토글버튼
	$('.toggle-btn').on('click',function(){
		var toggleMove = $('.toggle-move');
		var center = $('.toggle');
		
		if(!toggleMove.hasClass('action')){
			toggleMove.addClass('action');
			toggleMove.addClass('change-color');
		}
		else{
			toggleMove.removeClass('action');
			toggleMove.removeClass('change-color');
		}
	});
	
	
	//라디오 버튼
	var radioBt = $('.radio-bt');
	radioBt.on('click',function(e){
		var current = $(e.target);
		var idx = current.index('.radio-bt');
		var sellChk = $('.sell-chk'); 
		sellChk.attr('checked',false);
		sellChk.eq(idx).attr('checked',true);
		
		
		if(!current.hasClass('selected')){
			radioBt.removeClass('selected');
			current.addClass('selected');
		}
	});
	
	//select 직접입력	
	var editSelect = $('.edit-cnt select');
	var editInput = $('.edit-cnt input');
	
	var editFirst = true;
	editInput.on('click',function(){
		if(editFirst){
			editInput.val('');
			editFirst = false;
		}
	});
	
	editSelect.on('change',function(){
		
		if(editSelect.val() == '직접입력'){
			editInput.val(editSelect.val());
			editInput.addClass('put');
			editFirst = true;
		}
		else{
			editInput.removeClass('put');
		}
	});
	
	var termSelect = $('.term select');
	var termInput = $('.term input');
	
	var termFirst = true;
	termInput.on('click',function(){
		if(termFirst){
			termInput.val('');
			termFirst = false;
		}
	});
	
	termSelect.on('change',function(){
		if(termSelect.val() == '직접입력'){
			termInput.val(termSelect.val());
			termInput.addClass('put');
			termFirst = true;
		}
		else{
			termInput.removeClass('put');
		}
	});
	
	//select, 직접입력을 hidden에 담기
	function inputHidden(element){
		var select = element.find('select');
		var text = element.find('input');
		var hidden = element.find('input[type="hidden"]');
		
		select.on('change', function(){
			hidden.val(select.val());
			if(select.val()=='직접입력'){
				
				text.off('keyup');
				text.on('keyup',function(){
					hidden.val(text.val());
				});
			}
		});
	}
	
	inputHidden($('.edit-cnt'));
	inputHidden($('.term'));
	
	
	//추가 이미지 클릭해서 파일띄우기
	var upImages = $('.up-images');
	var openBt = $('.openfolder');
	upImages.on('click', function(){
		openBt.trigger('click');
	});
	
	//이미지 클릭해서 대표 선택
	var imgList = $('.img-list');
	
	imgList.on('click', function(e){
		var imgTag = new Image();
		upImages.addClass('back-none');
		imgTag.src = $(e.target).attr('src');
		imgTag.onload = function(){
			var canvas = $('<canvas></canvas>').get(0);
			var canvasContext = canvas.getContext('2d');
			
			canvas.width = 650;
			canvas.height = 400;
			
			canvasContext.drawImage(this, 0, 0, 650, 400);
	
			var dataURI = canvas.toDataURL("image/jpeg");
			
			imgTag.src = dataURI;
		}
		
		if(upImages.children().length==0)	
			upImages.append(imgTag);
		else
			upImages.find('img').replaceWith(imgTag);
	});
	
	
	//이미지 업로드
	var preview = $('.img-list ul');
	
	openBt.on('change', function() {
		var fileList = openBt.prop('files');
		var formData = new FormData();
		//업로드할 이미지 리스트화
		for(var i=0;i<fileList.length;i++){
			var reader = new FileReader();
			reader.readAsDataURL(fileList[i]);
			reader.addEventListener('load',function(e){
				var li = $('<li></li>');
				
				var file = e.target;
				var img = new Image();
				img.src = file.result;
				img.onload = function(){
					var canvas = $('<canvas></canvas>').get(0);
					var canvasContext = canvas.getContext('2d');
					
					canvas.width = 150;
					canvas.height = 150;
					
					canvasContext.drawImage(this, 0, 0, 150, 150);

					var dataURI = canvas.toDataURL("image/jpeg");

					img.src = dataURI;
				};
				
				li.append(img);
				preview.append(li);
				console.log(i+'완료');
				
				
			});
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
	        	
	        	preview.find('img').eq(0).trigger('click');
	        }
	    });
		
		
		
	});
	
	
	
	
});



