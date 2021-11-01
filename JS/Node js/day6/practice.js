var express = require('express');
var app = express();

app.use(express.json());


// 1.Create a Restful API, which will return Customer list in JSON format.
const customers = [
    {id:1 , name:'Raja'},
    {id:2 , name:'Ram' },
    {id:3 , name:'Krishna'},
    {id:4 , name:'Sita'}, 
    {id:5 , name:'Radha'}
]

app.get('/', (req,res) => {
    res.send('Welcome all!');
});

app.get('/customers', (req,res) => {
    res.send(customers);
});

// 2. Create a Restful API which will search a particular record from the customer list.
app.get('/customers/:id', (req,res) => {
    var customer = customers.find( c => c.id === parseInt(req.params.id));

    if(!customer) res.status(404).send('<h2 style="font-family : Malgun Gothic ; color : darkred;"> Oops! cannot find what you are looking for! </h2>');
    res.send(customer);
});

const port = process.env.PORT || 3000;
app.listen( port, () => console.log('Listening to the port ' +port+'..'));

// 3. Create a Restful API which will insert a new customer object in the customer list.

app.post('/customers' , (req,res) => {
    console.log(req.body.name);

const customer = {
    id : customers.length + 1,
    name : req.body.name
};

customers.push(customer);
res.send(customer);

});

// 4. Create a Restful API which update a name of existing customer whose customer ID is 1

app.put('/customers/:id' , (req,res) => {
    const customer = customers.find( c => c.id === parseInt(req.params.id));

    if(!customer) res.status(404).send('<h2 style="font-family : Malgun Gothic ; color : darkred;"> Oops! cannot find what you are looking for! </h2>');
    res.send(customer);

customer.name = req.body.name;
res.send(customer); at 

});

// 4. Create a Restful API which will delete a record from the customer list.

app.delete('customers/:id' , (req,res) => {
    const customer = customers.find( c => c.id === parseInt(req.params.id));
    if(!customer) res.status(404).send('<h2 style="font-family : Malgun Gothic ; color : darkred;"> Oops! cannot find what you are looking for! </h2>');

    const index = customers.indexOf(customer);
    customers.splice(index,1);
    res.send(customer);
});