window.onload = function()
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


}


