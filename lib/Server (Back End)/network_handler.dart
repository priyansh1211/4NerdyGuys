import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'dart:convert';
import 'dart:async';

class NetworkHandler {


  Map<String, String> requestHeaders =
  {'Content-type': 'application/json',
    'Accept': 'application/json',};

  String baseurl = "http://192.168.108.77:5000/user";
  var log = Logger();

  Future<dynamic> get(String url) async {

    url = formater("/register");

    final response = await http.get(Uri.parse(url));
    log.i(response.body);
    log.i(response.statusCode);
  }
  //
  // Future<List> Username(Map <String,String> body)
  // async {
  //
  //   String url = formater("/find-username");
  //   final response = await http.post(Uri.parse(url),body : jsonEncode(body), headers: requestHeaders);
  //
  //
  //
  //   if(response.statusCode == 200 || response.statusCode == 201 )
  //   {
  //     log.i(response.body);
  //     return response.body;
  //   }
  //   log.i(response.body);
  //   log.i(response.statusCode);
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


  Future<List> listproject()
  async {

    String url = formater("/getprojects");

    final response = await http.get(Uri.parse(url));

    //final response = await http.post(add,body : jsonEncode(""), headers: requestHeaders);

    final List map = jsonDecode(response.body);
   // log.i(map);
    //print("$map ==++++>>");

    if(response.statusCode == 200 || response.statusCode == 201 )
    {
      log.i(response.body);
      return map;
    }
    log.i(response.body);
    return [];
  }

  Future<List> listitem(Map<String, String> body)
  async {

    String url = formater("/getitems");

    final response = await http.post(Uri.parse(url),body : jsonEncode(body), headers: requestHeaders);

    //final response = await http.post(add,body : jsonEncode(""), headers: requestHeaders);

    final List map = jsonDecode(response.body);
    // log.i(map);
    //print("$map ==++++>>");

    if(response.statusCode == 200 || response.statusCode == 201 )
    {
      log.i(response.body);
      return map;
    }
    log.i(response.body);
    return [];
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

  String formater(String url){
    return baseurl + url;
  }

}




