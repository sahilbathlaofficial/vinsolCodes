/*
Author - Sahil Bathla
Description : -

    Hovering over an item in the main menu should show that item's submenu items, if any.

    Exiting an item should hide any submenu items.
*/


$(document).ready(function()
{

  $('#nav li').hover( function()
  {
    $(this).toggleClass('hover').children('ul').toggleClass('hover');
  });

});


