
function greater(n1,n2,n3)
{
    if(n1>n2)
    {
        if(n1>n3)
        {
            return n1;
        }
    }
    else if(n2>n3)
    {
        return n2;
    }
    else
    {
        return n3;
    }
}

var result = greater(50,60,40);
console.log(result+ " is greater");

function sum(n1,n2,n3)
{
    var sum=0;
    if(n1>40)
    {
        sum+=n1;
    }
    if(n2>40)
    {
        sum+=n2;
    }
    if(n3>40)
    {
        sum+=n3;
    }
    return sum;
}

var result = sum(50,60,40);
console.log("Sum:" +result);
