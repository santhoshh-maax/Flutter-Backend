const express = require("express");
const mongoose = require("mongoose");
const jwt = require("jsonwebtoken");


const app = express();
const userData = require("./userData");
const loginData = require("./login");
const authMiddleware = require("./middleware/auth");

const JWT_KEY = "santhosh@225";

app.use(express.json());

app.use(express.urlencoded(
    {extended: true}
));

// const userData = [];

//db connection
mongoose.connect(
  "mongodb+srv://santhosh:sara225__@cluster0.zv0x7nw.mongodb.net/flutter_backend"
)
.then(() => {
    console.log("DB Connected");


//post login

app.post("/user/login", async (request, responce) => {
    console.log("LOGIN method", request.body);
    try {
        let check = await loginData.findOne({
            username: request.body.username,
            password: request.body.password,
        });
        if (!check) {
        return responce.status(401).json({
            message: "Invalid Login"
        }); 
        }

        //jwt token
        const token = jwt.sign(
            {
                id: check._id,
                username: check.username
            },
            JWT_KEY,
            {
                expiresIn: "7d"
            }
        );
        console.log("Searching User:", request.body.username);
        console.log("DB Result:", check);
        responce.status(200).json({
            token: token,
            username: check.username
        }
        );
    } catch (error) {
        console.log("ERROR:", error);
        responce.status(400).json({
            'status': error.message
        })
    }
});


//post
app.post("/add/data",authMiddleware, async (request,responce) => {
console.log("Recived data", request.body);

let data = userData(request.body);

try {
    let dataToStore = await data.save();
    console.log("Saved Data:", dataToStore);
    responce.status(200).json(dataToStore);
} catch (error) {
    console.log("ERROR:", error);
    responce.status(400).json({
        'Status': error.message
    })
    
}


// const pdata = {
//     "id": userData.length + 1,
//     "name": request.body.name,
//     "city": request.body.city,
//     "age": request.body.age
// };

// userData.push(pdata);
// console.log("FINAL", pdata);

// responce.status(200).send({
//     "Status_code": 200,
//     "Message": "Data added successfully",
//     "product": pdata
// });

});

//get
app.get("/get/data", authMiddleware, async (request,responce) => {
    try {
        let data = await userData.find();
        console.log("Fetched Records:", data.length);
        console.log(data);
        responce.status(200).json(data);
        
    } catch (error) {
        
        console.log("ERROR:", error);
        responce.status(400).json({
            'Status': error.message,
            
        })
        
    }
    

    // console.log("GET method:",userData);
    // if(userData.length > 0){
    //     responce.status(200).send({
    //         "Status_code": 200,
    //         "Data": userData
    //     });
    // }
    // else{
    //     responce.status(200).send({
    //         "Status_code" : 200,
    //         "data": []
    //     });
    // }
});

//PUT

app.put("/put/data/:id", authMiddleware, async (request,responce) => {
    
    let id = request.params.id;
     console.log("Update ID:", id);
    let UpdatedData = request.body;
    console.log("Old Data Request:", UpdatedData);
    let options = { returnDocument: 'after' };
   
    

    try {
        const data = await userData.findByIdAndUpdate(id, UpdatedData, options);
        console.log("Updated Record:", data);

        responce.send(data)
    } catch (error) {
        console.log("ERROR:", error);
        responce.send(error.message)
    }


    
    // let id = request.params.id*1;
    // console.log("UPDATE ID", id);
    // let DataToUpdate = userData.find(p=>p.id === id);
    //  console.log("OLD DATA", DataToUpdate);
    // let index = userData.indexOf(DataToUpdate);


    // userData[index] = request.body;
    // console.log("UPDATED DATA", request.body);

    // responce.status(200).send({
    //     "Status_Code": 200,
    //     "Message": "Data Updated"
    // })
 
});

//Delete 

app.delete("/delete/data/:id",authMiddleware, async (request,responce) => {

    
    let id = request.params.id;
    console.log("Delete ID:", id);

    try {
        const data = await userData.findByIdAndDelete(id);
        console.log("Deleted Record:", data);
        responce.json({
            'Status':" User Data Deleted from DB"
        });
    } catch (error) {
        console.log("ERROR:", error);
        responce.json(error.message);
    }
    
    // let id = request.params.id*1;
    // console.log("delete ID", id);
    // console.log("Before:", userData);

    // let DataToDeleted = userData.find(p => p.id === id);
    

    // let index = userData.indexOf(DataToDeleted);
    // console.log("Deleted index:" ,index);
    // userData.splice(index,1);
    //  console.log("After:", userData);

    // responce.status(200).send({
    //     "Status" : "Success",
    //     "message" : "data deleted" 
    // });



});

})
.catch((err) => {
    console.log("DB Error:", err);
});



app.listen(2222, "0.0.0.0", () => {
    console.log("server is running on port 2222");
});