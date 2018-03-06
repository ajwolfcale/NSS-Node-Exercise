#!/usr/bin/env node
const chalk = require('chalk');

let blueRedStripe = chalk.bgBlue(' * * * * * * * ') + chalk.bgRed('                                   ');
let blueWhiteStripe = chalk.bgBlue('  * * * * * *  ') + chalk.bgWhite('                                   ');
let redStripe = chalk.bgRed('                                                  ')
let whiteStripe = chalk.bgWhite('                                                  ')

let printFlag = () => {
console.log(blueRedStripe);
console.log(blueWhiteStripe);
console.log(blueRedStripe);
console.log(blueWhiteStripe);
console.log(blueRedStripe);
console.log(blueWhiteStripe);
console.log(blueRedStripe);
console.log(whiteStripe);
console.log(redStripe);
console.log(whiteStripe);
console.log(redStripe);
console.log(whiteStripe);
console.log(redStripe);
console.log(whiteStripe);
console.log(redStripe);
};

printFlag();




