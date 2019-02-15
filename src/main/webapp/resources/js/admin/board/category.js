
//체크박스 선택
// window.addEventListener("load",function(){
    
//     var totalCheck = document.querySelector("#total-check");
//     var checkBox = document.querySelectorAll("input[type='checkbox']");
//     var modal2 = document.querySelector("#modal2");
//     var selectRemove = document.querySelector("#select-remove");
    
//     totalCheck.onchange = function(){
//         var check = totalCheck.checked;
        
//         for(var i=0; i<checkBox.length;i++){
//             checkBox[i].checked = check;
//         }
//     }

//     selectRemove.addEventListener("click",function(){
//         modal2.style.display = "block";
        
//     })

    
// })


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
    // for(var i = 0; i < group.length; i++){

    //     group[i].ondblclick = function(e){
    //         var category = e.currentTarget.nextSibling.nextSibling;
    //         var categoryDis = category.style.display;
    //         if(categoryDis == "block"){
    //             category.style.display = "none";
    //         }else{
    //             category.style.display = "block";
    //         }
    //     }

    //     group[i].onselectstart = function(){
    //         return false;
    //     }

    //     group[i].onclick = function(e){
    //         var label = e.currentTarget.querySelector("label");
    //         groupName.value = label.innerText;
            
    //     }
    // }

    // 하버기능, 삭제    
    // for(var i=0; i<obj.length; i++){
    //     obj[i].onmouseover = function(e){

    //         var removeBtn = e.currentTarget.querySelector(".remove-button");
    //         removeBtn.style.display = "inline";
    //     }
    //     obj[i].onmouseout = function(e){
    //         var removeBtn = e.currentTarget.querySelector(".remove-button");
    //         removeBtn.style.display = "none";
    //     }
    // }

    
    
})

// // 드래그 앤 드롭으로 위치이동
// $( function() {
//     $( ".category-list" ).sortable({
//         connectWith: ".category-list"
//       }).disableSelection();


//     $( ".list-box" ).sortable();
// } );



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

    checkBtn.addEventListener("click",function(){
        modal2.style.display = "none";
    })


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

    // checkBtn.onclick = function(){
    //     modal3.style.display = "none";
    // }

})


// 검색 조건 설정
$(function(){
    //부모 카테고리 선택시 자식 카테고리 보이기
    $("#group-select").change(function(){
    	
        var group = $("#group-select").val();
        var category = $(".category-opt");
        
        $("#category-select").find("option:eq(0)").prop("selected",true);
        
        for(var i=0;i<category.length;i++){
            if(group == category[i].getAttribute('name')){
                category[i].classList.remove('hidden');
            }else{
                category[i].classList.add('hidden');
            }
        }
    })
})


// Ajax modal
$(function(){

    $.ajax(ajaxStart = {
        method:'GET',
        url:'categoryModal',
        success : function(list){
            
            var category = JSON.parse(list);
            
            for(var i=0;i<category[0].length;i++){
                var parent = category[0][i].name;

                var listBox = $(".list-box")
                var groupBox = $("<li class='group-box'></li>")
                var groupName = $("<div class='group-name'></div>")
                var categoryName = $("<ul class='category-list hidden'></ul>")
                var label = $("<label></label>").text(parent)
                var labelSpan = $("<span class='glyphicon glyphicon-menu-hamburger' aria-hidden='true' style='font-size:12px'></span>")
                var deleteSpan = $("<span class='glyphicon glyphicon-remove remove-button parent-remove' aria-hidden='true'></span>")

                label.append(labelSpan)
                groupName.append(label)
                groupName.append(deleteSpan)
                groupBox.append(groupName)
                groupBox.append(categoryName)
                listBox.append(groupBox)

                for(var j=0;j<category[1].length;j++){
                    var parentName = category[1][j].parentName;
                    var sub = category[1][j].name;

                    if(parent == parentName){
                        var aa = $(categoryName)
                        var bb = $("<li class='category-name'></li>");
                        var cc = $("<label></label>").text(sub)
                        var dd = $("<span class='glyphicon glyphicon-remove remove-button sub-remove' aria-hidden='true'></span>")

                        
                        bb.append(cc);
                        bb.append(dd);
                        aa.append(bb);
                        
                    }
                }
            }

            // 더블클릭시 하위 카테고리 보이기 및 드래그 방지

            $(function(){
                var a = $(".group-name")
                var b = $(".category-list")

                a.dblclick(function() {
                    var c = $(".group-name").index(this)        // 존재하는 모든 group-name 에서 this의 순서

                    if(b.eq(c).hasClass("hidden") == true){
                        b.eq(c).removeClass("hidden");
                    }else{
                        b.eq(c).addClass("hidden");
                    }
                });
                a.on("dragstart selectstart",function(){
                    return false;
                })

                a.click(function(){
                    var parentName = $(this).children("label").text()
                    $("#parent-name").val(parentName)
                })
            })

            //삭제버튼 hover기능 및 delete ajax
            $(function(){
                
                var a = $(".group-name")
                var b = $(".category-name")
                
                var parentDelete = $(".parent-remove")
                var subDelete = $(".sub-remove")

                a.mouseover(function(){
                    $(this).children(".remove-button").css("display","inline")
                })

                a.mouseout(function(){
                    $(this).children(".remove-button").css("display","none")
                })

                b.mouseover(function(){
                    $(this).children(".remove-button").css("display","inline")
                })

                b.mouseout(function(){
                    $(this).children(".remove-button").css("display","none")
                })

                /*delete */
                parentDelete.click(function(){
                    $("#modal2").css("display","block")

                    var c = $(".parent-remove").index(this)

                    var parentLabel = $(a).eq(c).children("label").text()
                    
                    $("#modal2-check").click(function(){
                        $.ajax({
                            method:'POST',
                            url:'parentDelete',
                            data: {"parentLabel":parentLabel},
                            
                            success : function(){
                                $("#parent-value").val("")
            
                                $(".list-box").empty()
                                
                                $.ajax(ajaxStart)
                                
                            },
                            error : function(){
                                alert("카테고리가 남아있습니다")
            
                            }

                        })
                    })
                })

                subDelete.click(function(){
                    $("#modal2").css("display","block")

                    var c = $(".sub-remove").index(this)
                    var d = $(".category-list").index($(this).parents(".category-list"))

                    var subLabel = $(b).eq(c).children("label").text()
                    var parentLabel = $(a).eq(d).children("label").text()
                    
                    $("#modal2-check").click(function(){
                        $.ajax({
                            method:'POST',
                            url:'subDelete',
                            data: {"parentLabel":parentLabel, "subLabel":subLabel},
                            
                            success : function(){
                                $("#parent-value").val("")
            
                                $(".list-box").empty()
                                
                                $.ajax(ajaxStart)
                                
                            },
                            error : function(){
                                alert("등록된 게시물이 존재합니다")
            
                            }

                        })
                    })

                })
                
                // modal2Close.click(function(){
                //     $("#modal2").css("display","none")
                // })

                // modal2Cancel.click(function(){
                //     $("#modal2").css("display","none")
                // })

            })

            //삭제 버튼 누르고 삭제확인(modal2)창 띄우기
            $(function(){
                
                var a = $("#modal2")

                $(".remove-button").click(function(){
                    a.css("display","block")
                })

            })

        }
    });

    //parent 추가
    $("#parent-add").click(function(){
        var parentValue = $("#parent-value").val()

        if(parentValue == ""){
            alert("값을 입력하세요!")
        }else{
            $.ajax({
                method:'POST',
                url:'parentInsert',
                data: {"parentValue":parentValue},
                
                success : function(){
                    $("#parent-value").val("")

                    $(".list-box").empty()
                    
                    $.ajax(ajaxStart)
                    
                },
                error : function(){
                    alert("이미 있는 값입니다")

                }
            })
        }

    })

    //sub 추가
    $("#sub-add").click(function(){

        var parentValue = $("#parent-name").val()
        var subValue = $("#sub-name").val()

        if(parentValue == ""){
            alert("그룹을 선택하세요")
        }else if(subValue == ""){
            alert("카테고리를 입력하세요")
        }else{
            $.ajax({
                method:'POST',
                url:'subInsert',
                data: {"parentValue":parentValue, "subValue":subValue},
                success : function(){
                    $("#parent-name").val("")
                    $("#sub-name").val("")

                    $(".list-box").empty()
                    
                    $.ajax(ajaxStart)
                    
                },
                error : function(){
                    alert("이미 있는 값입니다")
                }

            })
        }
        
    })

})


$(function(){

    $(".edit-button").click(function(){

        var a = $(".edit-button").index(this)
        var b = $(".category-obj").eq(a)

        var parentBefore = b.children(".parentCategory").text()
        var subBefore = b.children(".subCategory").text()
        
        $("#modal3-parent-before").val(parentBefore)
        $("#modal3-sub-before").val(subBefore)

        
        $("#modal3-check").click(function(){


            if($("#modal3-sub-after").val()==""){
                alert("카테고리명을 입력하세요")
            }else{

                var parentAfter = $("#modal3-parent-after").val()
                var subAfter = $("#modal3-sub-after").val()


                $.ajax({
                    method:'POST',
                    url:'categoryUpdate',
                    data: {
                        "parentBefore":parentBefore, 
                        "subBefore":subBefore, 
                        "parentAfter":parentAfter,
                        "subAfter":subAfter},

                    success : function(){

                        $("#modal3").css("dispaly","none")
                        
                    },
                    error : function(){
                        alert("존재하는 게시물이 있습니다")
                    }
                })


            }
        })

    })

})
           

