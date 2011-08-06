// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
document.observe("dom:loaded", function() {
  wordCount();
  $('micropost_content').observe("keyup", function() {
    wordCount();
  });
});
function wordCount() {
  var limit = 140;
  var count = $('micropost_content').getValue().length;
  $('count').update(limit - count);
  if(count >= limit - 10) {
    $('count').setStyle({ color: '#dd0000' });
  } else {
    $('count').setStyle({ color: '#ccc' });
  }
}
