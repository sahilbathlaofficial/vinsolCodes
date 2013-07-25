/*
Author - Sahil Bathla
Description : -
    Set the value of the search input to the text of the label element
    Add a class of "hint" to the search input
    Remove the label element
    Bind a focus event to the search input that removes the hint text and the "hint" class
    Bind a blur event to the search input that restores the hint text and "hint" class if no search text was entered
*/

$(document).ready(function()
{

  //Remove the label element but save its text
  var hintText = $('label[for="q"]').remove().text();

  /*Set the value of the search input to the text of the label element 
    Add a class of "hint" to the search input
    Bind a focus event to the search input that removes the hint text and the "hint" class
  */

   $('.input_text').val(hintText).addClass('hint').bind('focus',function() 
  {
    if($(this).hasClass('hint')) 
    {
      $(this).val('').removeClass('hint');  
    }

  }).bind('blur',function() 
  {
      if($(this).val().trim().length === 0)
      {
        $(this).val(hintText).addClass('hint'); 
      }
  });

 
});


