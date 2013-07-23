/*
Author - Sahil Bathla
Description : -
    Clicking on a headline in the #blog div should slide down the excerpt paragraph
    Clicking on another headline should slide down its excerpt paragraph, and slide up any other currently showing excerpt paragraphs..
*/


$(document).ready(function()
{

  $('#blog h3').click( function(event) 
  {
    event.preventDefault();
    $('#blog p:visible').slideUp(500);
    $(this).next().slideDown(500);
  });

});


