window.addEventListener("load",function(){
    
    var saveBtn = document.querySelector("#save-button");
    var radio1 = document.querySelectorAll(".div-radio input:nth-of-type(1)");
    var radio2 = document.querySelectorAll(".div-radio input:nth-of-type(2)");

    saveBtn.onclick = function(){
        
    }

    for(var i=0; i<radio1.length;i++){

         radio1[i].setAttribute('name', 'use'+i);
         radio2[i].setAttribute('name', 'use'+i);
              
    }
})