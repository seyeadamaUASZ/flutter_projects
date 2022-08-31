import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetWorkHandler{

  String baseUrl = "https://newsapi.org/v2/top-headlines?country=fr&category=business&apiKey=05db4d4ee13c4763a84247372aad944b";
  var log = Logger();

  Future get(String categorie) async {
     String url = formater(categorie);
     var response = await http.get(Uri.parse(url));
     if(response.statusCode ==200 || response.statusCode==201){

       log.i(response.body);

       return json.decode(response.body);
     }
  }


  String formater(String category){
    return baseUrl = "https://newsapi.org/v2/top-headlines?country=fr&category=business&apiKey=05db4d4ee13c4763a84247372aad944b";
  }  

}