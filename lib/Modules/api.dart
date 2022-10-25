import 'dart:convert';

import 'package:http/http.dart';

class Api {
  final URL = "http://localhost:5000/";

  Future<Map?> fetchData() async {
    try {
      final response = await get(Uri.parse(URL+"/trading/data/?apiKey=asdfghjkl"));
      Map jsonData = jsonDecode(response.body);
      return jsonData;
    } catch (err) {
      print("error =======>"+err.toString());
    }
  }

  Future<Map?> getData() async {
    try {
      final response = await get(Uri.parse(URL+"/application/segmentData/"));
      Map jsonData = jsonDecode(response.body);
      print("Get data of all : ============ "+jsonData["NFO"].toString());
      return jsonData;
    } catch (err) {
      print("error =======>"+err.toString());
    }
  }


  Future<Map?> loginApi (Map map1) async{
    try {
      final response = await post(Uri.parse(URL+"user/login"),body: jsonEncode(map1),headers: {"Content-Type": "application/json"});
      Map map2 = jsonDecode(response.body)as Map<String,dynamic>;
      print("login : "+map2.toString());
      return map2;
    }
    catch(err) {
      print("error =======>"+err.toString());
    }
  }

  Future<Map?> PostData (Map map1) async{
    try {
      final response = await post(Uri.parse(URL+"user/login"),body: map1);
      Map map2 = jsonDecode(response.body)as Map<String,dynamic>;
      print("login : "+map2.toString());
      return map2;
    }
    catch(err) {
      print("error =======>"+err.toString());
    }
  }
}
//Code for connecting backend with frontend