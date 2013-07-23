/*
Author - Sahil Bathla
Description : - Load Content with JSON
*/

$(document).ready(function()
{
  var dataJSON = []
  var optionSelected = '';
  // cache the JSON data into a variable dataJSON
  $.ajax({url: 'data/specials.json',dataType: 'json', success : function(data)
    {
      dataJSON = data;
    }}).done(function() { console.log( "success" ); }).fail(function() { console.log("error"); })


  // create target div  & remove submit form 
  $('#specials form').after('<div id="targetDiv"></div>').find(':input[type="submit"]').parent().remove();

  // On change add JSON Data corresponding to day
  $('#specials form select').bind('change',function() {
  optionSelected = $('#specials form  option:selected').text().toLowerCase();

  // html('') in case user selects the default (select) which is not in JSON data
  $('#targetDiv').html('').html(dataJSON[optionSelected].title + '<br />' + dataJSON[optionSelected].text);  
  });
  
 
});


