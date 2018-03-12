const sqlite3 = require('sqlite3');
const db = new sqlite3.Database('loot.sqlite');
const { kids } = require('../data/kids');

module.exports.createTables = () => {
	return new Promise((resolve, reject) => {
		db.run('DROP TABLE IF EXISTS kids')
			.run(
			'CREATE TABLE IF NOT EXISTS kids (kid_id INTEGER PRIMARY KEY AUTOINCREMENT,first_name TEXT, toy TEXT, delivered TEXT, naughty TEXT)', (err) => {
				if (err) return reject(err);
				resolve(insertRows());
			});
	});
};

let insertRows = () => {
	return Promise.all(kids.map(({ firstName, toy, delivered, naughty }) => {
		return new Promise((resolve, reject) => {
			db.run(`INSERT INTO kids VALUES (
                null, "${firstName}", "${toy}", "${delivered}", "${naughty}")`,
				function (err) {
					if (err) return reject(err);
					resolve(this.lastID);
				});
		});
	}));
};