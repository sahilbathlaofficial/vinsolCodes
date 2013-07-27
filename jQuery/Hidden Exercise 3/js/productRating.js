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
  var ratingHTML = '',checkedProduct = '',checkedRating = '',selectedRadio = {};
  var products =['Coffee','Tea','Sodas'];
  var ratings = ['Love it','Like it','No Views','Dislike it','Abhor it'];
  if(products.length > 0)
  {
   $('#productList').append(createDiv(products,'products'));
   $('#container').append(createDiv(ratings,'ratings'));
   createRadioButtons(ratings,products)
  }
  $('#container').delegate('.products,.ratings','click',function() {
    if ($(this).hasClass('products'))
    {
      $('.products span').removeClass('highlight');
      $(this).children('span').eq(0).addClass('highlight');
    }
    else if ($(this).hasClass('ratings'))
    {
      $('.ratings span').removeClass('highlight');
      $(this).children('span').eq(0).addClass('highlight');
    }
    if( $('.products .highlight').length === 1 && $('.ratings .highlight').length === 1)
    alert('yo');
  });

  $('#container').delegate(':input[type="radio"]','change', function(event) {
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

