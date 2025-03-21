const mysql2 = require("mysql2");

    const connection = mysql.createConnection({
        host:"127.0.0.1",
        user:"root",
        password:"root",
        database: "MySQL_LynknSync",
        port: 3306,
    })
    connection.connect((err) =>{
        if (err) {
            console.log("Could Not connect to MySQL_LynknSync",err.stack);
        return;
        }
        console.log("Connection successful to MySQL for LynknSync");
    });
