const exp = require("express"); let db = require("./sqlConn");

var PORT = 5050; var api = exp();

api.set("view engine", "ejs")

api.listen(PORT , () => {
    console.log("API is running")
})

api.get(("/show"), (reg, res , next) => {
    res.json({
        "message": "success"
    })
})
api.use((req, res) => {
    res.status(404)
})

