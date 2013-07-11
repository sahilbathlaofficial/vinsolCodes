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

  if(checkBoxArray[lastElement] !== self && self.checked === false)
    {
      //remove item from days array if any element leaving None is unchecked
      days.splice(days.indexOf(self.value),1);
    }


  // if NONE is checked make all elements unchecked
  else if(checkBoxArray[lastElement].checked == true && days.length > 0)
  {
    days = [];
    for(i = 0;i < length;i = i + 1)
    {
      checkBoxArray[i].checked = false;
    }
  }

  else if(days.length === maxChecks )
  {
    // generating error message
    errorString = errorString + days[0]  + "," + days[1] + " and " + days[2]; 
    // set self to be false if count>3 
    self.checked = false;  
    alert("Only 3 days can be selected. You have already selected " + errorString);
  }

  else
  {
    if(checkBoxArray[lastElement] !== self && self.checked === true )   
    {
      // insert values in days array if not NONE and checked
      days.push(self.value);
      // and make None unchecked
      checkBoxArray[lastElement].checked = false;
    }
    
  }
       
}
