import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/bloc/club-bloc.dart';
import 'package:test/screens/club-screen.dart';
import 'package:test/services/api-service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final clubbloc = ClubBloc();

  void flush() {
    clubbloc.flush();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder(
                stream: clubbloc.eventStream,
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    return Text(
                      '${snapshot.data}'
                       
                    );
                  }
                  if(snapshot.connectionState == ConnectionState.active) {
                    return CircularProgressIndicator();
                  }
                  else if(snapshot.hasError){
                    print(snapshot.error);
                  }
                  return CircularProgressIndicator();
                },
              )
            ]
          )
        )
      )
    );
  }
}
