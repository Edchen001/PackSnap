// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(function(){
	$("#geocomplete").geocomplete({
		map: ".map_canvas",
		details: "#map_info",
		detailsAttribute: "data-geo"
	});

	$("#find").click(function(){
		$("#geocomplete").trigger("geocode");
	});
});

$(document).ready(function() {

   $('.banner').unslider({
    speed: 400,
    complete: function() {},
    keys: true,
    fluid: true
  });
   var unslider = $('.banner').unslider(),
         data = unslider.data('unslider');
    window.onload = function () {  data.move(0); }
})
