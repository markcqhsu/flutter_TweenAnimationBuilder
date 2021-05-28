import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _big = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          //代表會在一秒鐘的時間內, 補充0.0~1.0的數字
          //也代表TweenAnimationBuilder會在一秒鐘內不停地呼叫builder

          duration: Duration(seconds: 1),
          //如果想要begin&end的值相同, 可以直接不傳begin, 只傳end
          tween: Tween(end: _big ? 172.0 : 72.0),
          builder: (BuildContext context, Object value, Widget child) {
            //Widget child 在這邊是用來優化用的
            return Container(
              width: 300,
              height: 300,
              color: Colors.blue,
              child: Center(
                // child: Transform.scale(  //縮放
                // child: Transform.rotate( //旋轉
                // child: Transform.translate(   //平移
                // scale: value,//縮放用參數
                // angle: value,//旋轉用參數
                // offset: Offset(10, 0),//平移用參數
                child: Text(
                  "hi",
                  style: TextStyle(fontSize: value),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _big = !_big;
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
