window.addEventListener("load",function(){

    var modal = document.querySelector("#modal");
    var startBtn = document.querySelectorAll(".point-button")
    var endBtn = document.querySelector("#modal .cancel-button")

    for(var i=0; i<startBtn.length; i++){
        startBtn[i].onclick = function(){
            modal.style.display = "block";
        }
    }

    endBtn.onclick = function(){
        modal.style.display = "none";
    }

})