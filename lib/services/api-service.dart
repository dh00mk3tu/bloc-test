// import http package in flutter 
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:test/model/club-model.dart';

abstract class ClubRepo {
  Future <ClubModel> getClubs();
}


class ClubServices implements ClubRepo {

  
  var responseJson;
  
  
  @override
  Future <ClubModel> getClubs() async{
    Uri baseUrl = 'shield.threedots.app';
    Uri _clubsUrl = 'vision/v1/clubs/user';
    var client = http.Client();
    var newsModel;

    try {
      var response = await client.get('https://$baseUrl/$_clubsUrl');
        if(response.statusCode == 200){
          var jsonString = response.body;
          var jsonMap = json.decode(jsonString);

          newsModel = ClubModel.fromJson(jsonMap);
        }
    } catch (Exception) {
          return newsModel;
    }
    return newsModel;
  }
}