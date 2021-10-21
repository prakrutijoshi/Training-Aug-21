//  University of Mumbai needs to set an online exam for their students. For that they need to set a timer for three hours. After 3 hours exams should be finished.

function exam(arg)
{
    console.log("Exam Finished: "+arg+" are completed");
}

setTimeout(exam, 300000 , "3 hours");