import 'package:get/get.dart';

class CountController extends GetxController{
  int count = 0;


  void incrementCounter() {
    print("getX, increamentCounter");
   count++;
   update();
  }
}