//Ver mas
$(".show-more a").on("click", function() {
  var $this = $(this);
  var $content = $this.parent().prev("div.content");
  var linkText = $this.text().toUpperCase();

  if(linkText === "SHOW MORE"){
    linkText = "Show less";
    $content.switchClass("hideContent", "showContent", 400);
  } else {
    linkText = "Show more";
    $content.switchClass("showContent", "hideContent", 400);
  };

  $this.text(linkText);
});

///validate length of the post
function trimfield(str)
{
  return str.replace(/^\s+|\s+$/g,'');
}

function validate_form()
{
 var obj1 = document.input_body.text_area_body;
 if(trimfield(obj1.value) == '')
 {
   alert("Please Provide Details!");
   obj1.focus();
   return false;
 }
 else
   return true;
}
/*Initialize tabs*/
  $(document).ready(function(){
    $('ul.tabs').tabs();
  });