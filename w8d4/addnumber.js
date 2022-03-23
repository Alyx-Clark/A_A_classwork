const readline = require("readline");
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback){
    if (numsLeft > 0){
        // console.log(numsLeft)
        numsLeft--;
        rl.question('What number do you want to add to Sum? ', function (number) {
            let answer = parseInt(number);
            sum += answer;
            console.log(sum);
            
            addNumbers(sum, numsLeft,completionCallback);
        });
    }else{
        completionCallback(sum)
        rl.close();
    }
}
addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
// rl.question('What number do you want to add to Sum? ', function (answer) {
//     const response = answer;
//     console.log(`Thank you for your input: ${response}`);
//     rl.close();
// });

