const mongoose = require("mongoose");

let dataSchema = new mongoose.Schema({
    'name': {
        require: true,
        type: String
    },
    'age':{
        require: true,
        type: String
    },
    'city':{
        require: true,
        type: String
    }
});

module.exports = mongoose.model("user_data",dataSchema);