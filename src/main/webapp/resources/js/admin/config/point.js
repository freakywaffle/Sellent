$(function(){

    $("#save-button").click(function(){

        var arr = new Array()

        $(".pointConf-obj").each(function(index, obj){

            var content = $(".pointConf-obj").eq(index).children(".pointConf-content").text()
            var point = $(".pointConf-point").eq(index).val()
            var use = $(".pointConf-use").eq(index).children("input:checked").val()

            var aa = {
                "content":content, "point":point, "use":use
            }

            arr.push(aa)
        })

        $.ajax({
            method:'POST',
            url:'pointUpdate',
            data:JSON.stringify(arr),
            contentType : "application/json; charset=UTF-8",
            success:function(){
            	alert("저장완료")
            },
            error:function(){
            	alert("실패")
            }

        })


    })






})