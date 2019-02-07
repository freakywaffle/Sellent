

//체크박스 선택
window.addEventListener("load",function(){
    
    var totalCheck = document.querySelector("#total-check");
    var checkBox = document.querySelectorAll("input[type='checkbox']");

    totalCheck.onchange = function(){
        var check = totalCheck.checked;
        
        for(var i=0; i<checkBox.length;i++){
            checkBox[i].checked = check;
        }
    }

})


/*게시판편집 modal*/
window.addEventListener("load", function(){

    var modal = document.querySelector("#modal");
    var editBtn = document.querySelector("#total-edit-button");
    var closeBtn = document.querySelector("#modal-close-button");
    var checkBtn = document.querySelector("#modal-check");
    var group= document.querySelectorAll(".group-name");
    var groupName= document.querySelector("#groupName");
    var obj = document.querySelectorAll(".group-name, .category-name");

    //창닫기
    closeBtn.onclick = function(){
        modal.style.display = "none";
    }
    //확인버튼
    checkBtn.onclick = function(){
        modal.style.display = "none";
    }
    //게시판편집 버튼
    editBtn.onclick = function(){
        modal.style.display = "block";
    }
    //더블클릭시 이벤트, 드래그 방지
    for(var i = 0; i < group.length; i++){

        group[i].ondblclick = function(e){
            var category = e.currentTarget.nextSibling.nextSibling;
            var categoryDis = category.style.display;
            if(categoryDis == "block"){
                category.style.display = "none";
            }else{
                category.style.display = "block";
            }
        }

        group[i].onselectstart = function(){
            return false;
        }

        group[i].onclick = function(e){
            var label = e.currentTarget.querySelector("label");
            groupName.value = label.innerText;
            
        }
    }
    // 하버기능, 삭제    
    for(var i=0; i<obj.length; i++){
        obj[i].onmouseover = function(e){

            var removeBtn = e.currentTarget.querySelector(".remove-button");
            removeBtn.style.display = "inline";
        }
        obj[i].onmouseout = function(e){
            var removeBtn = e.currentTarget.querySelector(".remove-button");
            removeBtn.style.display = "none";
        }
    }

    
    
})
// 드래그 앤 드롭으로 위치이동
$( function() {
    $( ".category-list" ).sortable({
        connectWith: ".category-list"
      }).disableSelection();


    //$( ".list-box" ).sortable();
} );



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




/*modal3 - 게시판수정 */
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