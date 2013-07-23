/*
Author - Sahil Bathla
Description : -


    Select all of the image elements on the page; log each image's alt attribute.

    Select the search input text box, then traverse up to the form and add a class to the form.

    Select the list item inside #myList that has a class of "current" and remove that class from it; add a class of "current" to the next list item.

    Select the select element inside #specials; traverse your way to the submit button.

    Select the first list item in the #slideshow element; add the class "current" to it, and then add a class of "disabled" to its sibling elements.


*/

$(document).ready(function()
{

  var parentNode,firstSelect;
  // image elements and their alt attribute value
  $('img').each(function() {
    console.log($(this).attr('alt'));
    });

  // traverse upto form
  $(':input[type="text"]').closest('form').addClass('addedNewClass');

  //remove and add class current to list items of #myList
  $('#myList li.current').removeClass('current').next().addClass('current');

  //Select the select element inside #specials; traverse your way to the submit button
  $('#specials select').parents('#specials').find('input').css('background-color','red');
 
  // class current to element and disabled to siblings
  $('#slideshow li:first-child').addClass('current').siblings().addClass('disabled');
 


});


