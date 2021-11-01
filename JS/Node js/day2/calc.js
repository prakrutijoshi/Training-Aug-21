fs = require('fs')
var res;
function calc(op,n1,n2)
{
    switch(op)
    {
        case '+':
            res=parseInt(n1)+parseInt(n2);
            fs.writeFile('result.txt','Addition: ' +res.toString(),function(err){
                if(err) return console.log(err);
                fs.readFile('result.txt','utf8',function(err,data){
                    if(err) return console.log(err);
                    console.log(data)
                })
            })
            break;

        case '-':
            res=parseInt(n1)-parseInt(n2);
            fs.writeFile('result.txt','Substraction: '+res.toString(),function(err){
                if(err) return console.log(err);
                fs.readFile('result.txt','utf8',function(err,data){
                    if(err) return console.log(err);
                    console.log(data)
                })
            })
            break;

        case '*':
            res=parseInt(n1)*parseInt(n2);
            fs.writeFile('result.txt','Multiplication: '+res.toString(),function(err){
                if(err) return console.log(err);
                fs.readFile('result.txt','utf8',function(err,data){
                    if(err) return console.log(err);
                    console.log(data)
                })
            })
            break;

        case '/':
            res=parseInt(n1)/parseInt(n2);
            fs.writeFile('result.txt','Division: '+res.toString(),function(err){
                if(err) return console.log(err);
                fs.readFile('result.txt','utf8',function(err,data){
                    if(err) return console.log(err);
                    console.log(data)
                })
            })
            break;

        default:
            console.log("Enter correct operator");
            break;
    }
}

console.log("Enter the operation to be perfomred: \n + : Addition \n - : Substraction \n * : Multiplication \n / : Division ");
const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
  })
  
  readline.question(`Enter operator:  `,op => 
  readline.question('Enter first number: ',n1 =>
  readline.question('Enter second number: ',n2 =>
  {
      calc(op,n1,n2);
      readline.close();
  })));



  