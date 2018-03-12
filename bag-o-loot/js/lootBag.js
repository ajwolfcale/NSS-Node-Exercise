
const sqlite3 = require('sqlite3');
const db = new sqlite3.Database('loot.sqlite', (err) => {
    if (err) return console.log("db is not working");
    console.log("Successfully connected to DB");
});

module.exports.getKidsLoot = () => {
    return [{}];
};

module.exports.addKid = ({ firstName, toy, delivered, naughty }) => {
    return new Promise((resolve, reject) => {
        db.run(`INSERT INTO kids VALUES( 
            null,
            "${firstName}",
            "${toy}",
            "${delivered}",
            "${naughty}"
        )`, function () {
                resolve({ id: this.lastID });
            });
    });
};

module.exports.getSingleKid = (kid_id) => {
    return new Promise((resolve, reject) => {
        db.get(`SELECT * FROM kids WHERE kid_id = ${kid_id}`, (err, result) => {
            console.log("result", result);
            resolve(result);
        });
    });
};