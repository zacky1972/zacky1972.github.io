/*! common.js for zacky1972.github.io copyright Susumu Yamazaki */

/* record url to Google Analytics when a hyperlink to another web site is clicked */ 
$(document).ready(function(){
	$("a").click(function () {
		var url = $(this).attr("href");
		if (url != "//zacky1972.github.io/") {
			ga('send', 'pageview', {'page': url, 'location': url });
		}
	});
});
