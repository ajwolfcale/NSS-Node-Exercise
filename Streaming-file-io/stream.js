#!/usr/bin/env node

const [,,file] = process.argv;
const { 
    createReadStream, 
    createWriteStream, 
    appendFile, 
    writeFile 
} = require("fs");
  const { Transform, Writable } = require("stream");
  const upperCase = Transform();
  const writeStream = Writable();
    
  upperCase._transform = (buffer, _, callback) => {
    callback(null, buffer.toString().toUpperCase());
  }
  
  writeStream._write = (buffer, _, next) => {
    writeFile( "languages_caps.json", buffer, (err) => {
      if(err) throw err;
      console.log('file written');
    });
    next();
};

 createReadStream(file)
  .pipe(upperCase)
  .pipe(writeStream);
  
  
  