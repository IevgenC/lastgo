window.onload = function() {
  var page_content = document.getElementsByClassName('temp_information')[0].getAttribute('data-temp')
  page_content = JSON.parse(page_content);
  document.getElementById('hero_json').value = JSON.stringify(page_content, null, 2);
}
;
