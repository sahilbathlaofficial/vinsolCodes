/*
  Author - Sahil Bathla
  Description - Domain/Sub-Domain extraction
  Version - 2.0
*/

// Class for Form

function Form(formObject)
{
  this.form = formObject;
  var regexURL = /^(?:http[s]{0,1}:\/\/)?(?:www.)?([.a-zA-Z0-9]*)?(?:\.)([a-zA-Z0-9]+\.[a-z.]{2,6})(?:\/)?(?:[\w]+[/]{0,1})*(?:[^/])*$/;
  var hostName = '',

  this.extractDomain = function() 
  {

    if(regexURL.test(this.form.elements[0].value) === false)
    {
      alert("Enter a valid URl");
    }
    else
    {
      // Extracting Domain and subdomain using capturing mode
      hostName = (regexURL).exec(this.form.elements[0].value);
      alert("Domain: " + hostName[2]);
      if(hostName[1] !== undefined)
      alert("Sub Domain: " + hostName[1]);
    }
  }
}

function checkDomain(formObject)
{
  // prevent submit action initially
  window.event.preventDefault();
  var form = new Form(formObject);
  form.extractDomain(); 
}
  
