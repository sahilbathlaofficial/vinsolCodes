/*
  Author - Sahil Bathla
  Description - Validate form.
  Version - 1.0
*/


function formClass(form)
{
  this.form = form;
  this.elements = document.getElementsByClassName('inputElement');
  var regexEmail = /^[a-z0-9._%]+@[a-z0-9]+\.[a-z]{2,4}(\.[a-z]{2,4}){0,1}$/;
  var regexURL = /^(http[s]{0,1}:\/\/){0,1}(www.){0,1}[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)*\.[a-z.]{2,6}[/]{0,1}([\w]+[/]{0,1})*[^/]*$/;
  

  this.validate = function()
  {
    for(i = 0 ; i <= this.elements.length ; i = i + 1 )
    {
      if( i === this.elements.length)
      {
        this.form.submit();
      }
      
      else if(this.elements[i].type != 'checkbox' && (this.elements[i].value === '' || this.elements[i].value.trim().length === 0) )
      {
        alert(this.elements[i].previousSibling.textContent + " can not be empty" );
        this.elements[i].focus();
        break;
      }
      else if(this.elements[i].type === 'checkbox' && this.elements[i].checked === false)
      {
        alert(this.elements[i].name + " must be checked ");
        this.elements[i].focus();
        break;
      }
      else if(this.elements[i].type === 'textarea' && this.elements[i].value.length < 50)
      {
        alert("Minimum length of this box is 50");
        this.elements[i].focus();
        break;
      }     
      else if(this.elements[i].id === 'email' && (regexEmail).test(this.elements[i].value) === false )
      {
        alert("Email is not in the correct format");
        this.elements[i].focus();
        break;
      }
      else if(this.elements[i].id == 'homePage' && (regexURL).test(this.elements[i].value) === false )
      {
        alert("Home Page is not in the correct format");
        this.elements[i].focus();
        break;
      }
      
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
  submitButton.addEventListener('click', formHandler, false);
}

