var express = require('express');
var app = express();

app.use(express.json());


// 1. Create a RESTFUL API which will return a Studentlist.
const Students=[

    {   "ID":1, 
        "Name":"Reena", 
        "Address":"Ahmedabad", 
        "Fees":{ 
            "Amount":10000,
            "PaymentDate":"12/12/2020",
            "Status":"true"
            },
        "Result":{
            "Hindi":80,
            "Eng":70,
            "Math":60,
            "Total":210,
            "Grade":"A"
            }
    },
    {   "ID":2, 
        "Name":"Rita" , 
        "Address":"Surat" , 
        "Fees":{ 
            "Amount":12000,
            "PaymentDate":"12/12/2020",
            "Status":"false"
            },
        "Result":{
            "Hindi":80,
            "Eng":70,
            "Math":60,
            "Total":210,
            "Grade":"A"
            }
    },
]

app.get('/', (req,res) => {
    res.send('Welcome all!');
});

app.get('/students', (req,res) => {
    res.send(Students);
});

const port = process.env.PORT || 3000;
app.listen( port, () => console.log('Listening to the port ' +port+'..'));

//2. Create RESTFUL API which will return a Particular Student Record
app.get('/students/:ID', (req,res) => {
    var student = Students.find( s => s.ID === parseInt(req.params.ID));

    if(!student) res.status(404).send('<h2 style="font-family : Malgun Gothic ; color : darkred;"> Oops! cannot find what you are looking for! </h2>');
    res.send(student);
});

// 3. Create a RESTFUL API which return a particular student FEES Record.

app.get('/students/:ID/fees', (req,res) => {
    var student = Students.find( s => s.ID === parseInt(req.params.ID));

    if(!student) res.status(404).send('<h2 style="font-family : Malgun Gothic ; color : darkred;"> Oops! cannot find what you are looking for! </h2>');
    res.send(student.Fees);
});


// 4. Create a RESTFUL API which will return a particular student Exam Result.

app.get('/students/:ID/result', (req,res) => {
    var student = Students.find( s => s.ID === parseInt(req.params.ID));

    if(!student) res.status(404).send('<h2 style="font-family : Malgun Gothic ; color : darkred;"> Oops! cannot find what you are looking for! </h2>');
    res.send(student.Result); 
})

// 5. Create a RESTFUL API which will update a result of result of student id 1. Update the marks for English Subject.

app.put('/students/:ID/result', (req,res) => {
    var student = Students.find(s => s.ID === parseInt(req.params.ID));

    if(!student) res.status(404).send('<h2 style="font-family : Malgun Gothic ; color : darkred;"> Oops! cannot find what you are looking for! </h2>');
    res.send(student);

    student.Result.Eng=req.body.Eng;
    res.send(student); at
});

