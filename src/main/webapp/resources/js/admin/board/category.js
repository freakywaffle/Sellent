



/*modal */
window.addEventListener("load", function(){

    /*modal-----------------------------*/
    var editBtn = document.querySelector(".edit-btn");

    var modal = document.querySelector("#modal");
    var check = modal.querySelector(".check-button");
    var close = modal.querySelectorAll(".cancel-button");

    editBtn.onclick = function(){

        modal.style.display = "block";

    };

    check.onclick = function(){
        modal.style.display = "none";
    }

    for(var i = 0; i<close.length; i++){
        close[i].onclick = function(){
            modal.style.display = "none";
        }
    }

});

/*modal2 */
window.addEventListener("load",function(){

    var modal = document.querySelector("#modal");
    var addBtn = modal.querySelector(".parent-check .add-button");

    var modal2 = document.querySelector("#modal2");
    var checkBtn = modal2.querySelector(".check-button");
    var cancelBtn = modal2.querySelector(".cancel-button");

    addBtn.onclick = function(){

        modal2.style.display = "block";

    }

    checkBtn.onclick = function(){
        modal2.style.display = "none";
    }

    cancelBtn.onclick = function(){
        modal2.style.display = "none";
    }

})

/*modal3 */
window.addEventListener("load",function(){

    var modal = document.querySelector("#modal");
    var addBtn = modal.querySelector(".child-check .add-button");
    
    var modal3 = document.querySelector("#modal3");
    var checkBtn = modal3.querySelector(".check-button");
    var cancelBtn = modal3.querySelector(".cancel-button");

    addBtn.onclick = function(){

        modal3.style.display = "block";

    }

    checkBtn.onclick = function(){
        modal3.style.display = "none";
    }

    cancelBtn.onclick = function(){
        modal3.style.display = "none";
    }
})

/*modal4 */
window.addEventListener("load",function(){

    var modal4 = document.querySelector("#modal4");
    var deleteBtn = document.querySelectorAll(".delete-button");
    var yesBtn = modal4.querySelector(".yes-button");
    var noBtn = modal4.querySelector(".no-button");


    for(var i=0; i<deleteBtn.length; i++){
        deleteBtn[i].onclick = function(){
            modal4.style.display = "block";
        }
    }

    yesBtn.onclick = function(){
        modal4.style.display = "none";
    }

    noBtn.onclick = function(){
        modal4.style.display = "none";
    }

})