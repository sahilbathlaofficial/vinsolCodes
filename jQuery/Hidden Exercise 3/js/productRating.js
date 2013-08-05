/*
Author - Sahil Bathla
Description : - Product Ratings
*/


function createRadioButtons(ratings,products)
{
  for (i = 0; i < products.length ; i  = i + 1)
  {
    for (j = 0; j < ratings.length ; j  = j + 1)
    {
      $('[data-ratings="' + ratings[j] + '"]').append('<br /><input type="radio" data-ratingValue="' + ratings[j] + '"'
      + 'data-productValue="' + products[i] + '"/>');
    }
  }
  
}
function createDiv(item,itemClass)
{
  var divHTML = '';
  for(i = 0;i < item.length;i = i + 1)
  {
    divHTML = divHTML + '<div class="' + itemClass + '" data-' + itemClass + '="' + item[i] + '" ><span>' + item[i] + '</span></div>';
  }
  return divHTML;
}

$(document).ready( function()
{
  var ratingHTML = '',checkedProduct = '',checkedRating = '',selectedRadio = {},product = {};
  var products =['Coffee','Tea','Sodas'];
  var ratings = ['Love it','Like it','No Views','Dislike it','Abhor it'];
  if(products.length > 0)
  {
   $('#productList').append(createDiv(products,'products'));
   $('#container').append(createDiv(ratings,'ratings'));
   createRadioButtons(ratings,products)
  }
  // on product click
  $('#container').delegate('.products','click',function() {
    $('.products span, .ratings span').removeClass('highlight');
    checkedProduct = $(this).attr('data-products');
    // if choosen product already rated highlight the rating he gave earlier 
    product = $('[data-productValue="' + checkedProduct + '"]:checked');
    if ( product.length === 1)
    {
      $('[data-ratings = "' + product.attr("data-ratingValue") + '"] span').addClass('highlight');
    }
    $(this).children('span').eq(0).addClass('highlight');
  });
  // on rating click
  $('#container').delegate('.ratings span','click',function() {
    if(checkedProduct !== '')
      {
        checkedRating = $(this).parent().attr('data-ratings');
        $('.ratings span').removeClass('highlight');
        $(this).addClass('highlight');
        $('[data-productValue="' + checkedProduct + '"]').prop('checked',false);
        $('[data-ratingValue="' + checkedRating + '"][data-productValue="' + checkedProduct + '"]').prop('checked',true);
      }
  });
  // on radio button clicked
  $('#container').delegate(':input[type="radio"]','click', function(event) {
    event.stopPropagation();
    selectedRadio = $(this);
    checkedRating = $(selectedRadio).attr('data-ratingValue');
    checkedProduct = $(selectedRadio).attr('data-productValue');
    //remove any other ratings
    $('[data-productValue = "' + checkedProduct + '"]:checked').not(selectedRadio).prop('checked',false);
    //highlight corresponding product and rating  
    $('.products span,.ratings span').removeClass('highlight');
    $('[data-products="' + checkedProduct + '"] span,[data-ratings="' + checkedRating + '"] span').addClass('highlight');

   });
  

});

