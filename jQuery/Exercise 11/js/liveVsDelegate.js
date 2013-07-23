/*
Author - Sahil Bathla
Description : - Load Content with JSON
*/

$(document).ready(function()
{
  var counter = 1, id = '';
  $('#container').append('<input type="button" id="addItem" value="Add Item"></input>');
  $('#container').append('<h2>Top of Stack</h2>');
  $('#container :nth-child(1)').click( function()
  {
    divClass = "divStack";
    itemText = "Stack Item #" + counter;
    divHTML = '<div class="' + divClass + '">' + itemText + '</div>';
    $('#container h2').after(divHTML);
    counter = counter + 1;
  });

  $('#container').delegate('.divStack:first','click',function() {$(this).remove();});
  $('#container').delegate('.divStack','click',function() { $(this).toggleClass('highlight'); });
  
});


