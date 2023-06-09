const exp = require("express")
var app = exp()
var db = require("./sql")



app.get(("/api/") , (req, res , nxt) => {
    var sql = "select * from User"
    var param = []

    db.all(sql,param, (err, rows) => {
        if (err){
            res.status(400).json({"error": err.message})
        }
        res.json(
                    rows
                )
    })
})

app.get(("/api/:a") , (req, res , nxt) => {
    var sql = "select * from User where id = "+ req.params.a
    var param = []

    db.all(sql,param, (err, rows) => {
        if (err){
            res.status(400).json({"error": err.message})
        }
        res.json({
            "id" : rows[0].id,
            "name": rows[0].name,
            "TpUser": rows[0].TpUser
        })
    })
})
/*
app.post("/api/add", (req, res, nxt) => {
    var sql = "Insert into User (name, TpUser) values ('"+req.params.a+"', "+ req.params.b +");"
    db.run(sql, (err, result) => {
        if(err){
            res.status(400).json({"error": err.message})
        }
        res.json({
            "message": "succesful",
        })
    })
})
*/

module.exports = app 