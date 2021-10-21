function calc(op,n1,n2)
{
    switch(op)
    {
        case '+':
            return n1+n2;
            break;

        case '-':
            return n1-n2;
            break;

        case '*':
            return n1*n2;
            break;

        case '/':
            return n1/n2;
            break;

        default:
            console.log("Enter correct operator");
            break;
    }
}

//console.log("Enter the operation to be perfomred: \n + : Addition \n - : Substraction \n * : Multiplication \n / : Division ");
var result = calc('*',5,3);
console.log("result:"+result);