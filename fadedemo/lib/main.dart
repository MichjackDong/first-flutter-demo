import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Fade Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyFadeTest(title: 'Fade Demo'),
    );
  }
}

class MyFadeTest extends StatefulWidget {
  MyFadeTest({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyFadeTest createState() => new _MyFadeTest();
}

class _MyFadeTest extends State<MyFadeTest> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    controller = new AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
          child: new Container(
              child: new FadeTransition(
                  opacity: curve,
                  child: new FlutterLogo(
                    size: 100.0,
                  )
              )
          )
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Fade',
        child: new Icon(Icons.brush),
        onPressed: () {
          controller.forward();
        },
      ),
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }
}


class SignaturePainter extends CustomPainter {
    SignaturePainter(this.points);

    final List<Offset> points;

    void paint(Canvas canvas, Size size){
      var paint = new Paint()
        ..color = Colors.black
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 5.0;
      for(int i = 0; i < points.length - 1; i++){
        if(points[i] != null && points[i + 1] != null)
          canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
    bool shouldRepaint(SignaturePainter other) => other.points != points;
}

class Signature extends StatefulWidget{

  SignatureState createState() => new SignatureState();
}

class SignatureState extends State<Signature> {

  List<Offset> _points = <Offset>[];

  Widget build(BuildContext context) {
    return new GestureDetector(
      onPanUpdate: (DragUpdateDetails details){
        setState((){
          RenderBox refreshCeBox = context.findRenderObject();
          Offset localPosition =
          refreshCeBox.globalToLocal(details.globalPosition);
          _points = List.castFrom(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) =>  _points.add(null),
      child: new CustomPaint(painter:  new SignaturePainter(_points), size: Size.infinite),
    );


  }
}











