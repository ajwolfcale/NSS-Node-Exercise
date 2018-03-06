#!/usr/bin/env node

const num1 = parseInt(process.argv[2]);
const num2 = parseInt(process.argv[3]);

let numSum = (num1, num2) => {
    sum = num1 + num2;
    console.log(sum);
}

numSum(num1, num2);
