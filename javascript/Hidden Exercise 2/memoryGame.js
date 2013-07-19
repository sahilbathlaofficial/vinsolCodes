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

// Class for Memory games to initialize game and play game
function MemoryGame(rows,cols)
{
  
  this.rows = rows;
  this.cols = cols;

  this.playGame = function()
  {
    for (i = 0;i < this.rows;i = i + 1)
    {
      matrixRow = document.createElement('div');
      for (j = 0;j < this.cols;j = j + 1)
      {
        matrixCol = document.createElement('span');
        matrixCol.setAttribute('class','box');
        matrixCol.setAttribute('value',assignImage(rows*cols));
        matrixCol.onclick = gameHandler;
        matrixRow.appendChild(matrixCol);
      }
      document.getElementById('mainGameFrame').appendChild(matrixRow);
    }
    

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
   
}



function startGame(self)
{
  // jumbled images array  
  randomImageNumber = [];
  // BOX OPENED IS THE ARRAY OF CURRENT AND PREVIOUS IMAGES OPENED
  imagesOpened = 0,boxOpened = [];
  proceed = true;
  timeRemaining = 120;
  // hide start game button
  self.style.visibility = 'hidden';
  var game = new MemoryGame(6,6);
  game.playGame();
}




