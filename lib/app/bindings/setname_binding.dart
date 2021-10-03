
import 'package:get/get.dart';
import '../controllers/setname_controller.dart';


class SetnameBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetnameController>(() => SetnameController());
  }
}