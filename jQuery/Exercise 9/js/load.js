/*
Author - Sahil Bathla
Description : - AJAX Load
*/

$(document).ready(function()
{
  var targetURL = '';
  $('#blog h3').each( function(index)
  {
    $(this).after('<div></div>');
    var reference = $(this).next();
    $.data(this,'ref',reference); 

  }).click( function(event)
      {
        event.preventDefault();
        targetURL = $(this).children('a:first').attr('href');
        targetURL = 'data/'+ targetURL.replace('#',' #');
        $.data(this,'ref').load(targetURL);
      })
});


