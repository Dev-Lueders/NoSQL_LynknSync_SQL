const mysql2 = require("mysql2");

    const connection = mysql2.createConnection({
        host:"127.0.0.1",
        user:"root",
        password:"root",
        database: "MySQL_LynknSync",
        port: 3307,
    })
    connection.connect((err) =>{
        if (err) {
            console.error("Could Not connect to MySQL_LynknSync",err.stack);
        return;
        }
        console.log("Connection successful to MySQL for LynknSync");
    });
