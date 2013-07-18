/*
Author - Sahil Bathla
Description : - Slideshow
*/
function slideShow()
{
  count = count + 1;
  navigationString = count + " of " + lengthOfSlideShow;
  $('#pages').text(navigationString);

  slideShowElement.first().fadeIn(1000).delay(1000).fadeOut(function()
  { 
    if (flagPrevious === true)
    {
      flagPrevious = false;
    }
    else if(count !== lengthOfSlideShow)
    {
      slideShowElement = slideShowElement.next();
      slideShow(slideShowElement);
    }
    else
    {
      slideShowElement = slideShowElement.parent().children('li').first();
      count = 0;
      slideShow(slideShowElement);
    }
  });
}

$(document).ready(function()
{
  count = 0; lengthOfSlideShow = $('#slideshow li').length,flagPrevious = false;
  slideShowElement = $('#slideshow li').first();

  //prepend slideshow
  $('body').prepend($('#slideshow'));
  
  //navigation panel
  $('#slideshow').append('<div id="navSlides"><span id="previous">&lt; Previous </span><span id="pages"></span><span id="next"> Next ></span></div>');
    
  //fadein fadeout listitems
  $('#slideshow li').hide();
  slideShow(slideShowElement);

  //previous
  $('#previous').click( function() 
  {
    flagPrevious = true;
    // count = count - 2 as slideShow function will increment count by 1
    count = count - 2;
    // finish current animation 
    slideShowElement.finish();
    if(count === -1)
    {
      slideShowElement = slideShowElement.parent().children('li').last();
      count = lengthOfSlideShow - 1;
    }
    else
    {
      slideShowElement = slideShowElement.prev();
    }
    slideShow(slideShowElement);
  });

  //next implementation not done as the slide show automatically shows the next slide
 
});


