/*
Author - Sahil Bathla
Description : - Load Content with JSON
*/

$(document).ready(function()
{
  var counter = 1, id = '';
  $('#container').append('<input type="button"></input>');
  $('#container').append('<h2>Top of Stack</h2>');
  $('#container').children().eq(0).attr({id:'addItem',value:'Add Item'}).click( function()
  {
    id = "divStack" + counter;
    itemText = "Stack Item #" + counter;
    $('#container h2').after('<div></div>');
    $('#container').children('div:first').attr('id',id).text(itemText);
    counter = counter + 1;
  });

  $('#container').delegate('div:first','click',function() {$(this).remove();});
  $('#container').delegate('div','click',function() { $(this).toggleClass('highlight'); });
  
});


