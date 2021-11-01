var result = require('./Rectangle.js');

const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
  })
  
  readline.question(`Enter length of the Rectangle:  `,l => 
  readline.question('Enter breath of the Rectangle: ',b =>
  {
      console.log("Area : "+result.Area(l,b));
      console.log("Perimeter : "+result.Peri(l,b));
      readline.close();
  }));


