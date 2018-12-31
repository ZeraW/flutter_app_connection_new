import 'package:flutter/material.dart';
import 'package:flutter_app_connection/request.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fetch Data Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Fetch Data Example'),
          ),
          body: ResponsePost(),
        ));
  }
}
