// practice

function disp(name) 
{
    console.log("Hello " +name);
}
disp("Prakruti");



// 1. Create one txt file name it as person.txt and write in that hello world
 fs = require('fs')
fs.writeFile('person.txt', 'Hello World', function(err)
{
    if(err)
        return console.log(err);
    console.log("hello world -> person.txt")
});

//2. Append hello India in person.txt.
fs.appendFile('person.txt',' Hello india',function(err){
    if(err) throw err;
    console.log("Done appending");
});

// 3. Accept your name from command line. And append it to person.txt as “hello “+"name".
function getname(name)
{
    name=process.argv.slice(2),
    name[0],

    fs.appendFile('person.txt',' Hello '+name, 
    function()
    {
    console.log("Added name");
    })

};
getname();

// 4. Create two txt files, write some dummy text. Read two file content and print it in the console. use async and await.

fs.writeFile('file1.txt','--- First text file', function(err){
    if(err) return console.log(err);
    console.log("New file created");
});

fs.writeFile('file2.txt', '--- Second text file', function(err){
    if(err)  return console.log(err);
    console.log("New file created");
});

function readFile(fileName) {
    return new Promise(
        resolve => 
        {
            fs.readFile(fileName,'utf8', function(err,data)
            {
                if(err) return console.log(err);
                console.log(fileName)
                console.log(data)
            }) 
        resolve();
    });
}

async function run() 
{
    await readFile('file1.txt');
    await readFile('file2.txt');

}

run();

//5. Write your address in one txt file and find out how many consonants are there.

fs.writeFile('address.txt','Ahmedabad, Gujarat',function(err){
    if(err) return console.log(err);
});

function readFile(fileName) {
    return new Promise(
        resolve => 
        {
            fs.readFile(fileName,'utf8',function(err,data)
            {
                if(err) return console.log(err);
                const consonants = data.match(/[^aeiou, ]/gi);
                console.log(consonants.length);
            })
        }
    )
}

async function run()
{
    await readFile('address.txt');
}

run();

// 6. Remove person.txt file.

fs.unlink('files/person.txt' , function(err){
    if(err) 
    {
        throw err
    }
    else
    {
        console.log("File removed")
    }
});

// 7. Create one folder files and move person.txt in that file.

const folderName = 'files'
try {  
    if (!fs.existsSync(folderName)) 
    {    
        fs.mkdirSync(folderName)  
    }
} 
catch (err) {  
    console.error(err)
}

const mv = require('mv');
const path = require("path");
const currentPath = path.join(__dirname, "person.txt");
const destinationPath = path.join(__dirname, "files", "person.txt");

mv(currentPath, destinationPath, function(err) {     
    if (err) 
    {       
        throw err    
    } else {        
        console.log("Successfully moved the file!");    
    }});




