import 'package:flutter/material.dart';
import 'package:node_backend/model/product_model.dart';
import 'package:node_backend/services/api.dart';

class FetchData extends StatelessWidget {
  const FetchData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Read Data")),
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
                return Card(
                  child: ListTile(
                    leading: Text((index + 1).toString()),
                    title: Text(pdata[index].name.toString()),
                    subtitle: Text(pdata[index].city.toString()),
                    trailing: Text(pdata[index].age.toString()),
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
