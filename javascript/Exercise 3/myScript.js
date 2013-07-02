/*
  Author - Sahil Bathla
  Description - Create Edit and Delete Dynamic rows in table
  Version - 1.0
*/

// This function saves the content of input fields if not empty

function saveRow(rowId)
{
  var inputName = "name" + rowId;
  var inputEmail = "email" + rowId;
  var row = document.getElementById(rowId);
  var cols =  row.getElementsByTagName("td");

  if(document.getElementById(inputName).value !== "" && document.getElementById(inputEmail).value !== "")
  {
    cols[0].innerHTML = "<div>" + document.getElementById(inputName).value + "</div>";
    cols[1].innerHTML = "<div>" + document.getElementById(inputEmail).value + "</div>";
    cols[2].innerHTML = "<span onClick='editRow(\"" + rowId + "\")'>Edit/</span><span onClick='deleteRow(\"" + rowId + "\")'>Delete</span>";
  }
}

//This function deletes the row corresponding to rowId
function deleteRow(rowId)
{
  document.getElementById('mainTable').removeChild(document.getElementById(rowId));
}

//This function edits the row corresponding to rowId
function editRow(rowId)
{
  var row = document.getElementById(rowId);
  var cols =  row.getElementsByTagName("td");
  cols[0].innerHTML = "<input id='name" + rowId + "' value='" + cols[0].textContent + "'/>";
  cols[1].innerHTML = "<input id='email" + rowId + "' value='" + cols[1].textContent + "'/>";
  cols[2].innerHTML = "<input type='button' value='save' onClick='saveRow(\"" + rowId + "\")' />";
}

//This function appends the row corresponding to the mainTable
function addRow()
{
  var row = document.createElement("tr");
  var mainTable = document.getElementById('mainTable');
  var timestamp = new Date().getTime();
  var rowId = "row" + timestamp;
  row.setAttribute("id",rowId);

  for (i = 0;i < 3; i++)
  {
    var col = document.createElement("td");
    if (i == 0)
    {
      col.innerHTML="<input id='name" + rowId + "'/>";
    }
    else if (i == 1)
    {
      col.innerHTML="<input id='email" + rowId + "'/>";
    }
    else
    {
      col.innerHTML="<input type='button' value='save' onClick='saveRow(\"" + rowId + "\")' />";
    }
    row.appendChild(col);
  }
  mainTable.appendChild(row);
}
