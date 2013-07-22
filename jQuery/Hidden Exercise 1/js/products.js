/*
Author - Sahil Bathla
Description : - Load Content with JSON
*/

function filterBy(data)
{
  selector = '#filter' + data + ' :input:checked';
 if ($(selector).length > 0 )
  {
   selector = '#filter' + data + ' :input';
   $(selector).not(':checked').each( function()
    {
    classToShow = '.'+ this.id;
    $(classToShow).hide();
    }); 
  }
}
//filtering results based on Brands Colors and availabilty
function filter()
{
   
  filterBy('Brands');
  filterBy('Colors');

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
        brandId = dataJSON[i].brand.replace(/ /g,'');
        brandColor = dataJSON[i].color;
    
        $('#container').append('<img></img>').children().last().attr('src',url).addClass(brandId).addClass(brandColor)
        .attr('sold_out',dataJSON[i]["sold_out"]);

        //create filters by brand
        if(brands.indexOf(dataJSON[i].brand) === -1)
        {
          brands = brands + '<input type="checkbox" id="' + brandId + '" /><label for="' + brandId + '" >' + dataJSON[i].brand +
          '</label><br />';
        }
        //create filters by color
        if(brandColors.indexOf(dataJSON[i].color) === -1)
        {
          brandColors = brandColors + '<input type="checkbox" id="' + brandColor + '" /><label for="' + brandColor + '" >' +
          dataJSON[i].color + '</label><br />';
        }
      }

      // append brands and color filers and add event handlers
      $('#filterBrands').html(brands);
      $('#filterColors').html(brandColors);
      $('#leftPanel').delegate('input[type="checkbox"]','click',function() 
      {
        $('#container img').show();
        if ($(':input[type="checkbox"]:checked').length > 0 )
        {
          filter();
        }
    
      });
    }}).done(function() { console.log( "success" ); }).fail(function() { console.log("error"); });

    //toggle between available and all items
    $('#filterAvailability input').click(function() 
    { 
      if(this.checked === true)
      {
        $(this).parent().children('input').not(this).prop('checked',false);
      }
      else
      {
        $(this).parent().children('input').not(this).prop('checked',true);
      }
    });
});


