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
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        centerTitle: true,
        title: const Text("Edit Page",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
        )),
      body: Center(

        child:SizedBox(
          height: 500,
          width: 350,
          child: Card(
          child: Padding(padding: const EdgeInsets.all(20),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,


          children: [

            const Icon(Icons.edit,
            size: 30,
            color: Colors.blue,),

            const Text("Edit Values Here",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),

            const SizedBox(height: 20),



            TextField(
              controller: u_name,
              decoration:  InputDecoration(
                labelText: "Name here",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
                ),
            ),

            TextField(
              controller: u_age,
              decoration:  InputDecoration(labelText:  "Age here",
              prefixIcon: Icon(Icons.calculate),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              )),
            ),
            TextField(
              controller: u_city,
              decoration:  InputDecoration(labelText: "City here",
              prefixIcon: Icon(Icons.location_city),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              )),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 50,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 246, 247, 245),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(20)
                  )
                ),
              onPressed:  ()  {
                 Api.updatedata(widget.data.id, {
                  "name": u_name.text,
                  "city": u_city.text,
                  "age": u_age.text,
                  "id": widget.data.id,
                });
            
              },
              child: const Text("Update Data",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            ),
            
          ],
        ),
          ),
        ),
        ),
        
        
      ),
    );
  }
}
