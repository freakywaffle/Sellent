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

// 판매요청 승인
$(function(){
    $("#modal-close-button").click(function(){
        $("#modal").css("display","none")
    })

    // 대기버튼 클릭
    $(".state-button").click(function(){
        
        $("#modal").css("display","block")
        
        var parent = $(this).parents(".consult-obj")
        var index = $(".consult-obj").index(parent)
        
        var thisObj = $(".consult-obj").eq(index)

        var title = thisObj.children(".consult-title").text()
        var email = thisObj.children(".consult-email").text()
        var regdate = thisObj.children(".consult-regdate").text()
        var content = thisObj.children(".consult-content").text()

        $("#modal-title").text(title)
        $("#modal-email").text(email)
        $("#modal-regdate").text(regdate)
        $("#modal-content").text(content)

        // 모달창 확인 누르면 처리완료로 변경
        var modalCheck = document.querySelector("#modal-check")
        
        var consultObj = $(this).parents(".consult-obj")
        

        modalCheck.onclick = function(){

            var answer = document.querySelector("#modal-answer")

            var content = $(answer).val()

            var no = $(consultObj).children(".consult-no").text()
            var state = 1

            $("#modal").css("display","none")
            
           $(".loding-bar").removeClass("hidden")
            
            $.ajax({
                method:'POST',
                url:'email-send',
                data:{"title":title,"email":email,"content":content},

                success:function(){
                    $.ajax({
                        method:'POST',
                        url:'consultState',
                        data:{"state":state, "no":no},
                        success:function(){
                        	$(".loding-bar").addClass("hidden")
                        	
                            var state = consultObj.children(".state-state")
                        
                            state.empty()
                        
                            var span = $("<span class='state-ok'>처리완료</span>")
                            state.append(span)
        
                        },
                        error:function(){
                        	
                        	$(".loding-bar").addClass("hidden")
                        	
                            alert("실패")
                        }
                    })
                },
                error:function(){
                	$(".loding-bar").addClass("hidden")
                    alert("잘못된 이메일 형식")
                }
            })

        }
    })
})



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

                var no = $(this).parents(".consult-obj").children(".consult-no").text()
                arr.push(no)
            }
        })

        jQuery.ajaxSettings.traditional = true; // 배열을 전송할떄 끝 []를 없애줌

        $.ajax({

            method:'POST',
            url:'consultRemove',
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