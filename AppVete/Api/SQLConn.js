var sql = require("mysql");
var data = require("./ConnSQL.json")

var conn = sql.createConnection(data);

conn.connect((err) => {
    if (err) throw err;
    console.log("Connected!")
})
/*
conn.query('Select * From Data;', (err, res, fiels) => {
    if (err) throw err;
    console.log(res);
})
*/
module.exports = conn