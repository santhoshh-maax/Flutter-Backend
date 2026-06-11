const express = require("express");
const mongoose = require("mongoose");


const app = express();
const userData = require("./userData");
const loginData = require("./login");

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

app.post("/user/login", async (request, response) => {
    console.log("LOGIN method", request.body);
    try {
        let check = await loginData.findOne({
            username: request.body.username,
            password: request.body.password,
        });
        console.log("check:",check);
        response.status(200).json(check);
    } catch (error) {
        response.status(400).json({
            'status': error.message
        })
    }
});


//post
app.post("/add/data",async (request,response) => {
console.log("POST method", request.body);

let data = userData(request.body);

try {
    let dataToStore = await data.save();
    response.status(200).json(dataToStore);
} catch (error) {
    response.status(400).json({
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

// response.status(200).send({
//     "Status_code": 200,
//     "Message": "Data added successfully",
//     "product": pdata
// });

});

//get
app.get("/get/data", async (request,response) => {

    try {
        let data = await userData.find();
        response.status(200).json(data);
        
    } catch (error) {
        response.status(400).json({
            'Status': error.message
        })
        
    }
    

    // console.log("GET method:",userData);
    // if(userData.length > 0){
    //     response.status(200).send({
    //         "Status_code": 200,
    //         "Data": userData
    //     });
    // }
    // else{
    //     response.status(200).send({
    //         "Status_code" : 200,
    //         "data": []
    //     });
    // }
});

//PUT

app.put("/put/data/:id",  async (request,response) => {
    
    let id = request.params.id;
    let UpdatedData = request.body;
    let options = { returnDocument: 'after' };

    try {
        const data = await userData.findByIdAndUpdate(id, UpdatedData, options);

        response.send(data)
    } catch (error) {
        response.send(error.message)
    }


    
    // let id = request.params.id*1;
    // console.log("UPDATE ID", id);
    // let DataToUpdate = userData.find(p=>p.id === id);
    //  console.log("OLD DATA", DataToUpdate);
    // let index = userData.indexOf(DataToUpdate);


    // userData[index] = request.body;
    // console.log("UPDATED DATA", request.body);

    // response.status(200).send({
    //     "Status_Code": 200,
    //     "Message": "Data Updated"
    // })
 
});

//Delete 

app.delete("/delete/data/:id", async (request,response) => {

    
    let id = request.params.id;

    try {
        const data = await userData.findByIdAndDelete(id);
        response.json({
            'Status':" User Data Deleted from DB"
        });
    } catch (error) {
        response.json(error.message);
    }
    
    // let id = request.params.id*1;
    // console.log("delete ID", id);
    // console.log("Before:", userData);

    // let DataToDeleted = userData.find(p => p.id === id);
    

    // let index = userData.indexOf(DataToDeleted);
    // console.log("Deleted index:" ,index);
    // userData.splice(index,1);
    //  console.log("After:", userData);

    // response.status(200).send({
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