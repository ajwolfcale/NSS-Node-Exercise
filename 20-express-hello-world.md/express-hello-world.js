'use strict';
const express = require('express');
require('dotenv').config();
const app = express();

// const requestedTime = (req, res, next) => {
//     req.requestedTime = Date.now().toLocaleString();
//     // next();
// };

app.get('/', (req, res) => {
    // let requestedTime = Date.toISOString();
    let date = new Date;
    let isoDate = date.toISOString();
    res.send(`<h1>Hello, world! ${isoDate} <h1>`);
    console.log("Hey, you there?", isoDate);
});

const port = process.env.PORT || 3000
app.listen(port, () => {
    console.log(`listening on port ${port}`);
});
