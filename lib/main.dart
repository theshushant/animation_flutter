import 'package:animation/route_transition.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController animationController;
  AnimationController animationController1;
  Animation<double> animation;
  Animation<double> animation1;

  @override
  void initState() {
    super.initState();
    animationController1 = AnimationController(
        vsync: this,
        duration: Duration(
          seconds: 5,
        ))
      ..addListener(() {
        if (animationController1.status == AnimationStatus.completed) {
          animationController1.repeat();
        }
      });

    animation1 = CurvedAnimation(
      curve: Curves.easeIn,
      parent: animationController1,
      reverseCurve: Curves.easeOut,
    );
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..addListener(() => setState(() {
          if (animationController.status == AnimationStatus.completed) {
            //   animationController.repeat();
          }
        }));

    animation = CurvedAnimation(
        parent: animationController,
        curve: Curves.linear,
        reverseCurve: Curves.linearToEaseOut);
    animationController1.forward();
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
        turns: animation,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: RotationTransition(
              turns: animation1,
              child: Transform(
                transform: Matrix4.skewY(0.3)..rotateZ(3.14 / 12.0),
                origin: Offset(50.0, 50.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context, RouteTransition(page: Animation1()));
                  },
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

class Animation1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Animation1state();
  }
}

class Animation1state extends State<Animation1> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.red,
        ),
      ),
    );
  }
}
