
$(document).ready( function(event) {
  //find the hash
  hash = window.location.hash.replace('#','');
  //if hash not null
  if(hash !== '' )
  {
    $('a:contains("' + hash + '")').addClass('selectedLink active');
  }

    $('.accordion li a').click( function(event) { 
        $('.selectedLink').removeClass('selectedLink');
        window.location.hash =  $(this).text();
        if(!$(this).hasClass('dcjq-parent'))
        {
          $('a:contains("' + $(this).text() + '")').addClass('selectedLink active');
          event.preventDefault();
          window.location = $(this).attr('href') + window.location.hash;
        }
        
        
      });

});
