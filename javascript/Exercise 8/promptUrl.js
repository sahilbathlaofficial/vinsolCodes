/*
  Author - Sahil Bathla
  Description - Prompt and Redirect to URL
  Version - 1.0
*/




window.onload = function () 
{

  var url = '';
  while(url === '')
  {
    url = prompt('Enter url to open (i.e. xyz.com)','http://www.google.com');
    if(url === '')
    {
      alert("No url entered!! Kindly enter it again !!");
    }
    else
    {
      window.open(url,'_blank','width=400,height=450,menubar=no,scrollbars=no,status=0,toolbar=0,titlebar=0');
    }
  }
  
}

