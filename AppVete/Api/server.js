const exp = require("express");
const sql = require("./SQLConn")

var app = exp();
var port = 3030;

app.get("/", (req, res) => {
    res.send("A")
});

app.get("/show", (req, res, next) => {
        bs = "Select * From Data;"
        sql.query(bs, (err, rows) => {
            if (err) throw err;
            res.json({
                "message" : "Sucessful",
                "data" : rows
            })
        })
})

app.listen(port, () => {
    console.log("Api Is Running")
});

