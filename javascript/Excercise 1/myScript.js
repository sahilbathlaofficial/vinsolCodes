/*
  Author - Sahil Bathla
  Description - Check all boxes or Check none of the box on the webpage
  Version - 1.0
*/

function reverseCheck(x)
  {
    var checkBoxCollection = document.getElementsByName('checkBox');
    for (i=0;i<checkBoxCollection.length;i++)
      if(x==1)
        checkBoxCollection[i].checked=true;
      else
        checkBoxCollection[i].checked=false;
  }

