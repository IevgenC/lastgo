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
var page_url = window.location.href;

var json = page_url.substr(page_url.lastIndexOf('/') + 1);

if (json.includes('#')) {
  json = json.split('#')[0];
} 

$.get( "/assets/" + json + ".json", function(data){
    page_content = data;
});

function getImage(id) {
	document.getElementById(id).src = page_content['talents'][id]['talent_image'];
}

function showText(name_id, text_id, element_id){
	document.getElementById(name_id).innerHTML = page_content['talents'][element_id]['talent_name'];
	document.getElementById(text_id).innerHTML = page_content['talents'][element_id]['talent_desc'];
}

function showComment(title_name, desc_name, element_id){
  document.getElementById(title_name).innerHTML = page_content['talents'][element_id]['comment_name'];
  document.getElementById(desc_name).innerHTML = page_content['talents'][element_id]['comment_desc']; 
}

$(document).ready(function() {
$("img[class='talent']").click(function(){
    $(this).siblings('img').removeClass('selected');
    $(this).addClass('selected');
});
});

function jumpto(anchor){
	var url = window.location.href
	var anchor_lvl = anchor.split('t')[0]; 
	var anchor_regexp = new RegExp(anchor_lvl + '...');
	if (url.includes(anchor)) {

  } else if (url.includes(anchor_lvl)) {
        window.location.href = url.replace(anchor_regexp, anchor);
  } else if (url.includes('#')) {
 		window.location.href += anchor;
 	} else {
 		window.location.href += "#"+anchor;
  }    
}

window.onload = function() {
  if (window.location.href.includes('#')) {
  	var url = window.location.href;
  	var params = url.split('#')[1].split('+');
  	for (let param of params) {
   	  document.getElementById(param).className += ' ' + 'selected';
      var level = param.split('t')[0];
      var name = level + "_name"
      var description = level + "_description"
      var comment_name = level + "_comment_title"
      var comment_desc = level + "_comment_desc"
      showText(name, description, param);
      showComment(comment_name, comment_desc, param);
  	}
  }
}
