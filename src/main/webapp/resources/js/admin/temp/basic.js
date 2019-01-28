$(document).ready(function() {
	var t = null;
	var st = null;
	$(window).scroll(function() {
		var scrollOffset = $(".floating-bar").offset();
		var footerOffset = $("#footer").offset();

		if (scrollOffset.top + 250 >= footerOffset.top - 20) {
			if (t == null) {
				t = footerOffset.top - 20 - 250;
				st = $(document).scrollTop();
			}
			$(".floating-bar").css({
				position : "absolute",
				top : t - 160 + "px"
			});
		}

		if (st != null) {
			if ($(document).scrollTop() < st)
				$(".floating-bar").css({
					position : "fixed",
					top : "600px"
				});

		}

	});
});