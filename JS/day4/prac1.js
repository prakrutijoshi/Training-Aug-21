// Define a function called callback which receives an argument and prints the square of that number.

var num=5;
function square(num, callback)
{
    callback(num*num);
}

square(num, (c) => { console.log("The square of " +num+ " is " +c) })