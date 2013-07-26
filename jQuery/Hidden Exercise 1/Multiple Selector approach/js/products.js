/*
Author - Sahil Bathla
Description : - Load Content with JSON
*/

//filtering results based on Brands Colors and availabilty

function filterByColor(currentBrand)
{
  var overallSelector = '', color = '';
  $('#filterColors :checked').each( function()
  {
    color = '[data-color="' + $(this).attr("data-value") + '"],';
    overallSelector = overallSelector + currentBrand +  color ;
  });
  return (overallSelector);

}
function filter()
{
   
  var selectorString = '',brand = '' ;
  
  if ($('#filterBrands :checked').length > 0)
  {
    $('#filterBrands :checked').each( function()
    {
      brand  =  '[data-brand="' + $(this).attr('data-value') + '"]';
      if ($('#filterColors :checked').length !== 0)
      {
        selectorString = selectorString + filterByColor(brand); 
      }
      else
      {
        selectorString = selectorString + brand + ','; 
      }
    });
  }
  else
  {
    if ($('#filterColors :checked').length > 0)
    {
      selectorString = filterByColor(selectorString);
    }
  }

  selectorString = selectorString.slice(0,-1);
  // view the multiple selector string formed
  console.log(selectorString);
  $('#container img' + selectorString).show();
  //filter by availibility
  if( $('#available:checked').length > 0 )
  {
    $('#container img[sold_out="1"]').hide();
  } 
}

$(document).ready(function()
{

  var brands = '<p>Brand Name</p>',
      brandID = '',
      brandColors = '<p>Brand Color</p>',
      brandColor = '';

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
        .attr('sold_out',dataJSON[i]["sold_out"]);

        //create filters by brand
        if(brands.indexOf(dataJSON[i].brand) === -1)
        {
          brands = brands + '<input type="checkbox" data-value="' + brand + '" /><label for="' + brand + '" >' + brand +
          '</label><br />';
        }
        //create filters by color
        if(brandColors.indexOf(dataJSON[i].color) === -1)
        {
          brandColors = brandColors + '<input type="checkbox" data-value="' + color + '" /><label for="' + color + '" >' +
          color + '</label><br />';
        }
      }

      // append brands and color filers and add event handlers
      $('#filterBrands').html(brands);
      $('#filterColors').html(brandColors);
      $('#leftPanel').delegate('input','click',function() 
      {
        $('#container img').hide();
        filter();
      });
    }}).done(function() { console.log( "success" ); }).fail(function() { console.log("error"); });

});


