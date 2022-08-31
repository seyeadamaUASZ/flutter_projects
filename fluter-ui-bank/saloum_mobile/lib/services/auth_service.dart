
import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class AuthService{
  String baseUrl = "http://192.168.191.99:9090/";
  
  var log = Logger();

  Future<http.Response> post(String url,Map<String,String>body) async{
    url=formater(url);
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json"
      },
      body: json.encode(body)
    );
    return response;
  }

  String formater(url){
    return baseUrl+url;
  }
  
}