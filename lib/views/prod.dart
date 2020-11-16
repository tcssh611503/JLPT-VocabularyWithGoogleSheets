import 'package:flutter/material.dart';

import '../controller/controller.dart';
import '../model/dataType.dart';

class prod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Feedback Responses',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FeedbackListPage(title: "Responses"),
        debugShowCheckedModeBanner: false,);
  }
}

class FeedbackListPage extends StatefulWidget {
  FeedbackListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FeedbackListPageState createState() => _FeedbackListPageState();
}

class _FeedbackListPageState extends State<FeedbackListPage> {
  List<DataList> feedbackItems = List<DataList>();

  // Method to Submit Feedback and save it in Google Sheets

  @override
  void initState() {
    super.initState();
    //getData
    GetDataController().getDataListFu().then((result) {
      setState(() {
        this.feedbackItems = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '繋がる',
            style: TextStyle(fontSize: 16.0, color: Colors.grey[900]),
          ),
          Text(
            '噛み付く',
            style: TextStyle(fontSize: 16.0, color: Colors.grey[900]),
          ),
          Text(
            '満つ',
            style: TextStyle(fontSize: 16.0, color: Colors.grey[900]),
          ),
          Text(
            '庇う',
            style: TextStyle(fontSize: 16.0, color: Colors.grey[900]),
          ),
          Text(
            '臨む',
            style: TextStyle(fontSize: 16.0, color: Colors.grey[900]),
          ),
          Text(
            '構う',
            style: TextStyle(fontSize: 16.0, color: Colors.grey[900]),
          ),
          Text(
            '関わる',
            style: TextStyle(fontSize: 16.0, color: Colors.grey[900]),
          ),
        ],
      ),
    );
  }
}
