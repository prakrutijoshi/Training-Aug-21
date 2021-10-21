
//This project is aimed at developing a web-based and central Recruitment Process System for the HR Group for a company. 
//Some features of this system will be creating vacancies, storing Applicants data, Interview process initiation, Scheduling Interviews, 
//Storing Interview results for the applicant and finally Hiring of the applicant.
// Reports may be required to be generated for the use of HR group.

var app1={
    id:1,
    firstName:"Ram",
    lastName:"Kapoor",
    address:"Maharashtra,India",
    CGPA:"7",
};

var app2={
    id:2,
    firstName:"Laxman",
    lastName:"Kapoor",
    address:"Maharashtra,India",
    CGPA:"7.5",
};

var app3={
    id:3,
    firstName:"Krishna",
    lastName:"Patel",
    address:"Delhi,India",
    CGPA:"9",
};

var app4={
    id:4,
    firstName:"Balram",
    lastName:"Patel",
    address:"Delhi,India",
    CGPA:"8",
};

var app5={
    id:5,
    firstName:"Shiv",
    lastName:"Kumar",
    address:"Gujarat,India",
    CGPA:"6.5",
};

var applicants = [app1,app2,app3,app4,app5];

var vac1={
    VacancyID:1,
    position:"Mobile",
    CGPA:"9",
};

var vac2={
    VacancyID:2,
    position:"PHP",
    CGPA:"7.5",
};

var vac3={
    VacancyID:3,
    position:"NodeJs",
    CGPA:"8",
};

var vac4={
    VacancyID:4,
    position:"QA",
    CGPA:"6.5",
};

var vac5={
    VacancyID:5,
    position:".NET",
    CGPA:'7.5',
};

var vacancies = [ vac1,vac2,vac3,vac4,vac5];

var interview = [];
var setinterview = 0;
var time=12;
for( var i=0 ; i<applicants.length ; i++)
{
    for( var j=0 ; j<vacancies.length ; j++)
    {
        if(applicants[i].CGPA == vacancies[j].CGPA)
        {
            setinterview++;
            interview.push(
                {
                    Interview_No: setinterview,
                    ID : applicants[i].id,
                    Name: applicants[i].firstName +" "+ applicants[i].lastName,
                    Address: applicants[i].address,
                    CGPA : applicants[i].CGPA,
                    position: vacancies[j].position,
                    Vacancy_ID:vacancies[j].VacancyID,
                    time: time+":00 P.M.",
                },
            )
            time++;
        }
    }
}

//console.log(interview);

function display()
{
    console.log("------------------------------------------");
    console.log("The list of applicants as per set interview");
    console.log("Interview Date: " +Date());
    console.log("------------------------------------------");
    for( var i=0; i<interview.length ; i++)
    {
        console.log("Interview Number : ", +interview[i].Interview_No),
        console.log("ID : " +interview[i].ID );
        console.log("Name : " +interview[i].Name);
        console.log("Address : "+interview[i].Address);
        console.log("CGPA  : " +interview[i].CGPA);
        console.log("Position : " +interview[i].position);
        console.log("Time : " +interview[i].time);
        console.log("-----------------------------------------");
    }
}

display();