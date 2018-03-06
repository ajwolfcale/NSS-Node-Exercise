#!/usr/bin/env node

const fs = require('fs');
const [,,fileArg] = process.argv;


if(fileArg){
    fs.readFile(fileArg, 'utf8', (err, data) => {  
        console.log(data);
        if (err) throw err;
    });
};