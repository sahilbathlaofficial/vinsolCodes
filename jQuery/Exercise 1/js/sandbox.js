/*
Author - Sahil Bathla
Description : -


    Select all of the div elements that have a class of "module".

    Come up with three selectors that you could use to get the third item in the #myList unordered list. Which is the best to use? Why?

    Select the label for the search input using an attribute selector.

    Figure out how many elements on the page are hidden

    Figure out how many image elements on the page have an alt attribute.

    Select all of the odd table rows in the table body.

*/

$(document).ready(function()
{

  // selected div of class module
  $('div.module').css('background-color','red');

  // 3 ways of selecting the 3rd child of myList
 
  $('#myList li:nth-child(3)').css('background-color','yellow');
  $('#listItem_2').next('li').css('background-color','green');
  //best way to do it
  $('#myListItem').css('background-color','grey'); 

  // Selecting label
  $('label[for="q"]').css('background-color','orange');
  
  //alert hidden elements
  alert("Hidden Elements : " + $(':hidden').length);
  
  //images with alt attribute
  alert("Images with alt attribute: " + $('img[alt]').length);

  //odd rows in table
  $('tbody tr:nth-child(2n+1)').css('background-color','yellow');


});


