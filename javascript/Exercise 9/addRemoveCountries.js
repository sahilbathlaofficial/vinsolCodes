/*
  Author - Sahil Bathla
  Description - Add or Remove COuntries
  Version - 1.0
*/

// Class for Lists
function List(list) {
    this.list = list;
    this.addInList = function (selectedItem) {
        this.list.add(selectedItem);
    };
}


// function to get the selected items and put them in corresponding list
function shiftSelected(listFrom, listTo) {
    listFrom = new List(document.getElementById(listFrom));
    listTo = new List(document.getElementById(listTo));
    var selectedItemsArray = [];
    while (listFrom.list.selectedIndex !== -1)
    {
      listTo.addInList(listFrom.list[listFrom.list.selectedIndex]);
    }
}


  
