/*
Author - Sahil Bathla
Description : - AJAX Load
*/

$(document).ready(function()
{
  $('#blog h3').each( function(){
  $(this).after('<div></div>');
  var reference = $(this).next();
  $.data(this,'ref', reference); 

    $(this).click( function(event)
    {
      event.preventDefault();
      target = 'data/'+ $(this).children('a').attr('href');
      $.data(this,'ref').load(target);
    });

  });
 
});


