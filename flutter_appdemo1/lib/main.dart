import 'package:flutter/material.dart';

void main() => runApp(new SampleApp());

class SampleApp extends StatelessWidget {
  @override

  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}
class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();

}

class _SampleAppPageState extends State<SampleAppPage> {
  String textToshow = "I Like Flutter";
  void _updateText() {
    setState(() {
      textToshow = "Flutter Test";
    });
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sample App'),
      ),
      body: new Center(child: new Text(textToshow)),
      floatingActionButton: new FloatingActionButton(
          onPressed: _updateText,
          tooltip: 'update text',
          child: new Icon(Icons.update),
      ),
    );

  }
}
