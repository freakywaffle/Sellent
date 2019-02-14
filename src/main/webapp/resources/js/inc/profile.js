window.addEventListener("load",function(){
	var modal = document.querySelector(".modal");
	var closebtn = document.querySelector(".close-button");
	var profile = document.querySelector(".prof");
    function toggleModal() {
	    modal.classList.toggle("show-modal");
	 }
	
	profile.addEventListener("click",function(){
		toggleModal();
		//var user = document.querySelector(".mobile-hidden").innerText;
		//alert(user);
	});
	closebtn.addEventListener("click", toggleModal);
});
