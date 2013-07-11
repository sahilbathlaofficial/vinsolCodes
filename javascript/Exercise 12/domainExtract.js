/*
  Author - Sahil Bathla
  Description - Domain/Sub-Domain extraction
  Version - 1.0
*/

// Class for Form

function Form(formObject)
{
  this.form = formObject;
  var regexURL = /^(http[s]?:\/\/)?(www.)?[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)*\.[a-z.]{2,6}[/]?([\w]+[/]{0,1})*[^/]*$/;
  var hostName = '',
      domain = '',
      subDomain = '';

  this.extractDomain = function() 
  {
    if(regexURL.test(this.form.elements[0].value) === false)
    {
      alert("Enter a valid URl");
    }
    else
    {
    var hostName = this.form.elements[0].value.replace(/^(http[s]*:\/\/)?(www.)?/,'').replace(/\/.*$/,'');
    var domain= hostName.slice(hostName.search(/[\w]+\.[a-z.]{2,4}$/),hostName.length);
    alert("Domain: " + domain);
    var subDomain =  hostName.slice(0,hostName.search(/[\w]+\.[a-z.]{2,4}$/)).slice(0,-1);
    if(subDomain !== '')
    {
      alert("Sub Domain: " + subDomain);
    }
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
  
