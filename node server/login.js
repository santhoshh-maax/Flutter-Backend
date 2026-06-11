const mangoose = require("mongoose");
const { default: mongoose } = require("mongoose");

let loginSchema = new mangoose.Schema({
    
    'username' : {
        required : true,
        type: String
    },

    'password' : {
        required : true,
        type: String
    }
});

module.exports = mongoose.model("login",loginSchema);