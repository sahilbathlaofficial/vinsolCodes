/*
Author - Sahil Bathla
Description : -
    
    *Hide all of the modules.
    *Create an unordered list element before the first module.
    *Iterate over the modules using $.fn.each. 
      For each module, use the text of the h2 element as the text for a list item that you add to the unordered list element.
    *Bind a click event to the list item that:
        Shows the related module, and hides any other modules
        Adds a class of "current" to the clicked list item
        Removes the class "current" from the other list item
    *Finally, show the first tab.

*/


$(document).ready(function()
{
  var headingString = '';
  // Hide all of the modules
  $('.module').hide();
  //Create an unordered list element before the first module.
  $('.module:first').before('<ul id="moduleList"></ul>');
  //Iterate over the modules using $.fn.each.ext of the h2 element as the text for a list item that you add to the unordered list element.
  $('.module h2').each(function()
  {
    $('#moduleList').append('<li ref="' + $(this).parent().attr('id') + '">' + $(this).text() + '</li>');
  });
  //bind on click function to show corresponding data
  $('#moduleList li').bind('click',function()
  {
    elementToShow = '#' + $(this).attr('ref');
    $(elementToShow).show().siblings('.module').hide();
    $(this).addClass('current').siblings().removeClass('current');
  });
  //Showing the first tab
  $('.module:first').show();
});


