/*
  Author - Sahil Bathla
  Description - Prompt and Redirect to URL
  Version - 1.0
*/




window.onload = function () 
{

 var url = prompt('Enter url to open (i.e. xyz.com)','google.com');
 url = "http://www." + url;
 var newWindow = window.open(url,'_blank','width=400,height=450,menubar=no,scrollbars=no,status=0,toolbar=0,titlebar=0');
  newWindow.document.body.style.overflow = 'hidden';
  
}

