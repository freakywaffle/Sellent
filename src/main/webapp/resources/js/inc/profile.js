window.addEventListener("load",function(){
	var modal = document.querySelector(".modal");
	var closebtn = document.querySelector(".close-button2");
	var profile = document.querySelector(".prof");
    function toggleModal() {
	    modal.classList.toggle("show-modal");
	 }
	
	profile.addEventListener("click",function(){
		toggleModal();
		alert('hi');
		//var user = document.querySelector(".mobile-hidden").innerText;
	});
	closebtn.addEventListener("click", toggleModal);
});
