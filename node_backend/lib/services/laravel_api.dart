import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:node_backend/model/user_model.dart';

class Api {
  static const baseurl = "http://192.168.1.11:2222/api/";

  // LOGIN
  static Future login(Map data) async {
    var url = Uri.parse("${baseurl}user/login");

    try {
      final response = await http.post(url, body: data);

      print("Login Status: ${response.statusCode}");
      print("Login Body: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  // POST
  static Future adddata(Map pdata) async {
    var url = Uri.parse("${baseurl}add/data");

    try {
      final response = await http.post(url, body: pdata);

      print("POST Status: ${response.statusCode}");
      print("POST Body: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // GET
  static Future<List<Details>> getdata() async {
    List<Details> storedvalues = [];
    var url = Uri.parse("${baseurl}get/data");

    try {
      final response = await http.get(url);

      print("GET Status: ${response.statusCode}");
      print("GET Body: ${response.body}");

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        for (var value in data) {
          storedvalues.add(Details.fromJson(value));
        }
      }

      return storedvalues;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  // UPDATE
  static Future updatedata(id, Map body) async {
    var url = Uri.parse("${baseurl}put/data/$id");

    try {
      final response = await http.put(url, body: body);

      print("PUT Status: ${response.statusCode}");
      print("PUT Body: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // DELETE
  static Future deletedata(id) async {
    var url = Uri.parse("${baseurl}delete/data/$id");

    try {
      final response = await http.delete(url);

      print("DELETE Status: ${response.statusCode}");
      print("DELETE Body: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}