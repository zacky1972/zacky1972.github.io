/*! common.js for zacky1972.github.io copyright Susumu Yamazaki */
$(document).ready(function(){
	$("a").click(function () {
		$(this).slideUp(); 
	});
    $("a").hover(function () {
    	$(this).addClass("hilite");
    }, function () {
    	$(this).removeClass("hilite");
    });
});
