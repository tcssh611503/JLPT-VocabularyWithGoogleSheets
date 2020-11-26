import 'package:flutter/material.dart';
import 'package:google_sheets_app/main.dart';
import 'package:google_sheets_app/views/prod.dart';
import 'package:google_sheets_app/views/home.dart';
import '../model/dataType.dart';

class  RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    //Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch(settings.name){
      case '/':
        // return MaterialPageRoute(builder: (_) => FirstPage());
        return MaterialPageRoute(builder: (_) => MyHomePage(title: 'japanese vocabulary Home'));
      case '/prod':
      //Validation of correct data type
        if(args is Data) {
          return MaterialPageRoute(
            builder: (_) => prod(
              data: args ,
            ),
          );
        }
        // If args is not of the correct type, return an error page
        // You can also throw an exception while in development 
        return _errorRoute();
      default:
        return _errorRoute();

    }
  }

    static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Error"),
          ),
          body: Center(
            child: Text("error"),
          )
      );
    });
  }

}
