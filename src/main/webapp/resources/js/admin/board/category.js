
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

// 모달창 열기 및 닫기
$(function(){
    
    //modal
    $("#total-edit-button").click(function(){
        $("#modal").css("display","block")
    })
    $("#modal-close-button").click(function(){
        $("#modal").css("display","none")
    })

    $(".edit-button").click(function(){
        $("#modal3").css("display","block")
    })
    $("#modal3-close-button").click(function(){
        $("#modal3").css("display","none")
    })
    
    $("#modal-check").click(function(){
        $("#modal").css("display","none")
    })
})


// Ajax modal
$(function(){

    $("#modal-close-button").click(function(){
        
        $("#parent-value").val("")
        $("#parent-name").val("");
        $("#sub-name").val("")
        $(".list-box").empty()
    })

    $("#modal-check").click(function(){
        $("#parent-value").val("")
        $("#parent-name").val("");
        $("#sub-name").val("")
        $(".list-box").empty()
    })

    $("#total-edit-button").click(function(){
        
        $.ajax(ajaxStart ={
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
                
                // modal2 삭제버튼 띄우기
                $(function(){
                    $(".remove-button").click(function(){
                        $("#modal2").css("display","block")
                    })
                    $("#modal2-close-button").click(function(){
                        $("#modal2").css("display","none")
                    })
                    $("#modal2-check").click(function(){
                        $("#modal2").css("display","none")
                    })
                    $("#modal2-cancel").click(function(){
                        $("#modal2").css("display","none")
                    })
                })

                // 더블클릭시 하위 카테고리 보이기 및 드래그 방지
                $(function(){
                    var a = $(".group-name")
                    var b = $(".category-list")
                    
                    a.dblclick(function() {
                        var c = $(".group-name").index(this) // 존재하는 모든 group-name 에서 this의 순서
                        var aa = $(".group-name label span")       
                        
                        if(b.eq(c).hasClass("hidden") == true){
                            b.eq(c).removeClass("hidden");
                            aa.eq(c).addClass("hidden");
                        }else{
                            b.eq(c).addClass("hidden");
                            aa.eq(c).removeClass("hidden");
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
                })

                //delete
                $(function(){

                    var a = $(".group-name")
                    var b = $(".category-name")
                    
                    var parentDelete = $(".parent-remove")
                    var subDelete = $(".sub-remove")

                    /*parent-delete */
                    parentDelete.click(function(){
                        var c = $(".parent-remove").index(this)
                        
                        var parentLabel = $(a).eq(c).children("label").text()
                        
                        var modal2Check = document.querySelector("#modal2-check");

                        modal2Check.onclick = function(){
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
                                    alert("카테고리가 남아있습니다!!!!!!")
                                }
                            })
                        }

                    })

                    subDelete.click(function(){
                        $("#modal2").css("display","block")

                        var c = $(".sub-remove").index(this)
                        var d = $(".category-list").index($(this).parents(".category-list"))

                        var subLabel = $(b).eq(c).children("label").text()
                        var parentLabel = $(a).eq(d).children("label").text()
                        
                        var modal2Check = document.querySelector("#modal2-check");

                        modal2Check.onclick = function(){
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
                        }
                    })

                })
            }
        });
        /*-------------------ajax 끝----------------------- */

    })

    /*-------------------total-button 끝----------------------- */

    
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
                    alert("이미 존재합니다")

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
                    alert("이미 존재합니다")
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
        $("#modal3-parent-after").val(parentBefore)
        
        var modal3Check = document.querySelector("#modal3-check")
        
        modal3Check.onclick = function(){
            var subAfter = $("#modal3-sub-after").val()

            var evt = new MouseEvent("click", {		
                "view":window,
                "bubbles":true,
                "cancelable":true
            });

            if($("#modal3-sub-after").val()==""){
                alert("카테고리명을 입력하세요")
            }else if(subBefore==""){
                alert("하위 카테고리가 없습니다")
            }else{

                $.ajax({
                    method:'POST',
                    url:'categoryUpdate',
                    data: {
                        "parentBefore":parentBefore, 
                        "subBefore":subBefore, 
                        "subAfter":subAfter},

                    success : function(){

                        $("#modal3").css("display","none")
                        
                        var categoryRequest = $("<a class='tmp hidden' href=''></a>")
                        $("html").append(categoryRequest)

                        var tmp = document.querySelector(".tmp")
                        tmp.dispatchEvent(evt)

                    },
                    error : function(){
                        alert("이미존재합니다")
                    }
                })
            }
        }
    })

})
           

