import 'package:flutter/material.dart';
import 'package:node_backend/model/user_model.dart';
import 'package:node_backend/services/api.dart';

class FetchData extends StatelessWidget {
  const FetchData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text(
          "Read Page",
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
                // return Card(
                //   color: Colors.white,
                //   child: ListTile(
                //     leading: Text((index + 1).toString()),
                //     title: Text(pdata[index].name.toString()),
                //     subtitle: Text(pdata[index].city.toString()),
                //     trailing: Text(pdata[index].age.toString()),
                //   ),
                // );

                return ListTile(
                  leading: const Icon(Icons.storage),
                  title: Text("Name: ${pdata[index].name}"),
                  subtitle: Text("City: ${pdata[index].city} | Age: ${pdata[index].age}"),
                  trailing: Icon(Icons.note_add),
                );
              },
            );
          }
        },
      ),
    );
  }
}
