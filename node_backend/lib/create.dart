import 'package:flutter/material.dart';
import 'package:node_backend/services/api.dart';
import 'package:node_backend/model/user_model.dart';

class CreateData extends StatefulWidget {
  const CreateData({super.key});

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text(
          "Create data",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 500,
            width: 350,
            child: Card(
              color: Colors.grey.shade200,
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.note, size: 30, color: Colors.blueAccent),

                    const Text(
                      "Add Values here",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),

                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Enter your name",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: ageController,
                      decoration: InputDecoration(
                        labelText: "Enter your age",
                        prefixIcon: Icon(Icons.calculate),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: cityController,
                      decoration: InputDecoration(
                        labelText: "Enter Your City",
                        prefixIcon: Icon(Icons.location_city),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            246,
                            247,
                            245,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(20),
                          ),
                        ),
                        onPressed: () {
                          // var data = {
                          //   "name": nameController.text,
                          //   "age": ageController.text,
                          //   "city": cityController.text,
                          // };

                          Details data = Details(
                            name: nameController.text,
                            age: ageController.text,
                            city: cityController.text,
                          );
                          print(data.toJson());
                          if (nameController.text.trim().isEmpty ||
                              ageController.text.trim().isEmpty ||
                              cityController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please fill up fields"),
                              ),
                            );
                            return;
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Data Created Sucessfully"),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Api.adddata(data.toJson());
                        },
                        child: Text(
                          "Create Data",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
