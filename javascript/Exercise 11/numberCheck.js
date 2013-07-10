/*
  Author - Sahil Bathla
  Description - Number validation 
  Version - 1.0
*/

// Class for Form

function formClass(form)
{
  this.form = form;
  this.validate = function() 
  {
    if( this.form.elements[1].value = (/^[0-9]+$/).test(this.form.elements[0].value))
    {
      form.submit();
    }
  }
}

function checkNumber(formObject)
{
  // prevent submit action initially
  window.event.preventDefault();
  var form = new formClass(formObject);
  form.validate() 
}
  
