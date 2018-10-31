import 'dart:convert';//集成json utf-8等数据格式的编码和解码器
import 'dart:io';//集成了File， Socket。 Http等服务应用的IO库
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context){
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _ipAddress = 'Unknow';
  //异步执行用到async关键字
  _getIPAddress() async {
    var url = 'http://op.juhe.cn/onebox/weather/query?cityname=上海&key=[替换成你的AppKey]';
    var httpClient = new HttpClient();
    String result;
    try{
      var request = await httpClient.postUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK){
        var json = await response.transform(Utf8Decoder).join();
        var data = JSON.decode(json);
        result = data['result']['data']['realtime'].toString();
      } else {
        result ='Error get:\nHttp status ${response.statusCode}';
      }

    }catch (exception){
      result ='Failed getting data';
    }
    if (!mounted)return;

    setState((){
      _ipAddress = result;
    });
  }
  @override
  Widget build(BuildContext context){
    var spacer = new SizedBox(height: 32.0);
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
                onPressed: _getIPAddress,
                child: new Text('获取天气预报'),
            ),
            new Text('$_ipAddress.'),
            spacer,
          ],
        ),
      ),
    );
  }
}