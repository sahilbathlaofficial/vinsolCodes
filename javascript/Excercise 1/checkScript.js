/*
  Author - Sahil Bathla
  Description - Check all boxes or Check none of the box on the webpage
  Version - 1.0
*/

//This functions reverses the checks made on the checkList

function setCheck(checkValue) 
{
  var i = 0;
  var checkBoxCollection = document.getElementsByName('checkBox');
    for (i = 0; i < checkBoxCollection.length; i = i + 1)
    {
      checkBoxCollection[i].checked = checkValue;
    }
  return false;
}

