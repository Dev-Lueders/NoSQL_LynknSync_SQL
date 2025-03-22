const mongoose = require("mongoose");
const fs = require("fs");
mongoose
    .connect("mongodb://localhost:27018/MongoDb_LynknSync")
    .then(()=>{
        console.log("Initializing MONGO DB for LynknSync");
        
    })
    .catch((error) => {
        console.error("Could Not Connect to MongoDb_LynknSync Check the connection Port")
    })

    