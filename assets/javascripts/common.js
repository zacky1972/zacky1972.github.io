/*! common.js for zacky1972.github.io copyright Susumu Yamazaki */
$(document).ready(function(){
	$("a").click(function () {
		var url = $(this).attr("href");
		if (url != "//zacky1972.github.io/") {
			ga('send', 'pageview', {'page': url, 'title': url });
		}
	});
});
