/*
  Author - Sahil Bathla
  Description - Validate form.
  Version - 2.0
*/

function Form(form)
{
  this.form = form;
  this.textFields = document.getElementsByClassName('registerFormTextFields');
  this.aboutMe = document.getElementById('aboutMe');
  this.notificationCheck = document.getElementById('notification');
  // flag to check if form is submitable or not 
  var flag = true;
  

  this.validate = function()
  {
    for (i = 0 ; i < this.textFields.length ; i = i + 1 )
    {
      
      if (this.textFields[i].value === '' || this.textFields[i].value.trim().length === 0)
      {
        alert(this.textFields[i].previousSibling.textContent + " can not be empty" );
        this.textFields[i].focus();
        flag = false;
        break;
      }
    }

    if (flag === true)
    {
      if (this.aboutMe.value.length < 50)
      {
        alert("Minimum length of this box is 50");
        this.aboutMe.focus();
        flag = false;
      }
        
      else if (this.notificationCheck.checked === false)
      {
        alert(this.notificationCheck.name + " must be checked ");
        this.notificationCheck.focus();
        flag = false;
      }
             
      else
      {
      this.form.submit();
      }
    }  
  // end of validate function 
  }
}

var formHandler = function ()
{
  var form = new Form (document.getElementById('registerationForm'));
  form.validate();
}


window.onload = function () {
  var submitButton = document.getElementById('submitButton');
  submitButton.addEventListener('click', formHandler, false);
}

