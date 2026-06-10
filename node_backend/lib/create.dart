import 'package:flutter/material.dart';
import 'package:node_backend/services/api.dart';

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
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: "Enter your name"),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(hintText: "Enter your age"),
            ),
            TextField(
              controller: cityController,
              decoration: InputDecoration(hintText: "Enter Your City"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                var data = {
                  "name": nameController.text,
                  "age": ageController.text,
                  "city": cityController.text,
                };

                Api.adddata(data);
              },
              child: Text("Create Data"),
            ),
          ],
        ),
      ),
    );
  }
}
