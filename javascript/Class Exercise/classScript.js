/*
  Author - Sahil Bathla
  Description - Compare ages of two people using OOPS
  Version - 1.0
*/

//Person class with age property and compare method

function person(ageOfPerson)
{
  this.age = ageOfPerson;
  this.compare = function(otherPerson) 
  {
    if( !(this.age instanceof Number) || !(otherPerson.age instanceof Number) )
    {
      alert("The input is invalid!! Numbers only");
    } 
    else if(this.age < 0 || otherPerson.age < 0)
    {
      alert("Invalid Age(s) !! Age cannot be negative");
    }
    else if(this.age > otherPerson.age)
    {
      alert("John is older than Mary");
    }
    else  if(this.age === otherPerson.age)
    {
      alert("John and Mary are of same age");
    }
    else
    {
    alert("Mary is older than John");
    }
  }
}

// Function to compare ages of the two person
function compareAge()
{
  var john = new person(document.getElementById('johnAge').value);
  var marry = new person(document.getElementById('maryAge').value);
  john.compare(marry);
}

