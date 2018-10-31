import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'My App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulBuilder {

  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends  State<SampleAppPage> {
  bool toggle = true;

  void _toggle() {
    setState((){
      toggle = !toggle;
    });
  }
  _getToggleChild(){
    if (toggle) {
      return new Text('Toggle One');
    }else {
      return  CupertinoButton(
        onPressed: () {},
        child: new Text('Toggle Two'),
      );
    }
  }
  @override
  Widget build(BuildContext context) {

  }
}