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
	
	
	//이미지 클릭해서 대표 선택
	var imgs = $('.img-list img');
	var upImages = $('.up-images');
	var img = $('<img />');
	
	imgs.on('click',function(e){
		
		upImages.addClass('back-none');
		img.attr('src',$(e.target).attr('src'));
		if(upImages.children().length==0)	
			upImages.append(img);
		else
			upImages.find('img').replaceWith(img);
	});
	
	//추가 이미지 클릭해서 파일띄우기
	var openBt = $('.openfolder');
	upImages.on('click', function(){
		openBt.trigger('click');
	});
	
	
	
	//파일 다중업로드
	openBt.change(function(e) {
		alert(e.target.files);
	});
	
	
	
	
});