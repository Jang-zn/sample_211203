import 'package:get/get.dart';

class CountController extends GetxController{
  //observable 변수 선언
  RxInt count = 0.obs;

  void incrementCounter() {
    print("getX-reactive, increamentCounter");
   count++;
  }

  @override
  void onInit() {
    once(count, (_) {
      print("$_ 첫변경");
    });
    ever(count, (_) {
      print('$_ 변경');
    });
    debounce(
      count,
          (_) {
        print('$_ 마지막 변경 후, 3초 지남.');
      },
      time: Duration(seconds: 3),
    );
    interval(
      count,
          (_) {
        print('$_가 변경되는 중입니다.(0.05초마다 호출)');
      },
      time: Duration(milliseconds: 50),
    );
  }
}