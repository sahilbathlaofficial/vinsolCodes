function Names(person)
{
  this.names = person;
  var suggestBox= document.getElementById('suggestBox');
  var resultBox= document.getElementById('suggestionResults');
  var flag = false;
  this.suggest = function()
    {
      this.clearResult();
      flag = false;
      if(suggestBox.value !== '')
      {
        for (i = 0 ; i < this.names.length ; i = i + 1)
        {
          if((this.names[i]["name"].toLowerCase()).indexOf(suggestBox.value.toLowerCase()) === 0 )
          {
            para = document.createElement('p');
            para.appendChild(document.createTextNode('' + this.names[i]["name"]));
            para.onclick = function ()
            {
              document.getElementById('suggestBox').value = this.textContent;
            }
            resultBox.appendChild(para);
            flag = true;
          }
        }

        if(flag === true)
        {
          resultBox.style.border = 'solid 1px black';
        }
      }
    }

  this.clearResult = function()
  {
    resultBox.innerHTML = '';
    resultBox.style.border = 'none';
  }
}

window.onload = function()
{
  person =[{"name":"Luigi Damiano"}, {"name":"Zenith Coboro"}, {"name":"Zig Ziglar"}, {"name":"Steve Costner"}, {"name":"Bill Grazer"}, {"name":"Timothy Frazer"}, {"name":"Boris Becker"}, {"name":"Glenn Gladwich"}, {"name":"Jim Jackson"}, {"name":"Aaron Kabin"}, {"name":"Roy Goldwin"}, {"name":"Jason Goldberg"}, {"name":"Tim Ferris"}, {"name":"Buck Singham"}, {"name":"Malcom Gladwell"}, {"name":"Joy Rabura"}, {"name":"Vid Luther"}, {"name":"Tom Glicken"}, {"name":"Ray Baxter"}, {"name":"Ari Kama"}, {"name":"Kenichi Suzuki"}, {"name":"Rick Olson"}]

  persons = new Names(person);
}

function suggestName()
{
  persons.suggest();
}

window.onclick = function()
{
  persons.clearResult();
}



