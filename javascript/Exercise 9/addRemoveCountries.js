/*
  Author - Sahil Bathla
  Description - Add or Remove COuntries
  Version - 1.0
*/

// Class for Lists
function List(list)
{
  this.list = list;
  this.appendInList = function(selectedItemArray)
  {
    for(i = 0; i < selectedItemArray.length; i = i + 1)
    {
      this.list.appendChild(selectedItemArray[i]);
    } 
  }
}

// create two global List objects
window.onload = function()
{
  firstList = new List(document.getElementById('firstList'));
  secondList = new List(document.getElementById('secondList'));
}


// function to get the selected items and put them in corresponding list
function shiftSelected(listId)
{
  var selectedItemsArray = [];
  var selectedItems = document.getElementById(listId);
  for(i = 0;i < selectedItems.length; i = i + 1)
  {
    if(selectedItems[i].selected === true )
    {
      selectedItemsArray.push(selectedItems[i]);
    }    
  }
  if(listId === 'firstList')
  {
    secondList.appendInList(selectedItemsArray);
  }
  else
  {
    firstList.appendInList(selectedItemsArray);
  }
}


  
