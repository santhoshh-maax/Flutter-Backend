import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:node_backend/model/user_model.dart';
import 'package:node_backend/services/storage.dart';

class Api {
  //always change IP based on place where you are!!!!
  //also change the proxy setting in emulator setting  page

  //home ip
  static const baseurl = "http://192.168.1.11:2222/";

  //college ip
  // static const baseurl = "http://10.201.198.99:2222/";

  //emulator ip
  // static const baseurl = "http://10.0.2.2:2222/";

  //middleware code

  static Future<Map<String, String>> getHeader() async {
    String? token = await SecureStorage.getToken();

    return {"Authorization": "Bearer $token"};
  }

  //login
  static Future login(data) async {
    var url = Uri.parse(("${baseurl}user/login"));

    try {
      final responce = await http.post(url, body: data);
      if (responce.statusCode == 200) {
        var logindata = jsonDecode(responce.body);
        print(logindata);
        return (logindata);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  //post
  static adddata(Map pdata) async {
    var url = Uri.parse("${baseurl}add/data");
    try {
      print(url);

      //without middleware
      // final responce = await http.post(url, body: pdata);

      //middleware logic

      var headers = await getHeader();

      final responce = await http.post(url, body: pdata, headers: headers);

      if (responce.statusCode == 200) {
        print(responce.body);
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
    List<Details> storedvalues = [];

    var url = Uri.parse("${baseurl}get/data");

    try {
      // final response = await http.get(url);

      var headers = await getHeader();

       print("Headers: $headers");


      final responce = await http.get(url, headers: headers);
      if (responce.statusCode == 200) {
        var data = jsonDecode(responce.body);
        print(data);

        data.forEach((value) {
          storedvalues.add(Details.fromJson(value));
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

    // final response = await http.put(url, body: body);

    var headers = await getHeader();

    final responce = await http.put(url, body: body, headers: headers);
    if (responce.statusCode == 200) {
      print(jsonDecode(responce.body));
    } else {
      print("Failed to update");
    }
  }

  //delete

  static deletedata(id) async {
    var url = Uri.parse("${baseurl}delete/data/$id");

    // final response = await http.delete(url);
    var headers = await getHeader();

    final responce = await http.delete(url, headers: headers);

    if (responce.statusCode == 200) {
      print(jsonDecode(responce.body));
    } else {
      print("Failed to delete");
    }
  }
}
