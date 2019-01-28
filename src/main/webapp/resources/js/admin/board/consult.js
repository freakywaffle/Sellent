window.addEventListener("load",function(){

    
    var btn = document.querySelectorAll(".tbody button");
    var modal = document.querySelector("#modal");
    var checkBtn = modal.querySelector(".check-button");
    var cancelBtn = modal.querySelector(".cancel-button");


    for(var i=0; i<btn.length;i++){
        btn[i].onclick = function(){
            modal.style.display = "block";
        }
    }

    checkBtn.onclick = function(){
        modal.style.display = "none";
    }

    cancelBtn.onclick = function(){
        modal.style.display = "none";
    }

})