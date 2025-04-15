import 'package:get/instance_manager.dart';

import '../../controller/HomeController.dart';

class HomeBinding implements Bindings {
  // هو كلاس مسؤول عن ربط HomeController بالتطبيق.
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(city: 'Ataq'));
  }
}
