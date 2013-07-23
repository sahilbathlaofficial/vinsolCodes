/*
Author - Sahil Bathla
Description : - Slideshow
*/

function previousSlide(event)
{
    flagPrevious = true;
    // count = count - 2 as slideShow function will increment count by 1
    count = count - 2;
    // finish current animation 
    slideShowElement.finish();
    if(count === -1)
    {
      slideShowElement = slideShowElement.parent().children('li').last();
      count = event.data.lengthOfSlideShow - 1;
    }
    else
    {
      slideShowElement = slideShowElement.prev();
    }
    slideShow(event.data.lengthOfSlideShow);
}

function slideShow(lengthOfSlideShow)
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
      slideShow(lengthOfSlideShow);
    }
    else
    {
      slideShowElement = slideShowElement.parent().children('li').first();
      count = 0;
      slideShow(lengthOfSlideShow);
    }
  });
}

$(document).ready(function()
{
  var lengthOfSlideShow = $('#slideshow li').length;

  // some global variables which are required in onClick event & are in the recursive callback of fadeOUT
  count = 0,flagPrevious = false,slideShowElement = $('#slideshow li').first();

  //prepend slideshow
  $('body').prepend($('#slideshow').append('<div id="navSlides"><span id="previous">&lt; Previous </span><span id="pages"></span>' +
  '<span id="next"> Next ></span></div>'));
    
  $('#slideshow li').hide();

  slideShow(lengthOfSlideShow);

  //previous navigation
  $('#previous').bind('click',{lengthOfSlideShow:lengthOfSlideShow},function(event) 
  {
    previousSlide(event);
  });

  //next implementation not done as the slide show automatically shows the next slide 
});


