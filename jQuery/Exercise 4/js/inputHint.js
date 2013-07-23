/*
Author - Sahil Bathla
Description : -
    Set the value of the search input to the text of the label element
    Add a class of "hint" to the search input
    Remove the label element
    Bind a focus event to the search input that removes the hint text and the "hint" class
    Bind a blur event to the search input that restores the hint text and "hint" class if no search text was entered
*/
function toggleValue(originalValue,valueToToggle)
{
  if (originalValue === '')
   {
      return valueToToggle;
   }
   else
   {
       return '';
   }
}

$(document).ready(function()
{
  hintText = $('label[for="q"]').text();
  //Set the value of the search input to the text of the label element
  $(':input[name="q"]').val(hintText);
  //Add a class of "hint" to the search input
  $(':input[name="q"]').addClass('hint');
  //Remove the label element
  $('label[for="q"]').remove();
  // Bind a focus event to the search input that removes the hint text and the "hint" class
  $(':input[name="q"]').bind('focus blur',function() 
  {
    if ($(this).val().trim() === '' || $(this).val() === hintText)
    {
      $(this).val(toggleValue($(this).val(),hintText));
      $(this).toggleClass('hint');
    }
  });
});


