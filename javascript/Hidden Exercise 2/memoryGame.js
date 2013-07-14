// function to asign a image to each box randomly
function assignImage(range)
{
  var randomNumber = 0;
  do
  {
    randomNumber = Math.floor(Math.random()*range);
  }  while(randomImageNumber.indexOf(randomNumber) != -1);

  randomImageNumber.push(randomNumber);
  return 'images/image_' + (randomNumber % (range / 2) ) + '.jpg';
}

// the main game handler which runs when any column in clicked
gameHandler = function()
{
  if (proceed === true)
  {
    if (imagesOpened % 2 === 0)
    {
    // open image if even number of images are opened
    boxOpened[0] = this;
    this.style.background = 'url(' + this.getAttribute('value') + ')';
    evenImageOpened = false;
    imagesOpened = imagesOpened + 1;
    }

    else
    {
    // check if image is similar to previous image then only open it else don't
      boxOpened[1] = this;
      if(boxOpened[1] !== boxOpened[0])
      {
        this.style.background = 'url(' + this.getAttribute('value') + ')';
        if (this.getAttribute('value') !== boxOpened[0].getAttribute('value'))
        {
          proceed = false;
          document.getElementById('wrongGuess').style.visibility = 'visible';
          window.setTimeout(function() 
            {
              document.getElementById('wrongGuess').style.visibility = 'hidden';
              boxOpened[0].style.background = 'none';
              boxOpened[1].style.background = 'none';
              proceed = true;
            },800);
          imagesOpened = imagesOpened - 1;
        }
        else
        {
          imagesOpened = imagesOpened + 1;
        }
      }
    }

    if(imagesOpened === rows * cols)
    {
    alert("You won");
    }
  }
}



function startGame(self)
{
  randomImageNumber = [];
  imagesOpened = 0,boxOpened = [];
  proceed = true;
  rows = 6, cols = 6;
  timeRemaining = 120;

  for (i = 0;i < rows;i = i + 1)
  {
    matrixRow = document.createElement('div');
    for (j = 0;j < cols;j = j + 1)
    {
      matrixCol = document.createElement('span');
      matrixCol.setAttribute('class','box');
      matrixCol.setAttribute('value',assignImage(rows*cols));
      matrixCol.onclick = gameHandler;
      matrixRow.appendChild(matrixCol);
    }
    document.getElementById('mainGameFrame').appendChild(matrixRow);
  }
  self.style.visibility = 'hidden';

 //Time Remaining 
  document.getElementById('timeRemaining').textContent = 'Time Remaining : ' + timeRemaining + ' secs';
   window.setInterval(function()
  {
    if(timeRemaining === 0)
    {
      alert("Time Over!! You Lose");
      window.close();
    }
    timeRemaining = timeRemaining - 1;
    document.getElementById('timeRemaining').textContent = 'Time Remaining : ' + timeRemaining + ' secs';
  },1000);

}




