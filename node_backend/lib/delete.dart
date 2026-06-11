import 'package:flutter/material.dart';
import 'model/user_model.dart';
import 'services/api.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text(
          "Delete panel",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade200,
      ),
      body: FutureBuilder(
        future: Api.getdata(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<Details> pdata = snapshot.data;
            return ListView.builder(
              itemCount: pdata.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.storage),
                  title: Text("Name: ${pdata[index].name}"),
                  subtitle: Text(
                    "Age: ${pdata[index].age} | City ${pdata[index].city}",
                  ),
                  trailing: IconButton(
                    onPressed: () async {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Data Deleted Sucessfully"),
                          backgroundColor: Colors.red,
                        ),
                      );
                      await Api.deletedata(pdata[index].id);
                      pdata.removeAt(index);
                      setState(() {});
                    },
                    icon: const Icon(Icons.delete, color: Colors.red),
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
