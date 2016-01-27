/*! common.js for zacky1972.github.io copyright Susumu Yamazaki */
$(document).ready(function(){
	$("p").click(function () {
		$(this).slideUp(); 
	});
    $("p").hover(function () {
    	$(this).addClass("hilite");
    }, function () {
    	$(this).removeClass("hilite");
    });
});
