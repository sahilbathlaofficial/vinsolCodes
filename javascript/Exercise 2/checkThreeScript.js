/*
  Author - Sahil Bathla
  Description - Check at most three boxes on the webpage
  Version - 1.0
*/

var days = [];

function checkLimit(self)
{

  var count = 0,
      maxChecks = 3,
      errorString = "";

  if(self.checked === false)
    {
      //remove item from days array 
      days.splice(days.indexOf(self),1);
    }


  else if(days.length === maxChecks )
  {
    // generating error message
    errorString = errorString + days[0].value  + "," + days[1].value + " and " + days[2].value; 
    // set self to be false if count>3 
    self.checked = false;  
    alert("Only 3 days can be selected. You have already selected " + errorString);
  }

  else
  {
      // insert values in days array if not NONE and checked
      days.push(self);
      // and make None unchecked
      document.getElementById('none').checked = false;
  }
    
       
}


function selectNone(self)
{

  if(self.checked == true && days.length > 0)
  {
    for(i = 0;i < days.length;i = i + 1)
    {
      days[i].checked = false;
    }
    days = [];  
  }
}
