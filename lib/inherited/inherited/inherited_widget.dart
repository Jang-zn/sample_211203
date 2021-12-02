import 'package:flutter/material.dart';
import 'package:sample_211203/inherited/inherited/stful_widget.dart';



//원래는 stful_widget과 한개 파일에 작성되나, 예시를 위해 나눠서 작성

class Inherited_Widget extends InheritedWidget{

  //StfulWidget의 appState를 property로 가지고 있음
  final AppState appState;

  Inherited_Widget({
    Key? key,
    required this.appState,
    required child,
  }):super(key:key, child:child);


  //InheritedWidget이 build() 될때마다 appState가 갱신되는데,
  //이때 기존의 oldWidget을 매개변수로 updateShouldNotify를 실행시키게 되고,
  //기존에 갖고있던 appState와 비교해서 다르면 (true를 return)
  //fultter 내부적으로 appState를 참조하는 하위 위젯들에서 didUpdateDependencies() 실행시켜 재 빌드되도록 함

  //근데 얘 왜이럼? old랑 new랑 걍 똑같음.. 질문
  @override
  bool updateShouldNotify(Inherited_Widget oldWidget) {
    bool result = oldWidget.appState.count==appState.count;
    //print("${appState.buildtime}");
    //print("${oldWidget.appState.buildtime}");
    print("updateShouldNotify : $result");
    return result;
  }
}