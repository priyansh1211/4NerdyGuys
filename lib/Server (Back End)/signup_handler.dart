import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'dart:convert';
import 'dart:async';

class SignupHandler {

  String baseurl = "http://192.168.1.2:5000/user/register";
  var log = Logger();

  Future<dynamic> get(String url) async {

    url = formater();

    final response = await http.get(Uri.parse(url));
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<dynamic> post( String username, String email,String password ,String designation)
  async {
    String url = formater();
    Map<String, String> requestHeaders =
    {'Content-type': 'application/json',
      'Accept': 'application/json',};

    final response = await http.post(Uri.parse(url),body : jsonEncode(<String, String>{
      'username' : username,
      'email' : email,
      'password' : password,
      'designation' : designation,

    }), headers: requestHeaders);



    if(response.statusCode == 200 || response.statusCode == 201 )
      {
        log.i(response.body);
        return response;
      }
   log.i(response.body);
   log.i(response.statusCode);
  }

  String formater(){
    return baseurl;
  }

}




