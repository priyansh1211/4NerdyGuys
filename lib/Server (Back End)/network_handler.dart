// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'dart:convert';
import 'dart:async';

class NetworkHandler {


  Map<String, String> requestHeaders =
  {'Content-type': 'application/json',
    'Accept': 'application/json',};

  String baseurl = "http://192.168.1.2:5000/user";
  var log = Logger();

  Future<dynamic> get(String url) async {

    url = formater("/register");

    final response = await http.get(Uri.parse(url));
    log.i(response.body);
    log.i(response.statusCode);
  }

  // Future<String> Username(Map <String,String> body)
  // async {
  //
  //   String url = formater("/find-username");
  //   final response = await http.post(Uri.parse(url),body : jsonEncode(body), headers: requestHeaders);
  //
  //   if(response.statusCode == 200 || response.statusCode == 201 )
  //   {
  //     log.i(response.body);
  //     final List map = jsonDecode(response.body);
  //     return map[0];
  //   }
  //   log.i(response.body);
  //   log.i(response.statusCode);
  //   return "";
  // }

  Future<List?> loginApi (Map <String,String> body) async{
    try {
      String url = formater("/login");
      //print("login : $body");
      final response = await http.post(Uri.parse(url),body: jsonEncode(body),headers: {"Content-Type": "application/json"});
      // Map map2 = jsonDecode(response.body)as Map<String,dynamic>;
      // // print("login : $map2");


      if(response.statusCode == 200)
      {
        String url = formater("/find-username");
        final response = await http.post(Uri.parse(url),body : jsonEncode(body), headers: requestHeaders);
        final List map = jsonDecode(response.body);
        return map;
      }

    }
    catch(err) {
      //print("error =======>$err");
    }
    return [];
  }

  Future<bool?> OtpVerification( Map <String,String> body)
  async {

    String url = formater("/verifyOTP");

    log.i(body);
    final response = await http.post(Uri.parse(url),body : jsonEncode(body), headers: requestHeaders);


    if(response.statusCode == 200 || response.statusCode == 201 )
    {
      log.i(response.body);
      return true;
    }
    log.i(response.body);
    log.i(response.statusCode);
    return false;
  }

  Future<dynamic> post( Map <String,String> body)
  async {
    String url = formater("/register");

    final response = await http.post(Uri.parse(url),body : jsonEncode(body), headers: requestHeaders);


    if(response.statusCode == 200 || response.statusCode == 201 )
      {
        log.i(response.body);
        return response.body;
      }
   log.i(response.body);
   log.i(response.statusCode);
  }



  Future<bool?> contactDeveloper( Map <String,String> body)
  async {

    String url = formater("/contact_us");

    final response = await http.post(Uri.parse(url),body : jsonEncode(body), headers: requestHeaders);


    if(response.statusCode == 200 || response.statusCode == 201 )
    {
      log.i(response.body);
      return true;
    }
    log.i(response.body);
    log.i(response.statusCode);
    return false;
  }


  Future<bool?> addProject( Map <String,String> body)
  async {

    String url = formater("/addprojects");

    final response = await http.post(Uri.parse(url),body : jsonEncode(body), headers: requestHeaders);


    if(response.statusCode == 200 || response.statusCode == 201 )
    {
      log.i(response.body);
      return true;
    }
    log.i(response.body);
    log.i(response.statusCode);
    return false;
  }


  Future<bool?> editProject( Map <String,String> body)
  async {

    String url = formater("/editprojects");

    final response = await http.post(Uri.parse(url),body : jsonEncode(body), headers: requestHeaders);


    if(response.statusCode == 200 || response.statusCode == 201 )
    {
      log.i(response.body);
      return true;
    }
    log.i(response.body);
    log.i(response.statusCode);
    return false;
  }

  Future<Map<String,dynamic>> listtoSave(Map<String,String> body)
  async {



    String url = formater("/getActive");

    final response = await http.post(Uri.parse(url),body : jsonEncode(body), headers: requestHeaders);

    final Map<String,dynamic> map = jsonDecode(response.body);
    // log.i(map);
    //print("$map ==++++>>");

    if(response.statusCode == 200 || response.statusCode == 201 )
    {
      log.i(response.body);
      return map;
    }
    //log.i(response.body);
    return {};
  }


  Stream<List> listActiveEmployeer(Map<String, String> body)
  async* {

    String url = formater("/getActiveEmployee");
    while(true)
      {
        Future.delayed(const Duration(seconds : 1));
        final response = await http.post(Uri.parse(url),body : jsonEncode(body), headers: requestHeaders);

        final List map = jsonDecode(response.body);

        if(response.statusCode == 200 || response.statusCode == 201 )
        {
          yield map;
        }
      }

  }

  Future<List> listproject()
  async {

    String url = formater("/getprojects");

    final response = await http.get(Uri.parse(url));
    final List map1 = jsonDecode(response.body);

   if(response.statusCode == 200 || response.statusCode == 201 )
    {
      return map1;
    }
    return [];
  }

  Stream<List> listforActiveDropDown()
  async* {

    String url = formater("/getprojects");

    final response = await http.get(Uri.parse(url));
    final List map1 = jsonDecode(response.body);


    if(response.statusCode == 200 || response.statusCode == 201 )
    {
     // log.i(response.body);
      yield map1;
    }
  }

  Future<bool> updateActiveEmployees(Map<String, dynamic> body)
  async {

    String url = formater("/updateActiveEmployee");

    final response = await http.post(Uri.parse(url),body : jsonEncode(body), headers: requestHeaders);

    if(response.statusCode == 200 || response.statusCode == 201 )
    {
      return true;
    }

    return false;
  }


  Future<List> listitem(Map<String, String> body)
  async {
    log.i(body);

    String url = formater("/getitems");

    final response = await http.post(Uri.parse(url),body : jsonEncode(body), headers: requestHeaders);

    //final response = await http.post(add,body : jsonEncode(""), headers: requestHeaders);

    final List map = jsonDecode(response.body);
    log.i(map);
    //print("$map ==++++>>");

    if(response.statusCode == 200 || response.statusCode == 201 )
    {
      log.i(response.body);
      return map;
    }
    log.i(response.body);
    return [];
  }

  Stream<List> listitemdetails(Map<String, String> body)
  async* {

    String url = formater("/getitemsdetails");

    while(true)
      {
        Future.delayed(const Duration(milliseconds: 100 ));
        final response = await http.post(Uri.parse(url),body : jsonEncode(body), headers: requestHeaders);

        final List map = jsonDecode(response.body);

        if(response.statusCode == 200 || response.statusCode == 201 )
        {
          //log.i(response.body);
          yield map;
        }
      }



  }

  Future<bool?> addItems( Map <String,String> body)
  async {

    String url = formater("/additems");

    final response = await http.post(Uri.parse(url),body : jsonEncode(body), headers: requestHeaders);


    if(response.statusCode == 200 || response.statusCode == 201 )
    {
      log.i(response.body);
      return true;
    }
    log.i(response.body);
    log.i(response.statusCode);
    return false;
  }

  Future<bool> updateItems(Map<String, dynamic> body)
  async {

    String url = formater("/updateitems");
    log.i(body);

    final response = await http.post(Uri.parse(url),body : jsonEncode(body), headers: requestHeaders);

    if(response.statusCode == 200 || response.statusCode == 201 )
    {
      log.i(response.body);
      return true;
    }

    return false;
  }

  Future<bool> updateQuantityItems(Map<String, dynamic> body)
  async {

    String url = formater("/updatequantityitems");
    log.i(body);

    final response = await http.post(Uri.parse(url),body : jsonEncode(body), headers: requestHeaders);

    if(response.statusCode == 200 || response.statusCode == 201 )
    {
      log.i(response.body);
      return true;
    }

    return false;
  }

  String formater(String url){
    return baseurl + url;
  }

}




