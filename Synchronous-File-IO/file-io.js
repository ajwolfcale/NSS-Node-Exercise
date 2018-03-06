#!/usr/bin/env node

const { readFileSync } = require('fs');
const [,,fileArg] = process.argv;



if(fileArg){
    try{
        const data = readFileSync(fileArg);
        process.stdout.write(data.toString());
    } catch (err) {
        console.log('Err', err);
    } 
    } else {
        console.log("Which file do you want?");
        process.exit();
};
