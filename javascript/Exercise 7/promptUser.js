/*
  Author - Sahil Bathla
  Description - Prompt User
  Version - 1.0
*/

function promptName(promptText)
{
  var name = '';
  do
  {
    name = prompt("Please enter your " + promptText);
    if(name === '' || name.trim().length === 0 )
    {
      alert(promptText + " cannnot be empty")
    }
  }while(name === '' || name.trim().length === 0);

  return name;
}


window.onload = function () 
{

  var finalString = 'Hello ',
  finalString = finalString + promptName('First Name') + ' ';
  finalString = finalString + promptName('Last Name'); 
  alert(finalString);
  
}

