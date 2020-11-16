import 'package:flutter/material.dart';
import 'package:google_sheets_app/main.dart';
import '../controller/controller.dart';
import '../model/dataType.dart';

class prod extends StatelessWidget {

   final Data data;

     prod({
    Key key,
    @required this.data,
  }) :super(key:key);



  String gojuuon;
  String imi;
  String sentence;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Feedback Responses',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FeedbackListPage(title: data.kannji ,  gojuuon: data.gojuuon,  imi:data.imi , sentence:data.sentence),
        debugShowCheckedModeBanner: false,);
  }
}

class FeedbackListPage extends StatefulWidget {
  FeedbackListPage({Key key, this.title , this.gojuuon ,this.imi, this.sentence}) : super(key: key);

  final String title ;  
  final String gojuuon;
  final String imi;
  final String sentence;

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
                // RaisedButton(
                //   color: Colors.lightBlueAccent,
                //   textColor: Colors.black,
                //   // without router
                //   // onPressed: () {
                //   //   Navigator.push(
                //   //       context,
                //   //       MaterialPageRoute(
                //   //         builder: (context) => prod(),
                //   //       ));
                //   // },
                // onPressed:(){
                //   //pushing a router directly , using a named route
                //     MaterialPageRoute(
                //       builder: (context) =>
                //         MyHomePage(title: 'japanese vocabulary Home'),
                //     );
                // } , 
                //   child: Text('回首頁'),
                // ),
          Text(
            widget.gojuuon,
            style: TextStyle(fontSize: 16.0, color: Colors.grey[900]),
          ),
          Text(
            widget.sentence,
            style: TextStyle(fontSize: 16.0, color: Colors.grey[900]),
          ),
          
         
        ],
      ),
    );
  }
}


