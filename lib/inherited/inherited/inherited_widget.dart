import 'package:flutter/material.dart';
import 'package:sample_211203/inherited/inherited/stful_widget.dart';



//원래는 stful_widget과 한개 파일에 작성되나, 예시를 위해 나눠서 작성

class Inherited_Widget extends InheritedWidget{

  //StfulWidget의 appState를 property로 가지고 있음
  final StfulContainerState appState;

  Inherited_Widget({
    Key? key,
    required this.appState,
    required child,
  }):super(key:key, child:child);


  //InheritedWidget이 build() 될때마다 appState가 갱신되는데,
  //이때 기존에 갖고있던 appState와 비교해서 같으면?? (true를 return)
  //fultter 내부적으로 appState를 참조하는 하위 위젯들에서 didUpdateDependencies() 실행시켜 재 빌드되도록 함
  @override
  bool updateShouldNotify(covariant Inherited_Widget oldWidget) {
    return oldWidget.appState==this.appState;
  }






}