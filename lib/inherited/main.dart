import 'package:flutter/material.dart';
import 'package:sample_211203/inherited/inherited/stful_widget.dart';

void main(){
  //InheritedWidget 사용을 위해 runApp의 매개변수로
  // Inherited_Widget과 연결된 StfulContainer로 감싸고 child로 myApp을 매개로 줌
  print("runApp");
  runApp(
    StfulContainer(
      child:myApp(),
    )
  );
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 기존 코드
  // int _counter = 0; //state에서 counter int 변수를 가지고 있음
  //
  // counter 변화시킬 경우 _increamentCounter 호출해서 setState()
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  //변경 : int 변수 (Inherited_Widget에서 가져다 씀), setState 불필요 (AppState에서 setState를 갖는 함수 호출)
  int? _counter;
  AppState? state;

  @override
  void initState() {
    print("_MyHomePageState initState");
    _counter = 0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    state = StfulContainer.of(context, "_MyHomePageState - didChangeDependencie");
    _counter = state?.count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${StfulContainer.of(context,"Text")?.count}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>state?.addCount(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}