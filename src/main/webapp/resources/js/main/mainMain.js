window.addEventListener("load",function(){
	var slideIndex = 0;
	carousel();

	function carousel() {
	    var i;
	    var x = document.getElementsByClassName("myslides");
	    for (i = 0; i < x.length; i++) {
	      x[i].style.display = "none"; 
	    }
	    slideIndex++;
	    if (slideIndex > x.length) {slideIndex = 1} 
	    x[slideIndex-1].style.display = "block"; 
	    x[slideIndex-1].style.transition = '0ms';
	    setTimeout(carousel, 2500); 
	}
});