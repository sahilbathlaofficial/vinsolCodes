/*
  Author - Sahil Bathla
  Description - Check at most three boxes on the webpage
  Version - 1.0
*/

function checkLimit(self)
  {
    var days=new Array();  
    var count=0;

    for(i=0;i<7;i++)
      {
        if(document.getElementsByName('checkBox')[i]==self)
            {
              // make none deselect
              document.getElementsByName('checkBox')[7].checked=false; 
            }

        else if(document.getElementsByName('checkBox')[i].checked==true)
            {
              // add to array but not the selected checkbox
              days[count++]=document.getElementsByName('checkBox')[i].value;  
            }

        if(count==3 && document.getElementsByName('checkBox')[7].checked==false )
          {
            alert("3 checkboxes already selected "+days[0]+" "+days[1]+" "+days[2]);
            /* set self to be false if count>3 */
            self.checked=false;  
            break;
          }
      }
       
    
    if(document.getElementsByName('checkBox')[7].checked==true && count>0)
      {
        for(i=0;i<7;i++)
        document.getElementsByName('checkBox')[i].checked=false;
      }
        
    
  }  
