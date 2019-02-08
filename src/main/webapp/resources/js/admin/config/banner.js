
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

    //modal3
    var fileBtn3 = document.querySelector("#modal3-file");

    fileBtn3.onchange = function(){
        readURL(fileBtn3);
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


/*수정사항 저장 */
window.addEventListener("load",function(){
    var saveBtn = document.querySelector("#save-button");

    saveBtn.onclick = function(){
        
    }
})

/*modal-배너등록 */
window.addEventListener("load",function(){

    var modal = document.querySelector("#modal");
    var regBtn = document.querySelector("#reg-button");
    var closeBtn = document.querySelector("#modal-close-button");
    var checkBtn = document.querySelector("#modal-check");

    regBtn.onclick = function(){
        modal.style.display = "block";
    }
   
    closeBtn.onclick = function(){
        modal.style.display = "none";
    }

    checkBtn.onclick = function(){
        modal.style.display = "none";
    }

})

/*modal3-배너수정*/
window.addEventListener("load",function(){

    var modal3 = document.querySelector("#modal3");
    var editBtn = document.querySelectorAll(".edit-button");
    var closeBtn = document.querySelector("#modal3-close-button");
    var checkBtn = document.querySelector("#modal3-check");


    for(var i=0;i<editBtn.length;i++){
        editBtn[i].onclick = function(){
            modal3.style.display = "block";
        }
    }
    closeBtn.onclick = function(){
        modal3.style.display = "none";
    }

    checkBtn.onclick = function(){
        modal3.style.display = "none";
    }
})

/*선택삭제 */
window.addEventListener("load",function(){
    
    var totalCheck = document.querySelector("#total-check");
    var checkBox = document.querySelectorAll("td>input[type='checkbox']");
    var modal2 = document.querySelector("#modal2");
    var selectRemove = document.querySelector("#select-remove");
    
    totalCheck.onchange = function(){
        var check = totalCheck.checked;
        
        for(var i=0; i<checkBox.length;i++){
            checkBox[i].checked = check;
        }
    }

    selectRemove.onclick =function(){
        modal2.style.display = "block";
    }
    
})

/*확인취소창 modal2*/
window.addEventListener("load", function(){
    
    var modal2 = document.querySelector("#modal2");
    var closeBtn = document.querySelector("#modal2-close-button");
    var cancelBtn = document.querySelector("#modal2-cancel");
    var removeBtn = document.querySelectorAll(".remove-button");
    var checkBtn = document.querySelector("#modal2-check");

    closeBtn.onclick = function(){
        modal2.style.display = "none";
    }

    checkBtn.onclick = function(){
        modal2.style.display = "none";
    }

    cancelBtn.onclick = function(){
        modal2.style.display = "none";
    }

    for(var i = 0; i<removeBtn.length; i++){
        removeBtn[i].onclick = function(){
            modal2.style.display = "block";
        }
    }
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
});


// 드래그 앤 드롭으로 위치이동
$( function() {
    $( ".tbody" ).sortable({
        connectWith: ".tbody"
      }).disableSelection();


    //$( ".tbody tr" ).sortable();
} );


