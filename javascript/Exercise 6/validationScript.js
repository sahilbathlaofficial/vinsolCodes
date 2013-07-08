/*
  Author - Sahil Bathla
  Description - Validate form.
  Version - 1.0
*/


function formClass(formName)
{
  this.loginId = formName.loginId.value;
  this.email = formName.email.value;
  this.nameOfPerson = formName.nameOfPerson.value;
  this.timeZone = formName.timeZone.value;
  this.homePage = formName.homePage.value;
  this.aboutMe = formName.aboutMe.value;
  this.notification = formName.notification.checked;
  var flag = true;

  this.validate = function()
  {
    if(this.loginId === '')
    {
      alert("Log In Id missing");
      formName.loginId.focus();
    }

    else if(this.email === '')
    {
      alert("Email missing");
      formName.email.focus();
    }

    else if(this.nameOfPerson === '')
    {
      alert("Name missing");
      formName.nameOfPerson.focus();
    }

    else if(this.timeZone === '')
    {
      alert("Timezone missing");
      formName.timeZone.focus();
    }
  
    else if(this.homePage === '')
    {
      alert("Homepage missing");
      formName.homePage.focus();
    }

    else if(this.aboutMe === '' || this.aboutMe.length < 30)
    {
      alert("About me length should be greater than 30");
      formName.aboutMe.focus();
    }
    
    else if(this.notification === false)
    {
      alert("Notificatios must be recieved");
      formName.notification.focus();
    }
    
  }
}

var formHandler = function ()
{
  var form = new formClass(document.forms[0]);
  form.validate();
}


window.onload = function () {
  var submitButton = document.getElementById('submitButton');
  submitButton.addEventListener('click',formHandler,false);
}

