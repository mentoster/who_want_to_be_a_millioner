
import 'package:get/get.dart';
import '../controllers/lose_controller.dart';


class LoseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoseController>(() => LoseController());
  }
}