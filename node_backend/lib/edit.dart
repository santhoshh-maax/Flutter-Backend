import 'package:flutter/material.dart';
import 'package:node_backend/model/product_model.dart';
import 'package:node_backend/services/api.dart';

class EditScreen extends StatefulWidget {
  final details data;
  const EditScreen({super.key, required this.data});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController u_name = TextEditingController();
  TextEditingController u_age = TextEditingController();
  TextEditingController u_city = TextEditingController();

  @override
  void initState() {
    super.initState();
    u_name.text = widget.data.name.toString();
    u_age.text = widget.data.age.toString();
    u_city.text = widget.data.city.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Panel")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: u_name,
              decoration: const InputDecoration(hintText: "Name here"),
            ),

            TextField(
              controller: u_age,
              decoration: const InputDecoration(hintText: "Age here"),
            ),
            TextField(
              controller: u_city,
              decoration: const InputDecoration(hintText: "City here"),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:  ()  {
                 Api.updatedata(widget.data.id, {
                  "name": u_name.text,
                  "city": u_city.text,
                  "age": u_age.text,
                  "id": widget.data.id,
                });
            
              },
              child: const Text("Update Data"),
            ),
          ],
        ),
      ),
    );
  }
}
