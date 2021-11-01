
const EventEmitter = require("events");
const emitter = new EventEmitter();

const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
})

var eno;
var subcode;
var flag;

const question1 = () => {
    return new Promise((resolve,reject) => {
            readline.question('Enter your enrolment number:', 
            data => { eno = data; resolve() })
    })
}

const question2 = () => {
    return new Promise((resolve,reject) => {
            readline.question('Enter your subject code:', 
            data => { subcode = data; resolve() })
    })
}

// const question3 = () => {
//     return new Promise((resolve,reject) => {
//             readline.question('Do you want to start exam:', 
//             data => { flag = data; resolve() })
//     })
// }

emitter.on('start', () => {
    setTimeout(() => {
        readline.close();
        console.log('Exam has ended!');
    }, 1.08e+7 );
})

emitter.on('process', () => {
    setTimeout(() => {
        readline.close();
        console.log("Your exam has begun!");
    }, 5000 );
})

const main = async() => {
    await question1();
    await question2();
    console.log('Enrollment Number: ' +eno);
    console.log('Subject Code: ' +subcode);
    //await question3();
        console.log("Your exam will begin in 5 seconds");
        emitter.emit('process');
        emitter.emit('start');
    
}

main();
