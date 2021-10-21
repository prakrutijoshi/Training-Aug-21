// Make a function that takes in a single parameter and returns a new promise. using setTimeout, after 500 milliseconds,
// the promise will either resolove or reject. if the input is a string, the promise resolves with that reverse string . 
//if the input is anything but a string it rejects with that same input call the function wrong Input

function demo(arg)
{
   
    return new Promise((resolve,reject)=>
    {
        let successmessage= 
        {
            status : 'Success',
            message: 'The input argument is a String: '+ arg +'. The Reverse string will be '+  arg.split('').reverse().join(''),
        }
        let errormessage= 
        {
           status : 'Error',
           message: 'The input argument is not a String',
       }
       if(typeof(arg===String))
       {
            resolve(successmessage);
       }
       else
       {
            reject(errormessage);
       }
    })
}


demo("Hello").then(
   (successmessage)=>
   {
    console.log(successmessage);
   },
   (errormessage)=>
   {
       console.log(errormessage);
   },
)