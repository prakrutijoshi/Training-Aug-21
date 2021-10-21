// Using Function Expression, find the area of circle

var result = function (r) {return 3.14*r*r;}
console.log("The are of the circle: "+result(2));

// Using Function Constructor, find the area of rectangle

var result = function (l,b) {return l*b};
console.log("The area of the rectangle: "+result(12,8));

// Explain usage of Function Hosing using example

console.log("Example of function Hoisting " +exfunc(2));

function exfunc(n)
{
    return n+n;
}

// Using Function call create employee object with field Name, Address and Designation and pass it to function.

var emp = {
    details : function() {
        return this.name+ " lives in " +this.Address+ " working as " +this.Designation; 
    }
}
var employee = {
    name :"Prakruti Joshi",
    Address :"Ahmedabad",
    Designation :"Mobile Trainee" 
}

console.log("Function Call: "+emp.details.call(employee));

// Using Function Apply pass employee object to a function defined in the function.

console.log("Function Apply: " + emp.details.apply(employee));

// Explain Function closure with practical

// var counter=0;
// function add()
// {
//     return counter+=1;
// }

//self-invoking
var add=(function () { 
    var counter=0;
    return function() { counter+=1; return counter}
}) ();

console.log(add());
console.log(add());
console.log(add());