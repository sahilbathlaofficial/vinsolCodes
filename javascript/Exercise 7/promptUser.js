/*
  Author - Sahil Bathla
  Description - Prompt User
  Version - 1.0
*/




window.onload = function () 
{

  var finalString = 'Hello',
      stripedLastName ='',
      stripedFirstName = '',
      lastName = '',
      firstName = '';
 
  // for first name
  do
  {
    firstName = prompt("Please enter your first name:","Your first name");
    stripedFirstName = firstName.replace(/ /g,'');
    if(firstName === '' || stripedFirstName.length === 0 )
    {
      alert("First Name cannnot be empty")
    }
    else 
    {
    finalString = finalString + " " + firstName;
    }
  }while(firstName === '' || stripedFirstName.length === 0);

  //for last name
  do
  {
    lastName = prompt("Please enter your last name:","Your last name");
    stripedLastName = lastName.replace(/ /g,'');
    if(lastName === '' || stripedLastName.length === 0 )
    {
      alert("Last Name cannnot be empty")
    }
    else 
    {
    finalString = finalString + " " + lastName;
    }
  }while(lastName === '' || stripedLastName.length === 0);
 
  alert(finalString);
  
}

