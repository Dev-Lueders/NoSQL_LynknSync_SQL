const mongoose = require("mongoose");
const fs = require("fs");
mongoose
    .connect(

        {useNewURLParser: true,
            useUnifidedTopology: true,
        }
    )
    .then(()=>{
        console.log("Initializing MONGO DB for LynknSync");
        
    })