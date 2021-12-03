import 'package:equatable/equatable.dart';



abstract class CounterEvent extends Equatable {
  const CounterEvent();

  //Equatable : props에 들어가는 값들이 인스턴스간 equals(==) 판단의 기준이 되도록 만들어줌
  @override
  List<Object> get props => [];

}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}
