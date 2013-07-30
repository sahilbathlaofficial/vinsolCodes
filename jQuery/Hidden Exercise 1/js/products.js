/*
Author - Sahil Bathla
Description : - Load Content with JSON
*/

//filtering results based on Brands Colors and availabilty

function filterBy(filter)
{
  var filterSelector = '';
  if( $('#filter' + filter + ' input:checked').length > 0)
  {
    $('#filter' + filter + ' :input').not(':checked').each( function()
    {
      filterSelector = '[data-' + filter.toLowerCase() + '="' + $(this).val() + '"]:visible';
      $(filterSelector).hide();
    });
  }
}
function filter()
{
  filterBy('Brand');
  filterBy('Color');
  //filter by availibility
  if( $('#available').prop('checked') )
  {
    $('#container img[data-sold-out="1"]').hide();
  } 
}

$(document).ready(function()
{

  var brands = '<p>Brand Name</p>',
      brand = '',
      brandColors = '<p>Brand Color</p>',
      color = '';

  // cache the JSON data into a variable dataJSON
  $.ajax({url: 'data/product.json',dataType: 'json', success : function(data)
    {
      dataJSON = data;
     // console.log(data);
      for(i = 0;i < dataJSON.length;i = i + 1)
      {
        //show images and addclasses
        url = 'images/' + dataJSON[i].url;
        brand = dataJSON[i].brand;
        color = dataJSON[i].color;
    
        $('#container').append('<img></img>').children().last().attr('src',url).attr({"data-brand":brand,"data-color":color})
        .attr('data-sold-out',dataJSON[i]["sold_out"]);

        //create filters by brand
        if(brands.indexOf(dataJSON[i].brand) === -1)
        {
          brands = brands + '<input type="checkbox" value="' + brand + '" /><label for="' + brand + '" >' + brand +
          '</label><br />';
        }
        //create filters by color
        if(brandColors.indexOf(dataJSON[i].color) === -1)
        {
          brandColors = brandColors + '<input type="checkbox" value="' + color + '" /><label for="' + color + '" >' +
          color + '</label><br />';
        }
      }

      // append brands and color filers and add event handlers
      $('#filterBrand').html(brands);
      $('#filterColor').html(brandColors);
      $('#leftPanel').delegate('input','click',function() 
      {
        $('#container img').show();
        filter();
      });
    }}).done(function() { console.log( "success" ); }).fail(function() { console.log("error"); });

});


