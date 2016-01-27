/*! common.js for zacky1972.github.io copyright Susumu Yamazaki */
$(document).ready(function(){
	$("a").click(function () {
		ga('send', 'pageview', {'page': $(this).attr("href"), 'title':$(this).attr("href")}); 
	});
});
