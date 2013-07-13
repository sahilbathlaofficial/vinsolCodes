/*
  Author - Sahil Bathla
  Description - Number validation 
  Version - 1.0
*/

// Class for Form

function Names(person)
{
  this.names = person;
  this.suggestBox= document.getElementById('suggestBox');
  this.resultBox= document.getElementById('suggestionResults');
  var flag = false;
  this.suggest = function() 
    {
      this.clearResultBox();
      flag = false;
      if(this.suggestBox.value !== '')
      {
        for (i = 0 ; i < this.names.length ; i = i + 1)
        {
          if((this.names[i]["name"].toLowerCase()).indexOf(this.suggestBox.value.toLowerCase()) === 0 )
          {
           para = document.createElement('p');
           para.appendChild(document.createTextNode('' + this.names[i]["name"]));
           para.onclick = function ()
           {
              document.getElementById('suggestBox').value = this.textContent;
           }
           this.resultBox.appendChild(para);
            flag = true;
          }
        }

        if(flag === true)
        {
          this.resultBox.style.border = 'solid 1px black';
        }
      }
    }

  this.clearResultBox = function()
  {
    this.resultBox.innerHTML = '';
    this.resultBox.style.border = 'none';
  }
}

window.onload = function()
{
  person =[{"name":"Luigi Damiano"}, {"name":"Zenith Coboro"}, {"name":"Zig Ziglar"}, {"name":"Steve Costner"}, {"name":"Bill Grazer"}, {"name":"Timothy Frazer"}, {"name":"Boris Becker"}, {"name":"Glenn Gladwich"}, {"name":"Jim Jackson"}, {"name":"Aaron Kabin"}, {"name":"Roy Goldwin"}, {"name":"Jason Goldberg"}, {"name":"Tim Ferris"}, {"name":"Buck Singham"}, {"name":"Malcom Gladwell"}, {"name":"Joy Rabura"}, {"name":"Vid Luther"}, {"name":"Tom Glicken"}, {"name":"Ray Baxter"}, {"name":"Ari Kama"}, {"name":"Kenichi Suzuki"}, {"name":"Rick Olson"}]

  nameObject = new Names(person);
}

function suggestName()
{
  nameObject.suggest();
}

function clearResults()
{
  nameObject.clearResultBox();
}


  
