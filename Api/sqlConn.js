const  json = require("./sqlDatas.json")

console.log(json)


var sql = require("mysql");
let con = sql.createConnection({
    host : json.host,
    user : json.user,
    password : json.password
});

con.connect((err) => {
    if (err) {
        console.error("DataBase Connection Failed !!!", err)
    } else{
        console.log("Connected to DataBases")
    }

});

module.exports = con;