//1st part of hash denotes the parent and second part denotes the child
$(window).load( function(event) {
  //find the hash
  hash = window.location.hash.replace('#','');
  //if hash not null
  if(hash !== '' )
  {
    var parent = hash.split('c')[0];
    var child = hash.split('c')[1];
    $('.dcjq-parent').each( function(index) {
      if( index === parseInt(parent,10))
      {
        $(this).parents('.accordion').show();
        $(this).next().show().find('a').eq(parseInt(child,10)).addClass('selectedLink');
      }
    });
  }

    $('.accordion li a').click( function(event) { 
        $('.selectedLink').removeClass('selectedLink');
        if ($(this).hasClass('dcjq-parent'))
        {
          index = $('.dcjq-parent').index($(this));
          window.location.hash =  index;
        }
        else
        {
          // find index of this clicked a which has no further links
          window.location.hash = window.location.hash + 'c' + $(this).closest('.accordion').find('a').index($(this));
          $(this).addClass('selectedLink');
          event.preventDefault();
          window.location = $(this).attr('href') + window.location.hash;
        }
        
        
      });

});
