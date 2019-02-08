//madal-회원등록
window.addEventListener("load",function(){
    var modal = document.querySelector("#modal");
    var startBtn = document.querySelector(".category-sub .reg-button");
    var endBtn = document.querySelector("#modal .cancel-button");


    startBtn.onclick = function(){
        modal.style.display = "block";
    }

    endBtn.onclick = function(){
        modal.style.display = "none";
    }

})

//modal-이메일
window.addEventListener("load",function(){
    var modal2 = document.querySelector("#modal2");
    
    var startBtn = document.querySelectorAll(".mail-button");
    var endBtn = document.querySelector("#modal2 .cancel-button");

    for(var i  =0; i<startBtn.length; i++){
        startBtn[i].onclick = function(){
            modal2.style.display = "block";
        }
    }

    endBtn.onclick = function(){
        modal2.style.display = "none";
    }

})