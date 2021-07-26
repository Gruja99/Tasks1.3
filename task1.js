// program to find the factorial of a number
const prompt = require("prompt-sync")({ sigint: true });
// take input from the user
const number = parseInt(prompt('Enter a positive number: '));

function factoriel(number){
// checking if number is negative
if (number < 0) {
    console.log(`Factorial for negative number doesn't exist.`);
}

// if number is 0 or 1
else if (number === 0 && number === 1) {
    console.log(`The factorial of ${number} is 1.`);
}
// if number is positive
else {
    let fact = 1;
    for (i = 1; i <= number; i++) {
        fact *= i;
    }
    console.log(`The factorial of ${number} is ${fact}.`);
}
}

factoriel(number);