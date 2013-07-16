/*
  Author - Sahil Bathla
  Description - Validate form.
  Version - 1.0
*/
function regexCheck (element,regex)
{
  if (!(regex).test(element.value))
  {
    alert(element.previousSibling.textContent + " is not in proper format" );
    element.focus();
  }
    return (regex).test(element.value);
 
}


function Form(form)
{
  this.form = form;
  this.inputFields = document.getElementsByClassName('inputElement');
  this.textArea = document.getElementById('aboutMe');
  this.checkBox = document.getElementById('notification');
  this.email = document.getElementById('email');
  this.homePage = document.getElementById('homePage');

  var regexEmail = /^[a-zA-Z0-9._%]+@[a-zA-Z0-9]+\.[\w]{2,4}(\.[\w]{2,4}){0,1}$/;
  var regexURL = /^(http[s]{0,1}:\/\/){0,1}(www.){0,1}[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)*\.[a-z.]{2,6}[/]{0,1}([\w]+[/]{0,1})*[^/]*$/;
  var flag = true;
  

  this.validate = function()
  {
    for (i = 0 ; i < this.inputFields.length ; i = i + 1 )
    {
      
      if (this.inputFields[i].value === '' || this.inputFields[i].value.trim().length === 0)
      {
        alert(this.inputFields[i].previousSibling.textContent + " can not be empty" );
        this.inputFields[i].focus();
        flag = false;
        break;
      }
    }

    if (flag)
    {
      if (this.textArea.value.length < 50)
      {
        alert("Minimum length of this box is 50");
        this.textArea.focus();
        flag = false;
      }
        
      else if (!this.checkBox.checked)
      {
        alert(this.checkBox.name + " must be checked ");
        this.checkBox.focus();
      }
             
      else if (regexCheck(email,regexEmail) && regexCheck(homePage,regexURL))
      {
       this.form.submit();
      }

    }   
  }
}

var formHandler = function ()
{
  var form = new Form (document.forms[0]);
  form.validate();
}


window.onload = function () {
  var submitButton = document.getElementById('submitButton');
  submitButton.addEventListener('click', formHandler, false);
}

