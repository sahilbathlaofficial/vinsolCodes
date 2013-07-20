/*
Author - Sahil Bathla
Description : - Load Content with JSON
*/

$(document).ready(function()
{
  counter = 1, id = '';
  $('#container').append('<input type="button"></input>');
  $('#container').append('<h2>Top of Stack</h2>');
  $('#container').children().eq(0).attr({id:'addItem',value:'Add Item'}).click( function()
  {
    id = "divStack" + counter;
    $('#container').append('<div></div>').children().last().attr('id',id).text("New Stack Item");
    counter = counter + 1;
  });

  $('#container').delegate('div:first','click',function() { console.log($(this)); $(this).remove(); });
  $('#container').delegate('[id*="divStack"]','click',function() { $(this).toggleClass('highlight'); });
  



  
  
 
});


