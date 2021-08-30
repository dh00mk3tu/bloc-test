import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/bloc/club-events.dart';
import 'package:test/model/club-model.dart';
import 'package:test/services/api-service.dart';

import 'club-states.dart';

// repo object 
final clubrepo = ClubRepo;

enum ClubGet {
  Fetch,
}

class ClubBloc {
  final _stateStreamController = StreamController<List<ClubModel>>();
  StreamSink<List<ClubModel>> get clubSink => _stateStreamController.sink;
  Stream<List<ClubModel>> get clubStream => _stateStreamController.stream;

  final _eventController = StreamController<ClubGet>();
  StreamSink<ClubGet> get eventSink => _eventController.sink;
  Stream<ClubGet> get eventStream => _eventController.stream;

  ClubBloc() {
    eventStream.listen((event) async{
      if(event == ClubGet.Fetch) {
        var clubInfo = await getClubs();
        clubSink.add(clubInfo.userClubs);
      }
    }); 
  }

  void flush() {
    _stateStreamController.close();
    _eventController.close();
  }

  Future <ClubModel> getClubs() async{
    const _baseUrl = 'shield.threedots.app';
    const String _clubsUrl = 'vision/v1/clubs/user';
    var client = http.Client();
    var newsModel;

    try {
      var response = await client.get('');
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

