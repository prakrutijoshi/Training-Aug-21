//  Explain difference between var and let keyword using example. 

var n1=2;
if(true)
{
    var n1=5;
    console.log("The number is "+n1+ " (updated vlaue from 2 to 5)");
}
console.log("The number is "+n1+ " (updated value)");

var n2=4;
if(true)
{    
    let n2=8;
    console.log("The number is "+n2+ " (local value)");
}
console.log("The number is "+n2+ " (global value)");