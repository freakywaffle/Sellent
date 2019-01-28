window.addEventListener("load",function(){

    var modal = document.querySelector("#modal");
    var editBtn = document.querySelectorAll(".edit-button");
    var regBtn = document.querySelector(".reg-button");
    var cancelBtn = modal.querySelector(".cancel-button");

    for(var i = 0; i<editBtn.length;i++){

        editBtn[i].onclick = function(){
            modal.style.display = "block";  
          };
    }

    regBtn.onclick = function(){
        modal.style.display = "block";  
    }
    
    cancelBtn.onclick = function(){
        modal.style.display = "none";
    }


});