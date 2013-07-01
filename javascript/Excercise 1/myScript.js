/*
  Author - Sahil Bathla
  Description - Check all boxes or Check none of the box on the webpage
  Version - 1.0
*/

function checkAll()
  {
    var checkBoxCollection = document.getElementsByName('checkBox');
    for each(checkBox in checkBoxCollection)
    checkBox.checked=true;
  }

function removeAll()
  {
    var checkBoxCollection = document.getElementsByName('checkBox');
    for each(checkBox in checkBoxCollection)
    checkBox.checked=false;
  }
