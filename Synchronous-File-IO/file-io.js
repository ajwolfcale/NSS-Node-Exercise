#!/usr/bin/env node

// const { readFileSync } = require('fs');
const fs = require('fs');
const [,,fileArg] = process.argv;


if(fileArg){
    try{
        fs.readFile(fileArg, 'utf8', function(err, data) {  
            console.log(data);
        });
    } catch (err) {
        console.log('Err', err);
    } 
    } else {
        console.log("Which file do you want?");
        process.exit();
};



