/*
  Author - Sahil Bathla
  Description - Hide/Show sub check lists.
  Version - 1.0
*/

function reverseDisplay(id)
{
  var childCheckList = id + "Name";
  var childCheckListArray = document.getElementsByName(childCheckList);

  if(document.getElementById(id).style.display != 'block')
  {
    document.getElementById(id).style.display = 'block';
    for(i = 0;i < childCheckListArray.length;i = i + 1)
    {
      childCheckListArray[i].checked = true;
    }
    document.getElementById(id).scrollIntoView(true);
  }

  else
  {
    document.getElementById(id).style.display = 'none';
    for(i = 0;i < childCheckListArray.length;i = i + 1)
    {
      childCheckListArray[i].checked = false;
    }
  }

}


