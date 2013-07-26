/*
Author - Sahil Bathla
Description : - Load Content with JSON
*/

function doJSONAjax() {
    var result="";
    $.ajax({url: 'data/specials.json',dataType: 'json',async :false, success : function(data)
    {
        result = data;
    }}).done(function() { console.log( "success" ); }).fail(function() { console.log("error"); });
   return result;
}

$(document).ready(function()
{
  var dataJSON = []
  var optionSelected = '';
 
  // create target div  & remove submit form 
  $('#specials form').after('<div id="targetDiv"></div>').find(':input[type="submit"]').parent().remove();

  // On change add JSON Data corresponding to day
  $('#specials form select').bind('change',function() 
  {
    if(dataJSON.length === 0)
    {
      // cache the JSON data into a variable dataJSON (length now would be undefined or >0 instead of 0)
      dataJSON = doJSONAjax();
    }
    // get the option selected
    optionSelected = $(this).val();
    // put the values in the target div
    if ( dataJSON[optionSelected] === undefined )
    {
      $('#targetDiv').html('');
    }
    else
    {
      $('#targetDiv').html(dataJSON[optionSelected].title + '<br />' + dataJSON[optionSelected].text);  
    }

  });
  
 
});


