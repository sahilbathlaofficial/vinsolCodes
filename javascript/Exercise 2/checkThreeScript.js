/*
  Author - Sahil Bathla
  Description - Check at most three boxes on the webpage
  Version - 1.0
*/

var days = [];

function checkLimit(self)
{

  var count = 0,
    checkBoxArray=document.getElementsByName('checkBox'),
    length = checkBoxArray.length-1,
    lastElement = length,
    maxChecks = 3,
    errorString = "";

  // if NONE is checked make all elements unchecked
  if(checkBoxArray[lastElement].checked == true && days.length > 0)
  {
    days = [];
    for(i = 0;i < length;i = i + 1)
    {
      checkBoxArray[i].checked = false;
    }
  }

  else if(days.length == maxChecks )
  {
    // generating error message
    for (j = 0;j < maxChecks; j = j + 1)
    {
      if(j == maxChecks - 1)
      {
        // remove the last comma before 'and'
        errorString = errorString.slice(0,-1);
        errorString = errorString + " and " + days[j];
      }
      else
      {
        errorString = errorString + days[j]  + ",";
      }
    }

    // set self to be false if count>3 
    self.checked = false;  
    alert("Only 3 days can be selected. You have already selected " + errorString);
  }

  else
  {
    if(checkBoxArray[lastElement] != self )   
    {
      days.push(self.value);
      // make None unchecked
      checkBoxArray[lastElement].checked = false;
    }
    
  }
       
}
