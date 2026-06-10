import 'package:flutter/material.dart';
import 'package:node_backend/edit.dart';
import 'package:node_backend/model/product_model.dart';
import 'package:node_backend/services/api.dart';

class UpdatedScreen extends StatelessWidget {
  const UpdatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(title: const Text("Updated Screeen",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      centerTitle: true,
      backgroundColor: Colors.grey.shade200,),
      body: FutureBuilder(
        future: Api.getdata(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<details> pdata = snapshot.data;

            return ListView.builder(
              itemCount: pdata.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.storage),
                  title: Text("Name: ${pdata[index].name}"),
                  subtitle: Text(
                    "City: ${pdata[index].city} | Age: ${pdata[index].age}",
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditScreen(data: pdata[index]),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit,color: Color.fromARGB(255, 10, 10, 10),),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
