import 'package:flutter/material.dart';
import 'views/prod.dart';
import 'controller/controller.dart';
import 'model/dataType.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'japanese vocabulary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'japanese vocabulary Home'),
      debugShowCheckedModeBanner: false,
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // 宣告一個叫homeList的DataList物件
  List<DataList> homeList = List<DataList>();

  @override
  //get Data
  void initState() {
    super.initState();

    GetDataController().getDataListFu().then((dataList) {
      setState(() {
        this.homeList = dataList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
        body: ListView.builder(
        itemCount: homeList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: <Widget>[
                // Icon(Icons.person),
                Expanded(
                  child: Text(
                      "${homeList[index].kannji} (${homeList[index].gojuuon})"),
                )
              ],
            ),
            subtitle: Row(
              children: <Widget>[
                Icon(Icons.message),
                Expanded(
                  child: Text(homeList[index].sentence),
                ),
                RaisedButton(
                  color: Colors.lightBlueAccent,
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => prod(),
                        ));
                  },
                  child: Text('詳細'),
                )
              ],
            ),

          );
        },
      )
                
    );
  }
}


///
