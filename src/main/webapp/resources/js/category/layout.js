
/*$(document).ready(function() {
	var t = null;
	var st = null;

	if (matchMedia("screen and (min-width: 480px)").matches) {
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
	}

	var open = $(".open");

	open.click(function() {

		var items = $(".floating-item");

		var x = [ {
			top : open.offset().top - 55 + "px",
			borderRadius : "0px"
		}, {
			top : open.offset().top - 105 + "px",
			borderRadius : "0px",
			borderBottom : "1px solid black"
		}, {
			top : open.offset().top - 155 + "px",
			borderRadius : "0px",
			borderBottom : "1px solid black"
		} ];

		for (var i = 0; i < items.length; i++)
			items.eq(i).css(x[i]);
	});
});*/
