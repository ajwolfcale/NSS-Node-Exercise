const http = require('http');
const server  = http.createServer();
const { readFile } = require('fs');
const { createServer }  = require('http');

server.on('request',(req, res) => {
    // let url = req.url;
    let resource = 'index.html';
    readFile(resource, (err, file) => {
        if(err){
            res.statusCode = 404;
            return res.end('<h1>404: File Not Found</h1>');
        }
        res.end(file);
    });
});

server.listen(8080, () => {
    console.log('listening on port 8080');
});
