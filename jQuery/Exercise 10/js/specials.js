/*
Author - Sahil Bathla
Description : - Load Content with JSON
*/

$(document).ready(function()
{
  // cache the JSON data into a variable dataJSON
  $.getJSON('data/specials.json',function(data)
    {
      dataJSON = data;
    }).done(function() { console.log( "success" ); }).fail(function() { console.log("error"); })

  // create target div  
  $('#specials form').after('<div id="targetDiv"></div>');
  
  // remove submit form 
   $('#specials form').find(':input[type="submit"]').parent().remove();

  // On change add JSON Data corresponding to day
  $('#specials form select').bind('change',function() {
  var optionSelected = $('#specials form  option:selected').text().toLowerCase();
  $('#targetDiv').html(dataJSON[optionSelected].title + '<br />' + dataJSON[optionSelected].text);  
  });
  
 
});


