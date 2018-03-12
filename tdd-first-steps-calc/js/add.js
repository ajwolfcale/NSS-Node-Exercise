#!/usr/bin/env node

const num1 = parseInt(process.argv[2]);
const num2 = parseInt(process.argv[3]);

module.exports.add = () => {
    return new Promise( (resolve, reject) => {
        let add = (num1, num2) => {
        sum = num1 + num2;
        console.log(sum);
        }
    })
add(num1, num2);
} 