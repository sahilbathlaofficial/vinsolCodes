/*
  Author - Sahil Bathla
  Description - Check all boxes or Check none of the box on the webpage
  Version - 1.0
*/

function reverseCheck(x)
  {
    var checkBoxCollection = document.getElementsByName('checkBox');
    for each(checkBox in checkBoxCollection)
      if(x==1)
        checkBox.checked=true;
      else
        checkBox.checked=false;
  }

