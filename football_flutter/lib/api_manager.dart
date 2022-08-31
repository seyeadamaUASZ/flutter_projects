import 'dart:convert';

import 'package:football_flutter/models/soccermodel.dart';
import 'package:http/http.dart';

class SoccerApi{

  final String apiUrl =
      "https://v3.football.api-sports.io/fixtures?season=2020&league=39";

      static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    //Always make sure to check the api key and the limit of a request in a free api
    'x-rapidapi-key': "PUT YOUR API KEY HERE OR IT WILL NOT WORK"
  };

  Future<List<SoccerMatch>> getAllMatches() async{
    Response res = await get(Uri.parse(apiUrl),headers: headers);
    var body;
    if(res.statusCode==200){
      body = jsonDecode(res.body);
      List<dynamic> matcheList = body['response'];
      print("Api service:${body} ");
      List<SoccerMatch> matches = matcheList
        .map((dynamic item) => SoccerMatch.fromJson(item))
        .toList();
      
      return matches;
    }
    return null;
  }
}