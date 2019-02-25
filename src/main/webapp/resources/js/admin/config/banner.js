
/*파일업로드 */
window.addEventListener("load", function(){

    //modal
    var fileBtn = document.querySelector("#modal-file");

    fileBtn.onchange = function(){
        readURL(fileBtn);
    }

    function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();
    
        reader.onload = function (e) {
                $('#modal-img').attr('src', e.target.result);
            }
    
          reader.readAsDataURL(input.files[0]);
        }
    }
})

window.addEventListener("load", function(){
    //modal3
    var fileBtn = document.querySelector("#modal3-file");

    fileBtn.onchange = function(){
        readURL(fileBtn);
    }

    function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();
    
        reader.onload = function (e) {
                $('#modal3-img').attr('src', e.target.result);
            }
    
          reader.readAsDataURL(input.files[0]);
        }
    }
})

/*modal- 이벤트전달- 버튼클릭시 input[type='file']실행 */
window.addEventListener("load",function(){

    var imgBtn = document.querySelector("#modal-img-button");
    var fileBtn = document.querySelector("#modal-file");

    imgBtn.addEventListener("click", function(){
        var evt = new MouseEvent("click");

        fileBtn.dispatchEvent(evt);
    })

})

/*modal3- 이벤트전달- 버튼클릭시 input[type='file']실행 */
window.addEventListener("load",function(){

    var imgBtn = document.querySelector("#modal3-img-button");
    var fileBtn = document.querySelector("#modal3-file");

    imgBtn.addEventListener("click", function(){
        var evt = new MouseEvent("click");

        fileBtn.dispatchEvent(evt);
    })

})






/*토글버튼 */
$(function(){
    var check = $(".switch>input[type='checkbox']");
    check.click(function(){
    $(this).parent().parent().children("p").toggle();
    });
})


/*모달창 드래그 */
window.addEventListener("load",function(){
    var modal = document.querySelector("#modal");

    modal.addEventListener("dragenter",function(e){
        e.stopPropagation()
        e.preventDefault()

        modal.classList.add("dragenter");
    })

})




/*달력 */
$(function() {
    //모든 datepicker에 대한 공통 옵션 설정
    $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "/resources/images/admin/달력.png" //버튼 이미지 경로
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "날짜선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
        ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
            });
 
            //input을 datepicker로 선언               
    $("#datepicker2").datepicker();
    $("#datepicker3").datepicker();

    //To의 초기값을 내일로 설정
    $('#datepicker2').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
    $('#datepicker3').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
    $("#datepicker").val("");
    $("#datepicker2").val("");
});


// 드래그 앤 드롭으로 위치이동
$( function() {
    $( ".tbody" ).sortable({
        connectWith: ".tbody"
      }).disableSelection();


    //$( ".tbody tr" ).sortable();
} );


// 선택삭제
$(function(){
    $("#total-check").click(function(){
        if($(this).is(":checked") == true){
            $(".check-box").prop("checked",true)
        }else{
            $(".check-box").prop("checked", false)
        }
    })

    $("#select-remove").click(function(){
        $("#modal2").css("display","blocK")
    })

    $("#modal2-close-button").click(function(){
        $("#modal2").css("display","none")
    })
    
    $("#modal2-cancel").click(function(){
        $("#modal2").css("display","none")
    })
    
    $("#modal2-check").click(function(){
        $("#modal2").css("display","none")
        
        var arr = new Array()    // ajax를 배열로 전송하는 경우 스프링에서는 ArrayList로 받는다

        $(".check-box").each(function(){
            if($(this).is(":checked")==true){

                var no = $(this).parents(".banner-obj").children(".banner-id").text()
                arr.push(no)
            }
        })

        jQuery.ajaxSettings.traditional = true; // 배열을 전송할떄 끝 []를 없애줌

        $.ajax({

            method:'POST',
            url:'bannerRemove',
            data:{"arr":arr},
            success:function(){
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




$(function(){

    $("#reg-button").click(function(){

        $("#modal").css("display","block")
        
    })

    
    $("#modal-close-button").click(function(){

        $("#modal").css("display","none")
        
    })

    
    $("#modal-check").click(function(){

        var formData = new FormData($("#fileForm")[0])

        $.ajax({
        	
        	method:'POST',
            url:'bannerInsert',
            processData : false,
            contentType : false,
            data:formData,
        	success:function(){
        	},
        	error:function(){
        	}
        	
        })
        
        $("#modal").css("display","none")
        
    })

})


//
//$("#modal4").css("display","block")
//
//        var index = $(".member-info").index(this)
//
//        $("#modal4-photo").val($(".member-photo").eq(index).text())
//        $("#modal4-simple").val($(".member-simple").eq(index).text())
//        $("#modal4-detail").val($(".member-detail").eq(index).text())
//        
//        var id = $(".member-id").eq(index).text()
//        var path = '/sellent/profile/'+id+'/'
//        var file = $(".member-photo").eq(index).text()
//        path += file
//
//        if(file==''){
//            $(".photo-alert").removeClass("hidden")
//            $("#modal4-photo").addClass("hidden")
//        }else{
//            $(".photo-alert").addClass("hidden")
//
//            $("#modal4-photo").attr("src", path) 
//            $("#modal4-photo").removeClass("hidden")
//        }



$(function(){
	
	$("#save-button").click(function(){

		var idArr = new Array()
		var orderArr = new Array()
	
		$(".edit-button").each(function(index,obj){
			
			var id = $(".banner-obj").eq(index).children(".banner-id").text()

			var order = index+1
			
			idArr.push(id)
			orderArr.push(order)
		})
		
		jQuery.ajaxSettings.traditional = true;
	
		$.ajax({
            method:'POST',
            url:'bannerUpdate',
            data:{"idArr":idArr, "orderArr":orderArr},
            success:function(){
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

