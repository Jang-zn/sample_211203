import 'package:flutter/material.dart';
import 'inherited_widget.dart';


//StfulContainer는 child 프로퍼티로 앱 전체 위젯을 가지고 있음 *(runApp에서 매개변수로 myApp 줌)
//StfulContainerState는 build될때마다 Inherited_Widget을 반환하며, 이를 통해 Inherited_Widget의 State가 갱신되면 참조중인 하위 위젯들에
//업데이트를 지시할 수 있음

class StfulContainer extends StatefulWidget {
  const StfulContainer({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  AppState createState() => AppState();

  //Inherited_Widget의 참조를 위한 .of(context) 메소드
  //하위 위젯에서 Inherited_Widget의 State를 공유하고, 참조하기 위한 메소드임.
  //String name은 예시를 위해 사용
  static AppState of(BuildContext context, String name){
    print("of() method : $name 에서 InheritedWidget-AppState을 참조합니다");
    return context.dependOnInheritedWidgetOfExactType<Inherited_Widget>()!.appState;
  }
}


class AppState extends State<StfulContainer> {

  @override
  void initState() {
    count = 0;
    buildtime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    print("InheritedWidget AppState Build");
    print("build : $buildtime");

    //build 메소드를 통해 Inherited_Widget을 갱신
    return Inherited_Widget(
      child : widget.child, //앱 전체(myApp)
      appState : this, //자기 자신 (AppState)
    );
  }

  late int count;
  late DateTime buildtime;
  void addCount(int? num){
    setState(() {
      print("addCount 실행  - AppState setState");
      count+=num!;
      buildtime = DateTime.now();
    });
  }
}

