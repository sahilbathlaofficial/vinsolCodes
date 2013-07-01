/*
  Author - Sahil Bathla
  Description - Check at most three boxes on the webpage
  Version - 1.0
*/

function checkLimit(self)
{
  var days = new Array(),  
    count = 0,
    checkBoxArray=document.getElementsByName('checkBox'),
    length = checkBoxArray.length-1,
    lastElement = length,
    maxChecks = 3,
    errorString = "";

  for( i = 0;i < length;i = i + 1)
  {
    if(checkBoxArray[i] == self)
    {
      // make none deselect
      checkBoxArray[lastElement].checked = false; 
    }

    else if(checkBoxArray[i].checked == true)
    {
      // add to array but not the selected checkbox
      days[count++] = checkBoxArray[i].value;  
    }

    if(count==maxChecks && checkBoxArray[length].checked == false )
    {
      for (j = 0;j < maxChecks; j = j + 1)
      {
        errorString = errorString + " " + days[j];
      }
      alert("3 checkboxes already selected " + errorString);
      // set self to be false if count>3 //
      self.checked = false;  
      break;
    }
  }
       
    
  if(checkBoxArray[lastElement].checked == true && count > 0)
  {
    for(i = 0;i < length;i = i + 1)
    {
      checkBoxArray[i].checked = false;
    }
  }  

}
