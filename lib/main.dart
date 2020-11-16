import 'package:flutter/material.dart';
import 'views/prod.dart';
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
                  // without router
                  // onPressed: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => prod(),
                  //       ));
                  // },

                    onPressed:(){
                    //pushing a router directly , using a named route
                    Navigator.of(context).pushNamed(
                      '/prod',
                      // 路徑錯誤
                      // '/error',
                      arguments:  Data(homeList[index].kannji, homeList[index].gojuuon ,homeList[index].imi, homeList[index].sentence),
                      // 參數錯誤
                      // arguments:123456789
                    );
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
