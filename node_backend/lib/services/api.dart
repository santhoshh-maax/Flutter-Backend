import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:node_backend/model/product_model.dart';

class Api {
  static const baseurl = "http://192.168.1.11:2222/";
  // static const baseurl = "http://10.0.2.2:2222/";
  //post
  static adddata(Map pdata) async {
    var url = Uri.parse("${baseurl}add/data");
    try {
      final responce = await http.post(url, body: pdata);

      if (responce.statusCode == 200) {
        var data = jsonDecode(responce.body.toString());
        print(data);
      } else {
        print("failed to get responce");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //get
  static getdata() async {
    List<details> storedvalues = [];

    var url = Uri.parse("${baseurl}get/data");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);

        data.forEach((value) {
          storedvalues.add(
            details(
              name: value['name'],
              age: value['age'],
              city: value['city'],
              id: value['_id'].toString(),
            ),
          );
        });
      }

      return storedvalues;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //put

  static updatedata(id, body) async {
    var url = Uri.parse("${baseurl}put/data/$id");

    final response = await http.put(url, body: body);

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
    } else {
      print("Failed to update");
    }
  }

  //delete

  static deletedata(id) async {
    var url = Uri.parse("${baseurl}delete/data/$id");

    final response = await http.delete(url);

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
    } else {
      print("Failed to delete");
    }
  }
}
