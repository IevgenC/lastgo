// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

//var data = {
//    0: "Desc 0",
//    1: "Desc 1",
//    2: "Desc 2",
//    3: "Desc 3"
//};

//function showDiv(data_id, desc_id) {
//    document.getElementById(desc_id).innerHTML = data[data_id];
//}

var page_content;
$.get( "/assets/thrall.json", function(data){
    page_content = data;
});

function getImage(id) {
	document.getElementById(id).src = page_content['talents'][id]['talent_image'];
}

function showText(name_id, text_id, element_id){
	document.getElementById(name_id).innerHTML = page_content['talents'][element_id]['talent_name'];
	document.getElementById(text_id).innerHTML = page_content['talents'][element_id]['talent_desc'];
}

$(document).ready(function() {
$('img').click(function(){
    $(this).siblings('img').removeClass('selected');
    $(this).addClass('selected');
});
});
