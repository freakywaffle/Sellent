
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
    $("#datepicker").datepicker();                    
    $("#datepicker2").datepicker();
    
    //From의 초기값을 오늘 날짜로 설정
    $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
    //To의 초기값을 내일로 설정
    $('#datepicker2').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
    $("#datepicker").val("");
    $("#datepicker2").val("");  
});

// 선택삭제
$(function(){
	$(".check-box").click(function(e){
		
		e.stopPropagation();
	})

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

                var no = $(this).parents(".member-obj").children(".member-id").text()
                arr.push(no)
            }
        })

        jQuery.ajaxSettings.traditional = true; // 배열을 전송할떄 끝 []를 없애줌

        $.ajax({

            method:'POST',
            url:'memberRemove',
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



//모달3
$(function(){
    $(".member-mail").click(function(){
        $("#modal3").css("display","block")

        var index = $(".member-mail").index(this)
        
        $("#modal3-id").val($(".member-id").eq(index).text())
        $("#modal3-mail").val($(".member-email").eq(index).text())
        
    })
    $("#modal3-close-button").click(function(){
        
        $("#modal3-title").val("")
        $("#modal3-content").val("")
        $("#modal3-mail").val("")

        $("#modal3").css("display","none")
    })
    $("#modal3-check").click(function(){
    
        var title = $("#modal3-title").val()
        var content = $("#modal3-content").val()
        var email = $("#modal3-mail").val()

        if(title =="" || content == "" || email ==""){
            alert("입력하지 않은 값이있습니다")
        }else{
        	$(".loding-bar").removeClass("hidden")
        	
            $.ajax({

                method:'POST',
                url:'/admin/board/email-send',
                data:{"title":title, "email":email, "content":content},
                success:function(){
                    alert("전송완료")

                    $(".loding-bar").addClass("hidden")
                    
                    $("#modal3-title").val("")
                    $("#modal3-content").val("")
                    $("#modal3-mail").val("")

                    $("#modal3").css("display","none")
                },
                error:function(){
                	$(".loding-bar").addClass("hidden")
                }
                
            })
        }
    })

})

//모달1
$(function(){
    //모달
    $("#member-reg").click(function(){
        $("#modal").css("display","block")

    })
    $("#modal-close-button").click(function(){
        $("#modal").css("display","none")
        $(".pwd-message").css("display","none")
        
        $("#modal-id").val("")
        $("#modal-nickname").val("")
        $("#modal-pwd").val("")
        $("#modal-pwd2").val("")
        $("#modal-mail").val("")
        $("#modal-simple").val("")
        $("#modal-simple").val("")
        $("#modal-skill").val("")
        $("#modal-photo").attr("src","/sellent/admin/업로드아이콘.png")
    })
    
    $("#modal-check").click(function(){

        var id = $("#modal-id").val()
        var nickname = $("#modal-nickname").val()
        var pwd = $("#modal-pwd").val()
        var pwd2 = $("#modal-pwd2").val()
        var mail = $("#modal-mail").val()
        var simple = $("#modal-simple").val()
        var detail = $("#modal-simple").val()
        var skill = $("#modal-skill").val()
        var image = $("#modal-file").val().replace(/.*(\/|\\)/, '')
        
        alert(image)
        
        var memberInfo = {
            "id":id, "nickname":nickname, "pwd":pwd, "mail":mail,
            "simple":simple, "detail":detail, "skill":skill, "image":image
        }

        var memberJson = JSON.stringify(memberInfo)
        
        if(pwd!=pwd2){
            $(".pwd-message").css("display","block")
        }else if(id == "" || pwd =="" || mail=="" || simple=="" || detail==""|| skill==""){
            alert("입력하지 않은 값이 있습니다")
        }else{
            $(".pwd-message").css("display","none")
            
            $.ajax({
                method:'POST',
                url:'memberInsert',
                data: {"memberJson" : memberJson},
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
        }
    })    
})


//모달4
$(function(){

    $(".member-info").click(function(){

        $("#modal4").css("display","block")

        var index = $(".member-info").index(this)

        $("#modal4-photo").val($(".member-photo").eq(index).text())
        $("#modal4-simple").val($(".member-simple").eq(index).text())
        $("#modal4-detail").val($(".member-detail").eq(index).text())
        
        var id = $(".member-id").eq(index).text() + '/'
        var path = '/sellent/profile/'+id
        var file = $(".member-photo").eq(index).text()
        path += file

        
        $("#modal4-photo").attr("src", path) 
        
/*        if(file =='' || file == null){
            //$(".photo-alert").removeClass("hidden")
            $("#modal4-photo").addClass("hidden")
        }else{
            //$(".photo-alert").addClass("hidden")

            $("#modal4-photo").attr("src", path) 
            $("#modal4-photo").removeClass("hidden")
        }*/

        var memberId = $(".member-id").eq(index).text()

        $.ajax({

            method:'POST',
            url:'memberSkill',
            data:{"memberId":memberId},
            success:function(skill){
                var skillList = JSON.parse(skill);
                
                $("#modal4-skill").val(skillList)
            }

        })

    })
    $("#modal4-close-button").click(function(){
        $("#modal4").css("display","none")
    })
    $("#modal4-check").click(function(){
        $("#modal4").css("display","none")
    })
    
})


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
                $('#modal-photo').attr('src', e.target.result);
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



$(function(){
	
    $(".point-button").click(function(){
        
        $("#modal5").css("display","block")

        var index = $(".point-button").index(this)
        
        var id = $(".member-obj").eq(index).children(".member-id").text()
        
        $("#modal5-check").click(function(){
            var content = $("#modal5-content").val()
            var point = $("#modal5-point").val()

            $.ajax({

                method:'POST',
                url:'./pointInsert',
                data:{ "id":id, "content":content, "point":point},
                success:function(){
                    alert("성공")

                    $("#modal5").css("display","none")

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
    


    $("#modal5-close-button").click(function(){
        
        $("#modal5").css("display","none")

    })
	
})




// 지급사유 선택시 포인트 보이기
$(function(){
    
    $(".modal5-content").change(function(){
    	
    	$(".point-point").each(function(index, obj){
    		
    		if($("#modal5-content").val() == $(this).attr('name')){
    			$(this).removeClass('hidden');
    			$(this).prop("selected",true);
    		}else{
    			$(this).addClass('hidden');
    			$(this).prop("selected",false);
    		}
    		
    	})
    	
    })
})