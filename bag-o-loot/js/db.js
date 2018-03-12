const sqlite3 = require('sqlite3').verbose();
const { createTables } = require("./makeTable");

(function createDb () {
    new sqlite3.Database('loot.sqlite', () => {
        createTables()
        .then( (data) => {
            console.log("kid's bag o' loot", data);
        })
        .catch( (err) => {
            console.log("oops", err);
        });
    });
}());