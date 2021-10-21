//Store 5 employees’ data in one array (ID,FirstName,LastName,Address,Salary).
// Do the operation searching by indexnumber, EmployeeID, Insert the employee, delete the employee from the Array.
// Create one more array emp and join the value with above array. 
//When display list combine firstname and lastname as fullname, From the address field flatnumber,city,state and should be splited.
//PF should be computed and total salary should be display.


// Adding data for 5 employees
    var emp1={
        id:1,
        firstName:"Ram",
        lastName:"Kapoor",
        address:"Maharashtra,India",
        salary:"20000",
    };

    var emp2={
        id:2,
        firstName:"Laxman",
        lastName:"Kapoor",
        address:"Maharashtra,India",
        salary:"15000",
    };

    var emp3={
        id:3,
        firstName:"Krishna",
        lastName:"Patel",
        address:"Delhi,India",
        salary:"30000",
    };

    var emp4={
        id:4,
        firstName:"Balram",
        lastName:"Patel",
        address:"Delhi,India",
        salary:"25000",
    };

    var emp5={
        id:5,
        firstName:"Shiv",
        lastName:"Kumar",
        address:"Gujarat,India",
        salary:"40000",a
    };

    var employees =[emp1, emp2,emp3, emp4, emp5];

//display for user undertandings
console.log("--------------------------------------");
console.log("Enter an integer for respective operations: ");
console.log("1 --> Display the Array");
console.log("2 --> Search");
console.log("3 --> insert");
console.log("4 --> delete");

console.log("--------------------------------------");
console.log("Pressed 1 - Displaying the whole data");
console.log("--------------------------------------");
operations(1);
console.log("---------------------------------------");

console.log("Pressed 2 to search for employeeID 2");
console.log("--------------------------------------");
operations(2);
console.log("--------------------------------------");

console.log("Pressed 3 to insert employee details");
console.log("--------------------------------------");
operations(3);
console.log("--------------------------------------");
console.log("After inserting, displaying whole data");
console.log("--------------------------------------");
operations(1);
console.log("--------------------------------------");

console.log("Pressed 4 to delete employee ID = 4");
console.log("--------------------------------------");
operations(4);
console.log("--------------------------------------");
console.log("After deleting, displaying whole data");
console.log("--------------------------------------");
operations(1);
console.log("--------------------------------------");

//switch 
var op;
function operations(op) 
{
    switch(op)
    {
        case 1:
            //console.log(employees);
            displaydata();
            break;

        case 2:
            console.log("Searching for the employeeID=2");
            console.log(employees[1]);
            break;

        case 3:
            console.log("Inserting new data");
            employees.push(
                {
                    id:6,
                    firstName:"Radha",
                    lastName:"Shah",
                    address:"Rajasthan, India",
                    salary:20000,
                },
            )
            break;

        case 4:
            console.log("Deleting data for employeeID=4");
            employees.splice(3,1);
            break;

        default:
            console.log("Enter valid operation");
            break;
    }

}

// function to display the data
function displaydata()
{ 
    for(var i=0 ; i<employees.length ; i++)
    {
        console.log("Employee ID:"+employees[i].id);
        console.log("Name:"+employees[i].firstName+" "+employees[i].lastName);
        console.log("State:"+employees[i].address.split(",")[0]);
       console.log("Country:"+employees[i].address.split(",")[1]);
        console.log("Salary after PF:"+employees[i].salary*0.80);
        console.log("-----------------------------------------------");
    }
}


// Data for new employees == trainees
    var tr1={
        id:101,
        firstName:"Shyam",
        lastName:"Vyas",
        address:"Gujarat,India",
        salary:5000,
    };

    var tr2={
        id:102,
        firstName:"Meena",
        lastName:"Singh",
        address:"Gujarat,India",
        salary:6000,
    };

var trainees = [tr1,tr2];


// function to display the trainee data
function displaytrainees()
{
    console.log("New Array");
    console.log("-----------------------------------------------");
    for(var i=0 ; i<trainees.length ; i++)
    {
        console.log("Employee ID:"+trainees[i].id);
        console.log("Name:"+trainees[i].firstName+" "+trainees[i].lastName);
        console.log("State:"+trainees[i].address.split(",")[0]);
       console.log("Country:"+trainees[i].address.split(",")[1]);
        console.log("Salary after PF:"+trainees[i].salary*0.80);
        console.log("-----------------------------------------------");
        
    }
}

displaytrainees();

//concating both data 
console.log("Joining employees and trainees...");
console.log(employees.concat(trainees));

