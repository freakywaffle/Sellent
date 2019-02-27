
$(function(){

    $(".point-button").click(function(){
    
        $("#modal").css("display","block")

        var index = $(".point-button").index(this)
        
        var id = $(".point-obj").eq(index).children(".point-id").text()
        

        $("#modal-check").click(function(){
            var content = $("#modal-content").val()
            var point = $("#modal-point").val()

            $.ajax({

                method:'POST',
                url:'./pointInsert',
                data:{ "id":id, "content":content, "point":point},
                success:function(){
                    alert("성공")

                    $("#modal").css("display","none")

                    var mouse = new MouseEvent("click")
                    var request = $("<a class='tmp hidden' href=''></a>")
                    $("html").append(request)
    
                    var tmp = document.querySelector(".tmp")
                    tmp.dispatchEvent(mouse)
                },
                error:function(){
                    alert("에러")
                }
            })
    
        })
    })
    


    $("#modal-close-button").click(function(){
        
        $("#modal").css("display","none")

    })

})


$(function(){
	
	$(".check-box").click(function(e){
		
		e.stopPropagation();
	})

	
})



// 지급사유 선택시 포인트 보이기
$(function(){
    
    $(".modal-content").change(function(){
    	
    	$(".point-point").each(function(index, obj){
    		
    		if($("#modal-content").val() == $(this).attr('name')){
    			$(this).removeClass('hidden');
    			$(this).prop("selected",true);
    		}else{
    			$(this).addClass('hidden');
    			$(this).prop("selected",false);
    		}
    		
    	})
    	
    })
})