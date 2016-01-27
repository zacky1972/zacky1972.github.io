/*! common.js for zacky1972.github.io copyright Susumu Yamazaki */

/* record url to Google Analytics when a hyperlink to another web site is clicked */ 
$(document).ready(function(){
	$("a").click(function () {
		var siteURL = /zacky1972\.github\.io/i;
		var url = $(this).attr("href");
		if (!siteURL.match(url)) {
			ga('send', 'pageview', {'page': url, 'location': url });
		}
	});
});
