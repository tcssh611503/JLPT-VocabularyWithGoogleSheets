import 'package:flutter/material.dart';
import 'controller/controller.dart';
import 'model/dataType.dart';
import 'config/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'japanese vocabulary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //old
      // home: MyHomePage(title: 'japanese vocabulary Home'),
      //use router
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}


