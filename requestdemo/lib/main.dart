import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context){
    return new MaterialApp(
      title: '网络请求',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyAppPage(),
    );
  }
}

class MyAppPage extends StatefulWidget {
  MyAppPage({Key key}) :super(key: key);
  @override

  _MyAppPageState createState() => new _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  List widgets = [];

  @override

  void initState() {
    super.initState();
    loadData();
  }

  showLoadingDialog(){
    return widgets.length == 0;
  }

  getBody() {
    if (showLoadingDialog()){
      return getProgressDialog();
    } else {
      return getListView();
    }
  }
  getProgressDialog() {
    return new Center(child: new CircularProgressIndicator());
  }
  @override

  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('网络请求'),
      ),
      body: getBody());
  }

  ListView getListView() => new ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      });

  Widget getRow(int i) {
    return new Padding(
      padding:new EdgeInsets.all(10.0),
      child: new Text('Row ${widgets[i]["title"]}')
    );
  }

  loadData() async{
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState((){
     widgets = json.decode(response.body);
    });
  }
}
